# Dispatch Picklist

## Description
Dispatch Picklist  contains a detailed listing of all pallets on a load.


## Generating the report
* Finished Goods | Dispatch | List Loads
       * From a load - click on the "Dispatch Picklist" button.
       * Select "Potrait"

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|load_id |load id|loads.id  |
|pallet_report |Denoting to report details| It is either 'detailed' or 'summary' |
|for_picklist |Denoting to report type  |The same report is returned either a picklist or dispatch note  |
|cartons_equals_pallets |At some clients cartons are treated as pallets|It is either true or false  |
|hide_dispatch_summary |Depending on the report detail, the summary will be hidden or displayed|It is either true or false  |
## Table Header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Implementation owner address| Info related to the implemenation owner | `party role address.jasper`  using delivery address of implementation owner|
|Customer Address|Info related to the customer party  | `party role address.jasper`  using delivery address of the customer party of the load |
|Exporter|Exporter name  | `organizations.medium_description` of the exporter on the load |
|Billing client |Billing client name  |`organizations.medium_description` of the billing client on the load|
| Customer | Customer | `organizations.medium_description` of the customer on the load |
| Consignee |Consignee  | `organizations.medium_description` of the consignee on the load |
| Dispatch note | Dispatch note number | 'DN' + `loads.id` |
| Vessel |Vessel name  | `vessels.vessel_code` |
| Container code | Container code where ther load is loaded  - hidden when parameter 'for_picklist' is true | `load_containers.container_code` |
| Container seal | Container seal code  - hidden when parameter 'for_picklist' is true | `load_containers.container_seal_code` |
| Customer |Customer | `organizations.medium_description` of the customer on the load |
| Shipper | Shipper | `organizations.medium_description` of the shipper on the load |
| Booking ref |Booking reference  | `load_voyages.booking_reference` |
| Remark |Remarks on the load  | `load_voyages.memo_pad` |
| Export party |Exporter name  | `organizations.medium_description` of the exporter on the load  |
| Voyage no. |Voyage number  | `voyages.voyage_number` |
| Haulier |Transprter of the load  - hidden when parameter 'for_picklist' is true | `organizations.medium_description` of the haulier on the load |
| Vehicle Reg | Vehicle Registration number  - hidden when parameter 'for_picklist' is true|`load_vehicles.vehicle_number`  | 
| Vehicle Wgt |Vehicle of loeaded weight  - hidden when parameter 'for_picklist' is true  | `load_vehicles.vehicle_weight_out` |
| Shipping line | Shipping line name  | `organizations.medium_description` of the shipping line on the load |
| Temp Settings | Container code and cargo temperature  - hidden when parameter 'for_picklist' is true | `load_containers.internal_container_code`  + `cargo_temperatures.temperature_code`|
| Cust Order | Customer Order number | `loads.customer_order_number` |
| Port name | Port of discharge | pod voyage_ports.port_code |
| PO file | PO document name | `loads.edi_file_name` |
| Depart port |Port of loading  | pol voyage_ports.port_code |
| Receive |Depot code  | `depots.depot_code` |
| Temp rhine |Carrying container temperature on the sea  - hidden when parameter 'for_picklist' is true | `load_containers.container_temperature_rhine` |
| Temp rhine 2 | Carrying container temperature on the sea   - hidden when parameter 'for_picklist' is true| `load_containers.container_temperature_rhine` |
| Load ID | Load id | `loads.id` |
| Cons No |Dispatch consignment note number  | `govt_inspection_sheet.consignment_note_number` |
| Order number | Order number | `loads.order_number` |
| Load Order |Load id  | `loads.id` |
## Subreport: Pallet Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
| Com |Fruit commodity  | `commodities.code` |
| Var| Fruit Variety | the first of: customer marketing variety or `marketing_varieties.marketing_variety_code` that has a value |
| Pack |Old pack code  | `standard_pack_codes.standard_pack_code` |
| Mark |Mark code  | `marks.mark_code` |
| Org | Marketing organization | organizations.medium description of the marketing org selected on the load|
| Sell | Sell by code | `pallet_sequences.sell_by_code` |
| Grade |Grade  | `grades.grade_code` |
| Size/Count |Fruit count that fits in a standard box  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value |
| Nett |Sequence nett weight  | `sum(pallet_sequences.nett_weight)` |
| Gross |Pallet gross weight | `pallets.gross_weight` |
| TM |Target market  | ` target_market_groups.target_market_group_name` |
| Inv | Inventory code | `inventory_codes.inventory_code` |
| PUC |Puc  | the first of marketing puc or pucs.puc_code |
| Phyt |Phyto data  | `pallet_sequences.phyto_data` |
| Insp age |Inspection age  | fn_calc_age_days: the first of:`pallets.shipped_at`or`pallets.scrapped_at` that has a value minus the first of:`pallets.govt_reinspection_at` or `pallets.govt_first_inspection_at` that has a value  |
| Ctns |Carton quantity | `sum(pallet_sequences.carton_quantity)` |
| Plts |Number of pallets on the load | count of pallets on the load |
| Pallet Barcode | Pallet number | `pallets.pallet_number` |
| Shipped Date time |Shipped date time  of load| `loads.shipped_at` |
| Files | Edi out files | `edi_out_transactions.edi_out_filename` |
## Subreport:  Dispatch Summary
| Label | Description | Source |
| ----- | ----------- | ------ |
| Com |Fruit commodity  | `commodities.code` |
| Var|Fruit variety  | `marketing_varieties.marketing_variety_code` |
| Pack |Old pack code  | `standard_pack_codes.standard_pack_code` |
| Size/Count |Fruit count that fits in a standard box  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value |
| Ctns |Carton quantity | `sum(pallet_sequences.carton_quantity)` |
| Bins/Plts (Label caption is Bins if cartons_equals_pallets else it Plts )| Pallet size| pallet_sequences.carton_quantity/pallets.carton_quantity|
| Nett |Sequence nett weight  | `sum(pallet_sequences.nett_weight)` |
| Gross |Pallet gross weight  - displayed if parameter 'hide_dispatch_summary' is true| `pallets.gross_weight` |
| Fruit |The total amount of individual fruit on the load  | SUM(fruit_actual_counts_for_packs.actual_count_for_pack * pallet_sequences.carton_quantity) |
## Subreport:  Target Market Summary
| Label | Description | Source |
| ----- | ----------- | ------ |
| Grade |Grade  | `grades.grade_code` |
| Size/Count | Fruit count that fits in a standard box  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value  |
| TM |Target Market  | `target_market_groups.target_market_group_name` |
| Total |Pallet size| pallet_sequences.carton_quantity/pallets.carton_quantity|
## Report Footer
| Label | Description | Source |
| ----- | ----------- | ------ |
| Driver |Vehicle driver name  | `load_vehicles.driver_name` |
| Driver cell | Vehicle driver cell number | `load_vehicles.driver_cell_number` |
