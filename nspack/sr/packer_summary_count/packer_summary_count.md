# Packer Summary count report

## Description
This report represents the total cartons and fruit quantity packed per each fruit spec(commodity,basic pack,marketing variety,actual count and inventory type)
and the total cost  for packing such by each worker for a selected period of time across all shifts.

## Generating the report
The report can be generated:

* Production | Shifts | Summary reports | Packers Count
* From the report page menu  - select revelant dates
    * From the resulting grid select the relevant packers and submit


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|FromDateTime| Start date time of the selected period       |  Passed in date time                 |
|ToDateTime  | End date time of the selected period         |  Passed in date time                 |
|WorkerIds   | Shift workers Id                  |  Passed in selected packer IDs  |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|  From Date |Start time of the selected period | `shifts.start_date_time` |
|  To |End time of the selected period | `shifts.start_date_time` |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number` |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`|
|  Comm |Commodity code packed  | `commodities.code` |
|  Mark Var |Marketing variety packed | `marketing_varieties.marketing_variety_code` |
|  Basic pack |Basic pack code packed  | `basic_pack_codes.basic_pack_code` |
|  Actual Count |Actual number of individual packed fruit | `fruit_actual_counts_for_packs.actual_count_for_pack` |
|  Ctn |Number of cartons for each fruit spec packed | count of `carton_labels.id` |
|  Total Ctn |Total sum of Ctns packed | sum of all Ctns |
|  Fruit Qty |Actual fruit count  of each fruit spec packed | `sum(fruit_actual_counts_for_packs.actual_count_for_pack)` |
|  Total Fruit Qty|Total sum of  Fruit Qty packed  | sum of all fruit qty |
|  Inv |List of packed inventory codes | `inventory_codes.inventory_code` |
|  Cost |Cost of packing each fruit  item  spec |`sum(fruit_actual_counts_for_packs.actual_count_for_pack * inventory_codes.fruit_item_incentive_rate)` |
|  Total Earnings |Total cost of fruit packed by worker | sum of Cost |
