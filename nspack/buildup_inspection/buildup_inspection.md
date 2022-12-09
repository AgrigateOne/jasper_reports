# Buildup Inspection report

## Description
This report summarizes buildup of inspected pallets

## Generating the report
The report can be generated:
Finished goods | Loads | List Loads
* From a load |  - click on the "Print Delivery" button.

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|delivery_id|Rmt delivery id | rmt_deliveries.id |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Exporter|Exporter name  |  |
|Billing client |Billing client name  ||
| Customer | Customer | |
| Consignee |Consignee  | |
| Dispatch note | Dispatch note number |  |
| Vessel |Vessel name  | `vessels.vessel_code` |
| Container code | Container code where ther load is loaded  | `load_containers.container_code` |
| Container seal | Container seal code   | |
| Customer |Customer |  |
| Shipper | Shipper | |
| Booking ref |Booking reference  |  |
| Remark |Remarks on the load  |  |
| Export party |Exporter name  |   |
| Voyage no. |Voyage number  | `voyages.voyage_number` |
| Haulier |Transprter of the load  | `organizations.medium_description` of the haulier on the load |
| Vehicle Reg | Vehicle Registration number  |`load_vehicles.vehicle_number`  | 
| Vehicle Wgt |Vehicle of loeaded weight  | `load_vehicles.vehicle_weight_out` |
| Shipping line | Shipping line name  |  |
| Temp Settings | Container code and cargo temperature | |
| Cust Order | Customer Order number | `loads.customer_order_number` |
| Port name | Port of discharge | |
| Depart port |Port of loading  |  |
| Receive |Depot code  | `depots.depot_code` |
| Temp rhine |Carrying container temperature on the sea  | `load_containers.container_temperature_rhine` |
| Temp rhine 2 | Carrying container temperature on the sea  | `load_containers.container_temperature_rhine2` |
## Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|New Pallet Number| Pallet Number |`pallets.pallet_number`  |
|Destination Pallet Number| Destination Pallet Number |`pallet_buildups.destination_pallet_number`  |
|Destination Gov Sheet|Destination Government Inspection Sheet  |`govt_inspection_pallets.destination_gov_sheet_id`  |
|Source Pallets| Source Pallets |`pallet_buildups.source_pallets`  |
|Source Gov Sheet|Source Government Inspection Sheet  |`govt_inspection_pallets.govt_inspection_sheet_id`  |
|Qty Ctns To Move|Quantity of cartons moved from source pallet  |`pallet_buildups.qty_cartons_to_move`  |
|Cartons Moved| Carton Ids of moved cartons to new pallet |`pallet_buildups.cartons_moved `  |
|Completed At| Completion time of pallet move |`pallet_buildups.completed_at`  |
|Load| Load id |`pallets.load_id`  |
|Container Code|Container code  |`load_containers.container_code`  |
## Report Footer
| Label | Description | Source |
| ----- | ----------- | ------ |
|Shipped Date Time|Date when load was shipped  |`loads.shipped_at`  |
|Files|Files  | |
|Approved By| Name of person who approves this report |manually filled in  |
|Driver|Driver of the loaded truck  |`load_vehicles.driver_name`|
|Driver Cell| Cellphone number of Driver |`load_vehicles.driver_cell_number`  |


