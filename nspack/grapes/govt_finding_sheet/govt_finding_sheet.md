# Govt Finding Sheet report (for Grapes)

## Description
This report represents the findings of inspection by the government.

## Generating the report

The report can be generated:
Finished Goods | Inspection | List Govt Inspection Sheets
* From a govt_inspection_sheet  - click on the "Print Finding Sheet" button.

**NOTE:** _This version of the report will display if the PH is a **grape** PH._

## Report parameters

| Parameter          | Description              | Source                    |
| -----              | -----------              | ------                    |
| govt_inspection_id | Government Inspection Id | govt_inspection_sheets.id |

## Report header

| Label              | Description              | Source                                                                               |
| -----              | -----------              | ------                                                                               |
| Min Standard       |                          | Manually marked                                                                      |
| Template           |                          | Manually marked                                                                      |
| Special Market     |                          | Manually marked                                                                      |
| Dispensation       |                          | Manually marked                                                                      |
| Inspector & No.    | Inspector and number     | `fn_party_role_name (inspectors.inspector_party_role_id), inspectors.inspector_code` |
| Signature          |                          | Manually filled-in                                                                   |
| Date               | Date of Inspection       | Time at the printing of report                                                       |
| Exporter           | Exporter name            | `organizations.medium_description` of the exporter on the govt_inspection_sheet      |
| Product            | Commodity                | `commodities.code`                                                                   |
| PUC/FBO            | Puc                      | pucs.puc_code                                                                        |
| Inspection Point   | Inspection point         | `govt_inspection_sheets.inspection_point `                                           |
| Cultivar           | Cultivar                 | `marketing_varieties.marketing_variety_code`                                         |
| PHC                | Packhouse Code           | `pallets.phc`                                                                        |
| Consignment note/s | Consignment note nummber | `govt_inspection_sheets.consignment_note_number`                                     |

## Report detail

| Label                       | Description         | Source                                                                               |
| -----                       | -----------         | ------                                                                               |
| Pallet No/Pallet barcode ID | Pallet number       | `pallets.pallet_number`                                                              |
| Class                       | Grade code          | `grades.grade_code`                                                                  |
| Berry Size                  | Fruit size refernce | `COALESCE(fruit_size_references.edi_out_code, fruit_size_references.size_reference)` |
| Orchard                     | Orchard             | `orchards.orchard_code`                                                              |
| Target Region               | Destination region  | `destination_regions.destination_region_name`                                        |
| MASS PREPACKED UNITS        |                     | Manually filled-in                                                                   |
| CARTON MASS                 |                     | Manually filled-in                                                                   |
| MIN mm - or DEVIATING %     |                     | Manually filled-in                                                                   |
| LOOSE BERRIES               |                     | Manually filled-in                                                                   |
| SPLIT,BURST,CUT BERRIES     |                     | Manually filled-in                                                                   |
| INSECT DAMAGED BERRIES      |                     | Manually filled-in                                                                   |
| DECAY BERRIES               |                     | Manually filled-in                                                                   |
| OIDIUM BUNCHES              |                     | Manually filled-in                                                                   |
| BLEMISH BUNCHES             |                     | Manually filled-in                                                                   |
| STRAGGELY BUNCHES           |                     | Manually filled-in                                                                   |
| COLOUR BUNCHES              |                     | Manually filled-in                                                                   |
| SUNBURN BUNCHES             |                     | Manually filled-in                                                                   |
| BLUSHED BUNCHES             |                     | Manually filled-in                                                                   |
| DIRTY BUNCHES               |                     | Manually filled-in                                                                   |
| DRY AND WILTED BUNCHES      |                     | Manually filled-in                                                                   |
| UNDER MASS BUNCHES          |                     | Manually filled-in                                                                   |
| BERRIES WITH SEEDS          |                     | Manually filled-in                                                                   |
| C-Comply/R-Reject           |                     | Manually filled in                                                                   |
