# Incentive report

## Description
This report represents the total cartons ,the fruit quantity , the packing method,the actual number of fruits packed per hour
and the total  earnings a packer earned  in a shift.

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
## Subreport: variety sum
| Label | Description | Source |
| ----- | ----------- | ------ |
| Markerting variety code | Marketing variety | `marketing_varieties.marketing_variety_code` |
| Total  |Number of cartons packed in the shift  |`count(carton_labels.*)`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number` |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`|
|  Shift D/N |Shift type| `shift_types.day_night_or_custom` |
|  Total Carton |Sum total of cartons packed  | `count(carton_labels.id)`|
|  Total Fruit |Total Sum of  Fruit Qty packed | `sum(fruit_actual_counts_for_packs.actual_count_for_pack)` |
|  Running hours | Length of shift in hours| `shifts.end_date_time - shifts.start_date_time` | 
|  Fruit per hour | The actual number of fruit items packed in an hour | Total Fruit/Running hours: `sum(fruit_actual_counts_for_packs.actual_count_for_pack)`/`shifts.end_date_time - shifts.start_date_time` |
|  Packing method | The method used to pack in this shift| `packing_methods.packing_method_code` | 
|  Basic Wage | Wage level of each packer |`wage_levels.wage_level` |  
|  Incentive | List of inventory codes packed or palletized by a worker|`wage_level/std_hours_per_day/require_pack_hour * incentive_factor * (reduced_fruit_for_work_day - require_for_work_day`)
|  Total Earnings |Total earned by worker in the shift | wage_level +incentive: `wage_levels.wage_level + wage_level/std_hours_per_day/require_pack_hour * incentive_factor * (reduced_fruit_for_work_day - require_for_work_day)`|
