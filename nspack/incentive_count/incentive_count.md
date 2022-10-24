# Incentive count report

## Description
This report represents the total cartons ,the fruit quantity , the actual number of fruits packed per hour
per each fruit spec(commodity,pack,variety,size) and  the length of shift


## Generating the report
The report can be generated:
Production | Shifts | List Shifts
* From a shift row menu  - click on the "Incentive count" link.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|  Shift ID  |Shift Id | `shifts.id` |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Shift Type | Shift type| `shift_types.day_night_or_custom` |
|  From Date |Start time of shift | `shifts.start_date_time` |
|  To |End time of shift | `shifts.end_date_time` |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number` |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`|
|  Shift D/N |Shift type| `shift_types.day_night_or_custom` |
|  Comm |Commodity code packed in the shift | `commodities.code` |
|  Var Var |Variety packed in the shift  | `marketing_varieties.marketing_variety_code` |
|  Pack |Basic pack code packed   | `basic_pack_codes.basic_pack_code` |
|  Size count interval group     |Size count interval group   |`std_fruit_size_counts.size_count_interval_group`/
|  Count |Actual number of individual packed fruit | `fruit_actual_counts_for_packs.actual_count_for_pack` |
|  Total Cartons |Total number of cartons packed | `count(cartons.id)`|
|  Total Fruit |Total Sum of  Fruit Qty packed by worker | Total counts * Count: `count(cartons.id)` * `fruit_actual_counts_for_packs.actual_count_for_pack` |
|  Running hours |Length of shift in hours| `shifts.end_date_time - shifts.start_date_time` |
|  Fruit per hour | The actual number of fruit items packed in an hour | Total Fruit/Running hours: `sum(fruit_actual_counts_for_packs.actual_count_for_pack)`/`shifts.end_date_time - shifts.start_date_time` |



