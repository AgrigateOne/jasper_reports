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
|  PUC  |Puc  |`pucs.puc_coe`  |
|  Orchard  |Orchard  |`orchards.orchard_code`  |
|  Phyto  |Phyto Data  |  |
|  Cultivar  |Fruit cultivar  |`cultivars.cultivar_name`  |
|  Count/Size  |Fruit size that fits in a standard box |`fruit_size_references.size_reference`  |
|  Class  |Fruit grade  |`grades.grade_code`  |
|  Target Region/Country/Target market  |Destination region /Packed target market group |`destination_regions.destination_region_name`/`target_market_groups.target_market_group_name` |
|  Decay  | | Manually filled in |
|  Internal Insect Damage  | | Manually filled in|
|  Athropodia  | | Manually filled in |
|  Injuries  | | Manually filled in |
|  Blemishes  | |Manually filled in|
|  C-Comply/R-Reject  | | Manually filled in |


