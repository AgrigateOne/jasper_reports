

SELECT 
  public.load_containers.container_code
  , cast(public.load_containers.verified_gross_mass::int as text)||' KG' verified_gross_mass
  ,  public.load_containers.verified_gross_mass_date 
  ,  cast(public.load_containers.actual_payload::int as text)||' KG' actual_payload
  ,cast(public.load_containers.max_payload::int as text)||' KG' max_payload
  ,cast(public.load_containers.tare_weight::int as text)||' KG' tare_weight
  ,cast(public.load_containers.max_gross_mass::int as text)||' KG' max_gross_mass
  ,public.load_containers.id,
   public.vessels.vessel_code
,public.organizations.medium_description shipper_name
,departure_port.port_code as pol
,arrival_port.port_code as pod
,voyage_number,
load_containers.container_seal_code
FROM
  public.loads
  INNER JOIN public.load_containers ON (public.loads.id = public.load_containers.load_id)
  INNER JOIN public.load_voyages ON (public.loads.id = public.load_voyages.load_id)
  LEFT OUTER JOIN public.voyages ON (public.load_voyages.voyage_id = public.voyages.id)
  LEFT OUTER JOIN public.vessels ON (public.voyages.vessel_id = public.vessels.id)
  INNER JOIN public.load_orders ON (public.loads.id = public.load_orders.load_id)
  INNER JOIN public.orders ON (public.load_orders.order_id = public.orders.id)
  INNER JOIN public.parties_roles ON (public.orders.customer_party_role_id = public.parties_roles.id)
  INNER JOIN public.organizations ON (public.parties_roles.party_name = public.organizations.short_description)
  
 

LEFT JOIN ( SELECT r.port_code,
            t_1.id,
            r.departure_date,
            s.load_voyage_id
           FROM load_voyage_ports s
             JOIN load_voyages p_1 ON s.load_voyage_id = p_1.id
             JOIN loads t_1 ON p_1.load_id = t_1.id
             JOIN voyage_ports r ON s.voyage_port_id = r.id
             JOIN voyage_port_types q ON r.voyage_port_type_id = q.id
          WHERE q.voyage_port_type_code::text = 'Departure'::text) departure_port ON load_voyages.id = departure_port.load_voyage_id
     LEFT JOIN ( SELECT r.port_code,
            t_1.id,
            r.departure_date,
            s.load_voyage_id
           FROM load_voyage_ports s
             JOIN load_voyages p_1 ON s.load_voyage_id = p_1.id
             JOIN loads t_1 ON p_1.load_id = t_1.id
             JOIN voyage_ports r ON s.voyage_port_id = r.id
             JOIN voyage_port_types q ON r.voyage_port_type_id = q.id
          WHERE q.voyage_port_type_code::text = 'Arrival'::text) arrival_port ON load_voyages.id = arrival_port.load_voyage_id

           where public.load_containers.id=$P{load_container_id}