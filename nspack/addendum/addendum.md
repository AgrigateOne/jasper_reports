# Addendum report

## Description
Addendum report represents .............

## Generating the report

The report can be generated:
* From a load - click on the "China Phyto Report" button.
* From the `Finished Goods | Inspection | Phyto report` menu - select the pallets to appear on the report and press the save button in the grid header.

## Table Header
| Label | Description | Source |
| ----- | ----------- | ------ |
| Load sea port |Port of loading | `ports.port_code` |  
| Target Country | The country where the fruit is exported|`destination_countries.country_name`  |  
| Target Region |The region to where the fruit is destined | `destination_regions.destination_region_name` |  
| Port of entry |The port where the vessel discharges or unloads this shipment | `ports.port_code` |  
| Export Certificate Number |The exporting company customs code | `loads.exporter_certificate_code` |   
| Booking ref | The loading booking ref | `load_voyages.booking_reference` |   
| Vessel | Ship number | `vessels.vessel_code` |    
| Voyage number | Voyage number  | `voyages.voyage_code` |   
| Departure date | The date the load departs from the port of loading |  the first of:  pol_voyage_ports `actual time of departure` or  pol_voyage_ports `estimated time of departure`  that has a value |  
| Regime code | Temperature at time of loading | `cargo_temperatures.temperature_code` | 
## Table Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Producer(s)/PUC(s) | The unique code of the farm where fruit was obtained | `pucs.puc_code` |    
|Orchard | The section on the farm where fruit was obtained | `orchards.orchard_code` |    
|Phyto data | Pallet sequence phyto data value  | `pallet_sequences.phyto_data` |   
|PHC | The packhouse code where the fruit was packed | `pallets.phc` |    
|Production Area | The name of the region where the fruit was grown | `production_regions.inspection_region` |   
|Commodity |The commodity of the fruit on the load  | `commodities.code` |   
|Variety | Pallet fruit variety | the first of `marketing_varieties.marketing_variety_code`or `marketing_varieties.inspection_variety` that has a value |   
|Class/cat |Pallet grade  | `grades.grade_code` |   
|Container no. |The container number on which the load was loaded  | `load_containers.container_code` |  
|No. of cartons | Sum of cartons on the pallet | sum of `pallet_sequences.carton_quantity` |   
|Nett/Gross pallet weight |Nett weight of pallet  |Sum of  `pallet_sequences.nett_weight` |   
|Pallet ID |Pallet barcode ID   | `pallets.pallet_number` |   
|PPECB Inspection Date |The date the pallet was ibspected by PPECB  | first of `pallets.govt_reinspection_at` OR `pallets.govt_first_inspection_at` that has a value |   
|Stuff Date |The date the load was shipped from the packhouse  | `pallets.shipped_at` |   
|Inspection Manifest no |The number on the document that represents a batch of inspected pallets  | the first of: `govt_inspection_sheets.consignment_note_number` or `pallets.edi_in_consignment_note_number` that has a value |   
|Inspection Point |The   | the first of: `govt_inspection_sheets.inspection_point` OR  `pallets.edi_in_inspection_point` that has a value|   
|Total | Total number of cartons on the load | sum of all cartons on pallets on the load |   
|No. of pallets |Total number of pallets on the load  | count of pallets on the load | 
## Table Footer
| Label | Description | Source |
| ----- | ----------- | ------ |
|Name of forwarding agent |The shipper on the voyage where the load is on  | `organizations.medium description` of the shipper on the load voyage |  
|Date |Date the load is shipped |`pallets.shipped_at`  |  
|Place of issue of export certificate |  | manually filled in |   
|Name of Exporter |The exporter of the load  | `organizations.medium description` of the exporter on the load|  
| Name | Name of user who printed the report | user name  |


