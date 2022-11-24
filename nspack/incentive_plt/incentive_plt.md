# Incentive plt report

## Description
This report lists  the total earnings of palletizers earned for each standard pack, total pallets and cartons palletized
in a particular shift.

## Generating the report
The report can be generated:
Production | Shifts | List Shifts
* From a shift row menu  - click on the "Incentive plt" link.


## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Shift ID  |Shift Id | `shifts.id` |
|  Shift Type | Shift type| `shift_types.day_night_or_custom` |
|  From Date |Start time of shift | `shifts.start_date_time` |
|  To |End time of shift | `shifts.end_date_time` |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number` |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`|
|  Std Packs  |Palletized pallets standard_pack_code | ` standard_pack_codes.standard_pack_code` |
|  Shift D/N |Shift type| `shift_types.day_night_or_custom` |
| Total cartons  |Number of palletized cartons | `count(cartons.id)` |
| Total Pallets  |Number of pallets palletized | `count(distinct pallet_sequences.pallet_number )` |
| Running hours  |Duration of the shift in hours  | `shifts.running_hours` |
| Total earnings  | The amount earned by palletizer| `standard_pack_codes.palletizer_incentive_rate * total cartons packed` |
