# Incentive report

## Description
This report represents the total cartons and fruit quantity packed per each  inventory code
and the total cost  for packing such for each packer in the shift.

## Generating the report
The report can be generated:
Production | Shifts | List Shifts
* From a shift row menu  - click on the "Incentive " link.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|  Shift ID  |Shift Id | `shifts.id` |
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
|  Shift D/N |Shift type| `shift_types.day_night_or_custom` |
|  Ctn |Number of cartons  packed or palletized per each inventory code| count of `carton_labels.id` |
|  Total Ctn |Sum total of cartons packed or palletized by worker | sum of all cartons by worker |
|  Fruit Qty |Total actual fruit count  packed or palletized by worker per each inventory code | `sum(fruit_actual_counts_for_packs.actual_count_for_pack)` |
|  Total Fruit |Total Sum of  Fruit Qty packed or palletized by worker | sum of all fruit qty |
|  Inv | List of inventory codes packed or palletized by a worker|`inventory_codes.inventory_code` | 
|  Cost |The total cost of packing or palletizing a certain fruit inventory type |sum of  `fruit_actual_counts_for_packs.actual_count_for_pack` * first of: `inventory_codes_packing_costs.packing_cost`  or  `inventory_codes.fruit_item_incentive_rate` that has a value |
|  Total Earnings |Total cost of fruit packed or palletized by worker | sum of Cost |
|  No Packers | Number of workers in this shift|count of `contract_workers.id` | 
