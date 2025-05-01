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
|  VESSEL + ETD  | |Manually marked  |
|  Inspector No.  |Inspector number |Manually filled in  |
|  Exporter  |Exporter name  | `organizations.medium_description` of the exporter on the govt_inspection_sheet |
|  Insp.Point  |Inspection point | `govt_inspection_sheets.inspection_point ` |
|  Cultivar  |Cultivar |`marketing_varieties.marketing_variety_code`  |
|  PHC  |Packhouse Code | `pallets.phc` |
|  Date  |Date of Inspection | Time at the printing of report |
|  Product  |Commodity | `commodities.code` |
|  PUC/s  |Puc codes |Manually filled in|
|  Consignment note NUMBERS  |Consignment note nummber |`govt_inspection_sheets.consignment_note_number`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pallet No/Pallet barcode ID  |Pallet number | `pallets.pallet_number` |
|  Puc  |Puc  |`pucs.puc_code`  |
|  Orchard  |Orchard | `orchards.orchard_code` |
|  Target Region/Country/Target market  |Destination region /Packed target market group | `destination_regions.destination_region_name`/`target_market_groups.target_market_group_name` |
|  Class  |Grade code |`grades.grade_code`  |
|  Lenticel Damage  | | Manually filled in |
|  Injuries  | | Manually filled in|
|  Hail Injuries  | | Manually filled in |
|  Blemishes  | | Manually filled in |
|  Bruise  | | Manually filled in |
|  Visible spray Residues  | |Manually filled in|
|  Date Code  | | Manually filled in |
|  C-Comply/R-Reject  | | Manually filled in |
