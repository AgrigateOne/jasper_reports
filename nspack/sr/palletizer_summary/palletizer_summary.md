# Palletizer  summary report

## Description
This report lists  the total earnings of palletizers earned for all standard packs, total pallets and cartons palletized
for a selected period of time across all shifts.

## Generating the report
The report can be generated:

* `Production | Shifts | Summary reports | Palletizers`
* From the report page menu  - select revelant dates
    * From the resulting grid select the relevant packers and submit
      The report can be generated:

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|FromDateTime| Start date time of the selected period  |  Passed in date time                 |
|ToDateTime  | Start date time of the selected period  |  Passed in date time                 |
|WorkerIds   | Shift workers Id                        |  Passed in selected palletizers IDs  |

## Report
| Label | Description | Source |
| ----- | ----------- | ------ |
| Pno            | Contract worker personnel barcode       | `contract_workers.personnel_number` |
| Name           | Contract worker first and last name     | `contract_workers.first_name`  +  `contract_workers.last_name`|
| Std Packs      | List of palletized standard pack codes  | `standard_pack_codes.standard_pack_code` |
| Total Cartons  | Total number of cartons palletized  per each standard pack    | `count(carton_labels.id)` |
| Total Pallets  | Total number of pallets palletized  per each standard pack   | `count(distinct pallet_sequences.pallet_number )` |
| Total earnings | The total cost of all palletized cartons by the palletizer| `standard_pack_codes.palletizer_incentive_rate * count(carton_labels.id)` |

