# Govt Finding Sheet report

## Description
This report represents the findings of inspection by the government.

## Generating the report
The report can be generated:

* Finished Goods | Inspection | List Govt Inspection Sheets
* From a govt_inspection_sheet  - click on the "Print Finding Sheet" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
| govt_inspection_id |Government Inspection Id  |govt_inspection_sheets.id  |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Min Standard  | |Manually marked  |
|  Template  | |Manually marked  |
|  Special Market  | | Manually marked |
|  Dispensation  | |Manually marked  |
|  Inspector No.  |Inspector number |Manually filled in  |
|  Exporter  |Exporter name  | `organizations.medium_description` of the exporter on the govt_inspection_sheet |
| Insp.Point  |Inspection point | `govt_inspection_sheets.inspection_point ` |
|  Cultivar  |Cultivar |`cultivars.cultivar_name`  |
|  PHC  |Packhouse Code | `pallets.phc` |
|  Date  |Date of Inspection | Time at the printing of report |
|  Product  |Commodity | `commodities.code` |
|  PUC/FBO  |Puc codes |Manually filled in|
|  Consignment note  |Consignment note nummber |`govt_inspection_sheets.consignment_note_number`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pallet No/Pallet barcode ID  |Pallet number | `pallets.pallet_number` |
|  Class  |Fruit grade  |`grades.grade_code`  |
|  Target Region/Country/Target market  |Destination region /Packed target market group |`destination_regions.destination_region_name`/`target_market_groups.target_market_group_name` |
|Size/Count/Diameter |The actual fruit count that fits in a standard box  | 'fn_edi_size_count: When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the first of:  `fruit_size_references.edi_out_code` or `fruit_size_references.size_reference` or  `fruit_actual_counts_for_packs.actual_count_for_pack` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value |
|  Nett Weight  |Pallet nett weight | sum of `pallet_sequences.nett_weight` |
|  Decay  | | Manually filled in |
|   Internal Insect Damage  | | Manually filled in|
|  Athropodia  | | Manually filled in |
|  Injuries  | | Manually filled in |
|  Blemishes  | | Manually filled in |
|  Blemishes  | |Manually filled in|
|  C-Comply/R-Reject  | | Manually filled in |
