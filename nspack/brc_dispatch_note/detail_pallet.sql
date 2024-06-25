WITH plt_qty as  (
    select   pallets.pallet_number,pallet_sequences.pallet_sequence_number,
             count(distinct pallets.id) as plt_qty,
             rank() OVER (PARTITION BY pallets.pallet_number ORDER BY pallet_sequences.pallet_sequence_number) AS rank
    FROM pallets
             JOIN pallet_sequences ON pallet_sequences.pallet_id = pallets.id
    WHERE pallets.load_id = $P{load_id} and pallet_sequences.pallet_number in ('360092320000063864','360092320000063871','360092320000063901','360092320000063659')
group by pallets.pallet_number,pallet_sequences.pallet_sequence_number
    )
        ,
    ggn_validation AS (
SELECT DISTINCT
    p.id AS p_id, ps.id AS ps_id,pucs.gap_code_valid_from,pucs.gap_code_valid_until,
    CASE WHEN pucs.gap_code IS NULL THEN NULL
    WHEN pucs.gap_code IS NOT NULL AND current_date BETWEEN pucs.gap_code_valid_until AND pucs.gap_code_valid_from THEN
    pucs.gap_code
    ELSE
    'EXPIRED'
    END gap_code
FROM pallets p
    JOIN pallet_sequences ps ON ps.pallet_id = p.id
    LEFT JOIN pucs ON pucs.id = ps.puc_id
WHERE
    p.load_id = $P{load_id}
    )
select fn_edi_size_count(standard_pack_codes.use_size_ref_for_edi, commodities.use_size_ref_for_edi, fruit_size_references.edi_out_code, fruit_size_references.size_reference, fruit_actual_counts_for_packs.actual_count_for_pack) AS edi_size_count,
       pallet_sequences.pallet_number,pallet_sequences.pallet_sequence_number
        ,orchards.orchard_code AS orchard,cultivars.cultivar_name,coalesce(marketingpuc.puc_code ,pucs.puc_code) AS puc,
       sum(pallet_sequences.carton_quantity)carton_quantity,
       fn_party_role_org_code(pallet_sequences.marketing_org_party_role_id) AS organization_code, -- ? OK?
       commodities.code AS commodity_code,
       coalesce(cvv.marketing_variety_code, marketing_varieties.marketing_variety_code) as variety_short_long,
       grades.grade_code,
       fruit_size_references.size_reference AS size_count_code,
       standard_pack_codes.standard_pack_code AS old_pack_code,
       marks.mark_code AS brand_code,
       pallet_sequences.pick_ref AS pick_reference,
       pallet_sequences.pick_ref AS encrypt_pick_ref,
       inventory_codes.inventory_code,
       COALESCE(target_markets.target_market_name,target_market_groups.target_market_group_name) AS  target_market_code,
       plt_qty.plt_qty,
       rank() OVER (PARTITION BY pallet_sequences.pallet_number ORDER BY pallet_sequences.pallet_sequence_number) AS rank,

        cargo_temperatures.temperature_code AS temp_tail,
       pallet_sequences.product_chars AS pt_product_characteristics,
       fruit_actual_counts_for_packs.actual_count_for_pack AS actual_size_count_code,
       sum(pallet_sequences.carton_quantity) AS ctn_qty,
       pallet_sequences.sell_by_code,
       pallet_bases.pallet_base_code AS edi_out_pallet_base,
       organizations.long_description AS org_long,
       pallets.phc AS line_phc,
       sum( pallets.nett_weight)nett_weight
        ,pallets.gross_weight
        ,(select sum(gross_weight)  from pallets p where p.load_id=pallets.load_id) load_gross_weight
        ,sum(pallet_sequences.nett_weight) as seq_nett_weight,
       pallet_sequences.phyto_data
        ,floor(fn_calc_age_days(max(pallets.id), COALESCE(pallets.govt_reinspection_at, pallets.govt_first_inspection_at), COALESCE(pallets.shipped_at, pallets.scrapped_at))) AS inspection_age
        ,STRING_AGG(DISTINCT pallet_sequences.pick_ref::TEXT,'; ') AS pick_references
        ,ggn_validation.gap_code
FROM pallets
         JOIN pallet_sequences ON pallet_sequences.pallet_id = pallets.id
         LEFT JOIN plt_qty on plt_qty.pallet_number = pallets.pallet_number and plt_qty.rank = 1 and plt_qty.pallet_sequence_number = pallet_sequences.pallet_sequence_number
         LEFT JOIN cultivar_groups ON cultivar_groups.id = pallet_sequences.cultivar_group_id
         LEFT JOIN commodities ON commodities.id = cultivar_groups.commodity_id
         JOIN marketing_varieties ON marketing_varieties.id = pallet_sequences.marketing_variety_id
         LEFT JOIN customer_varieties ON customer_varieties.id = pallet_sequences.customer_variety_id
         LEFT JOIN marketing_varieties cvv ON cvv.id = customer_varieties.variety_as_customer_variety_id
         JOIN marks ON marks.id = pallet_sequences.mark_id
         JOIN target_market_groups ON target_market_groups.id = pallet_sequences.packed_tm_group_id
         JOIN grades ON grades.id = pallet_sequences.grade_id
         JOIN basic_pack_codes ON basic_pack_codes.id = pallet_sequences.basic_pack_code_id
         LEFT JOIN standard_pack_codes ON standard_pack_codes.id = pallet_sequences.standard_pack_code_id
         LEFT JOIN fruit_size_references ON fruit_size_references.id = pallet_sequences.fruit_size_reference_id
         LEFT JOIN fruit_actual_counts_for_packs ON fruit_actual_counts_for_packs.id = pallet_sequences.fruit_actual_counts_for_pack_id
         LEFT JOIN party_roles ON party_roles.id = pallet_sequences.marketing_org_party_role_id
         LEFT JOIN organizations ON organizations.party_id = party_roles.party_id
         LEFT JOIN inventory_codes ON inventory_codes.id = pallet_sequences.inventory_code_id
         left JOIN pucs ON pucs.id = pallet_sequences.puc_id
         left JOIN pucs marketingpuc ON marketingpuc.id = pallet_sequences.marketing_puc_id
         LEFT JOIN loads ON loads.id = pallets.load_id
         LEFT JOIN load_vehicles ON load_vehicles.id = loads.load_vehicle_id
         LEFT JOIN load_containers ON load_containers.id = load_vehicles.load_container_id
         LEFT JOIN cargo_temperatures ON cargo_temperatures.id = load_containers.cargo_temperature_id
         LEFT JOIN pallet_formats ON pallet_formats.id = pallets.pallet_format_id
         LEFT JOIN pallet_bases ON pallet_bases.id = pallet_formats.pallet_base_id
         LEFT JOIN orchards ON orchards.id = pallet_sequences.orchard_id
         LEFT JOIN target_markets ON target_markets.id = pallet_sequences.target_market_id
         LEFT JOIN cultivars ON cultivars.id = pallet_sequences.cultivar_id
         LEFT JOIN ggn_validation ON pallet_sequences.id= ggn_validation.ps_id AND pallets.id = ggn_validation.p_id
WHERE pallets.load_id = $P{load_id} and pallet_sequences.pallet_number in ('360092320000063864','360092320000063871')
group by pallet_sequences.pallet_number,pallets.load_id,
    fn_party_role_org_code(pallet_sequences.marketing_org_party_role_id) ,
    commodities.code ,
    coalesce(cvv.marketing_variety_code, marketing_varieties.marketing_variety_code) ,
    grades.grade_code,
    fruit_size_references.size_reference,
    standard_pack_codes.standard_pack_code,
    marks.mark_code ,
    pallet_sequences.pick_ref,
    inventory_codes.inventory_code,
    target_market_groups.target_market_group_name ,
    coalesce(marketingpuc.puc_code ,pucs.puc_code) ,
    cargo_temperatures.temperature_code,
    pallet_sequences.product_chars ,
    fruit_actual_counts_for_packs.actual_count_for_pack ,
    pallet_sequences.sell_by_code,
    pallet_bases.pallet_base_code ,
    organizations.long_description ,
    pallets.phc ,
    pallets.gross_weight,plt_qty.plt_qty,pallet_sequences.pallet_sequence_number,
    pallet_sequences.phyto_data,  marketing_varieties.marketing_variety_code
        ,fn_edi_size_count(standard_pack_codes.use_size_ref_for_edi, commodities.use_size_ref_for_edi, fruit_size_references.edi_out_code, fruit_size_references.size_reference, fruit_actual_counts_for_packs.actual_count_for_pack)
        ,pallets.govt_reinspection_at, pallets.govt_first_inspection_at,pallets.shipped_at, pallets.scrapped_at,
    orchards.orchard_code,target_markets.target_market_name,cultivars.cultivar_name
        ,ggn_validation.gap_code
ORDER BY
    pallet_sequences.pallet_number,pallet_sequences.pallet_sequence_number,
    commodities.code,
    marketing_varieties.marketing_variety_code,
    grades.grade_code,
    fruit_size_references.size_reference,
    standard_pack_codes.standard_pack_code,
    marks.mark_code