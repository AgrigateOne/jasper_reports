WITH base_sql AS (
    SELECT
        contract_workers.personnel_number AS personnel_barcode_number,
        s.id AS shift_id,
        contract_workers.first_name || ' ' || contract_workers.surname AS party_name,
        s.start_date_time,
        s.end_date_time,
        day_night_or_custom AS shift_type_code,
        s.shift_type_id,
        count(cartons.id) AS carton_qty,
        sum(fruit_actual_counts_for_packs.actual_count_for_pack) fruit_qty_cwi,
        sum(fruit_actual_counts_for_packs.actual_count_for_pack*coalesce(inventory_codes.fruit_item_incentive_rate,0)) fruit_rand_cwi,
        contract_workers.id AS cw_id,
        COALESCE(shift_exceptions.running_hours, s.running_hours, ((EXTRACT(EPOCH FROM end_date_time) - EXTRACT(EPOCH FROM start_date_time)) / 60 / 60)) AS running_hours,
        string_agg(distinct inventory_codes.inventory_code,',' order by inventory_codes.inventory_code) as inv_codes,
        inventory_codes.fruit_item_incentive_rate,
        count( contract_workers.id) over (partition by s.id) as packers_shift
    FROM
        cartons
        LEFT JOIN carton_labels ON carton_labels.id = cartons.carton_label_id
        LEFT JOIN fruit_actual_counts_for_packs ON fruit_actual_counts_for_packs.id = cartons.fruit_actual_counts_for_pack_id
        LEFT JOIN (
            SELECT
                shifts.end_date_time,
                shifts.start_date_time,
                plant_resource_id,
                shifts.shift_type_id,
                shifts.id,
                day_night_or_custom,
                shifts.running_hours
            FROM
                public.shifts
                JOIN shift_types ON shifts.shift_type_id = shift_types.id) AS s ON carton_labels.created_at BETWEEN s.start_date_time
                AND s.end_date_time
                AND s.plant_resource_id = carton_labels.production_line_id
        LEFT JOIN public.contract_workers ON (cartons.contract_worker_id = contract_workers.id)
        LEFT JOIN public.shift_exceptions ON (contract_workers.id = shift_exceptions.contract_worker_id)
            AND (s.id = shift_exceptions.shift_id)
        LEFT JOIN public.inventory_codes  ON inventory_codes.id = cartons.inventory_code_id
  where s.id= $P{shift_id} 
        GROUP BY
        s.id,
        inventory_codes.fruit_item_incentive_rate,
        day_night_or_custom,
        s.shift_type_id,
        s.start_date_time,
        s.end_date_time,
        contract_workers.id,
        COALESCE(shift_exceptions.running_hours, s.running_hours, ((EXTRACT(EPOCH FROM end_date_time) - EXTRACT(EPOCH FROM start_date_time)) / 60 / 60)),
        s.start_date_time
    ORDER BY contract_workers.id DESC, s.start_date_time
),
calc_sql AS (
    SELECT
        base_sql.start_date_time,
        base_sql.end_date_time,
        base_sql.cw_id,
        base_sql.fruit_qty_cwi,
        base_sql.running_hours,
        base_sql.party_name,
        base_sql.personnel_barcode_number,
        base_sql.carton_qty,
        base_sql.fruit_item_incentive_rate,
        base_sql.shift_type_code,
        base_sql.inv_codes,
        base_sql.fruit_rand_cwi,
        sum(fruit_qty_cwi) over (partition by cw_id) total_fruit_cwi,
        sum(fruit_rand_cwi) over (partition by cw_id) total_fruit_rand_cwi,
    	sum(carton_qty) over (partition by cw_id) total_carton_cwi,
        sum(fruit_qty_cwi) over () total_fruit_shift,
    	sum(carton_qty) over () total_carton_shift,
    	sum(fruit_rand_cwi) over () total_fruit_rand_shift,
        rank() OVER (PARTITION BY base_sql.cw_id ORDER BY base_sql.fruit_item_incentive_rate) AS cw_rank,
        base_sql.shift_id,
        count(*) over (partition by base_sql.cw_id,base_sql.shift_id) cw_cnt      
    FROM
        base_sql
)
select calc_sql.*,
    CASE WHEN cw_rank = 1 THEN
        TRUE
    ELSE
        FALSE
    END cw_rank_boolean
FROM
    calc_sql order by cw_id,calc_sql.cw_rank;
