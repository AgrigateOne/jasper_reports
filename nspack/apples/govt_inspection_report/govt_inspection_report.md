# Govt Inspection report

## Description

Govt Inspection report represents a list of inspected pallets.
It can either be a passed govt inspection sheet or a failed govt inspection sheet.
This report is for the apples industry

## Generating the report

The report can be generated:

* Finished goods | Inspection | Govt Inspection sheets
* From an inspection sheet  - click on the "Govt Inspection report" button.


## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Implementation owner address| Info related to the implemenation owner | `party role address.jasper`  using delivery address of implementation owner |
|Billing| Info related to the billing party | `party role address.jasper`  using delivery address of the inspection billing party of the govt inspection sheet|
|Exporter|Info related to the exporter  |`party role address.jasper` using delivery address of the exporter party of the govt inspection sheet  |
|Waybill|The document number  |`govt_inspection_sheets.consignment_note_number` ,appended with an F if it is a failed inspection  |
|Inspector name|The govt inspector's name  |person `first and last name`  of the inspector party role |
|Inspection date| Date of inspection | `govt_inspection_sheets.created_at` |
|Inspection point|Point of inspection  | the first of: `govt_inspection_sheets.inspection_point` OR  `pallets.edi_in_inspection_point` that has a value |
|Intake date|Date when this consignment was inspected  | `ovt_inspection_sheets.created_at` |
|Truck No|Truck number  |empty  |
|Order| Order number |`pallet_sequences.marketing_order_number`  |
|Rejections|Number of failed pallets  |Number of failed pallets if it is a failed inspection  |
|Is reinspection |Value denotating if it is a reinspection|Yes if the govt inspection sheet is marked as reinspected|
|Remarks| Remarks |empty  |
|Depot|Depot  |empty |
|Total| Total number of pallets on the govt inspection sheet |Total number of pallets on the govt inspection sheet  |
|Total cartons|Total number of cartons on the govt inspection sheet  | sum of all cartons on pallets on the sheet |
|GG|Global Gap code  | `pucs.gap_code` |
|Gap Certification|Gap Certification sta{edi_size_count}tus|'global gap certified' if govt_inspection_sheets.created_at is between pucs.gap_code_valid_from AND pucs.gap_code_valid_until|
|UPN| UPN  |`govt_inspection_sheets.upn`  |
## Report Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Com|The commodity of the fruit on the sheet  | `commodities.code` |
|Var|Pallet fruit variety | the first of `marketing_varieties.marketing_variety_code`or `marketing_varieties.inspection_variety` that has a value | 
|Pack| Standard pack code | `standard_pack_codes.standard_pack_code` |
|Class|The grade of each pallet on this sheet   | `grades.grade_code` |
|Cnt|The actual fruit count that fits in a standard box  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value |
|Size|Fruit size reference  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value  |
|IC|Inventory code  | pallet sequence `inventory_codes.inventory_code` |
|Mark|Code marks officially recognized by national authorities for fresh fruit and vegetable exports |pallet sequence `marks.mark_code`  |
|TM|Target market  | `target_markets.target_market_name` if target_markets.inspection_tm has a value else  `target_market_groups.target_market_group_name` is displayed  |
|TC|ISO country code of the destination country  | `destination_countries.iso_country_code` |
|TR| Target region | `destination_regions.destination_region_name` |
|Farm| Farm where fruit came | `farms.farm_code)` |
|Ctns|The number of cartons on a pallet  | `pallet_sequences.carton_quantity` |
|Plts|Pallet size  | `pallet_sequences.carton_quantity` / `pallets.carton_quantity` |
|Base|Pallet Base  | `pallet_bases.pallet_base_code` |
|PHC| Packhouse code |`pallets.phc`  |
|Orch| The section on the farm where fruit was obtained | `orchards.orchard_code` |
|Phyto data|Pallet sequence phyto data value  | `pallet_sequences.phyto_data` |
|Barcode| Pallet barcode ID|Unique string that identifies each pallet | `pallets.pallet_number` |
|Total cartons| Total number of cartons on the sheet | sum of all cartons on pallets on the sheet |
|Total pallets|Total number of pallets on the sheet  | count of pallets on the sheet |
## Inspection summary subreport
| Label | Description | Source |
| ----- | ----------- | ------ |
|Comm|commodity of the fruit on the sheet  | `commodities.code` |
|Variety|Pallet fruit variety  |the first of `marketing_varieties.marketing_variety_code`or `marketing_varieties.inspection_variety` that has a value|
|Pack| Standard pack code | `standard_pack_codes.standard_pack_code` |
|Grade|The grade of each pallet on this sheet   | `grades.grade_code` |
|Cnt|The actual fruit count that fits in a standard box  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value |
|Size|Fruit size reference  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value   |
|Ctns|Total number of cartons of all groups on the sheet  | sum of all cartons on pallets on the sheet|
|Plts|Total number of pallets of all groups on the sheet |  count of pallets on the sheet  |

