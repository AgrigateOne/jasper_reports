# Incentive count report

## Description
This report represents the total cartons and fruit quantity packed per each fruit spec(commodity,basic pack,marketing variety,actual count and inventory type) 
and the total cost  for packing such  for each packer in the shift.

## Generating the report
The report can be generated:

* Production | Shifts | List Shifts
* From a shift row menu  - click on the "Incentive count" link.


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
| Label | Description | Source                                                                                                                                                                                                   |
| ----- | ----------- |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number`                                                                                                                                                                      |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`                                                                                                                                           |
|  Shift D/N |Shift type| `shift_types.day_night_or_custom`                                                                                                                                                                        |
|  Comm |Commodity code packed in the shift | `cartons.commodities.code`                                                                                                                                                                               |
|  Mark Var |Variety packed in the shift  | `cartons.marketing_varieties.marketing_variety_code`                                                                                                                                                     |
|  Basic pack |Basic pack code packed in  | `cartons.basic_pack_codes.basic_pack_code`                                                                                                                                                               |
|  Actual Count |Actual number of individual packed fruit | `cartons.fruit_actual_counts_for_packs.actual_count_for_pack`                                                                                                                                            |
|  Inv |List of packed inventory codes | `cartons.inventory_codes.inventory_code`                                                                                                                                                                 |
|  Ctn |Number of cartons  packed | count of `carton_labels.id`                                                                                                                                                                              |
|  Total Ctn |Total sum of cartons packed | sum of all cartons by worker                                                                                                                                                                             |
|  Fruit Qty |Actual fruit count packed  | `sum(cartons.fruit_actual_counts_for_packs.actual_count_for_pack)`                                                                                                                                       |
|  Total Fruit |Total Sum of  Fruit Qty packed by worker | sum of all fruit qty                                                                                                                                                                                     |
|  Cost |The total cost of packing each fruit spec item | sum of  `cartons.fruit_actual_counts_for_packs.actual_count_for_pack` * first of: `cartons.inventory_codes_packing_costs.packing_cost`  or  `inventory_codes.fruit_item_incentive_rate` that has a value |
|  Total Earnings |Total cost of fruit packed  | sum of Cost                                                                                                                                                                                              |
|  No Packers | Number of workers in this shift| count of `contract_workers.id`                                                                                                                                                                           | 
