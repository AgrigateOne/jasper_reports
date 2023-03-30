# Govt Finding Sheet report

## Description
This report represents the findings of inspection by the government.

## Generating the report

The report can be generated:
Finished Goods | Inspection | List Govt Inspection Sheets
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
|  PUC/s  |Puc codes |Manually filled in|
|  Consignment note  |Consignment note nummber |`govt_inspection_sheets.consignment_note_number`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pallet No/Pallet barcode ID  |Pallet number | `pallets.pallet_number` |
|  Puc  |Puc  |`pucs.puc_code`  |
|  Orchard  |Orchard | `orchards.orchard_code` |
|  Phyto Data  |Phyto data | `pallet_sequences.phyto_data` |
|  Cultivar  | Cultivar|`cultivars.cultivar_name`  |
|  Target Region/Country/Target market  |Destination region /Packed target market group | `destination_regions.destination_region_name`/`target_market_groups.target_market_group_name` |
|  Count Size  |Fruit size that fits in a standard box |`fn_edi_size_count(standard_pack_codes.use_size_ref_for_edi, commodities.use_size_ref_for_edi, fruit_size_references.edi_out_code, fruit_size_references.size_reference,
   fruit_actual_counts_for_packs.actual_count_for_pack)`  |
|  Class  |Grade code |`grades.grade_code`  |
|  Decay  | | Manually filled in |
|  Minor Injuries  | | Manually filled in|
|  Major Injuries  | | Manually filled in |
|  Blemishes  | | Manually filled in |
|  Long Stems  | | Manually filled in |
|  Oleo  | |Manually filled in|
|  CBS  | |Manually filled in |
|  FCM  | | Manually filled in|
|  Too Small  | |Manually filled in |
|  C-Comply/R-Reject  | | Manually filled in |
