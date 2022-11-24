# Single pallet barcode report

## Description
This report displays a repacked pallet  barcode , pallet's repacked date and pallet number.

## Generating the report

The report can be generated:
Finished Goods | Inspections | List
* From a repacked pallet - click on the "Print barcode" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|repack_date|pallet repacked at date| pallets.repacked_at |
|pallet_number|pallet number | pallets.pallet_number |

## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Repacked at| Pallet repacked at date |parameter `repack_date`|
|Pallet number |Pallet number|`pallets.pallet_number`|
