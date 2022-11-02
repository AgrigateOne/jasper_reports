# Packer  summary report

## Description
This report summarizes  the number of cartons and fruit quantity packed per each inventory type for each packer in a selected
period of time and the total earnings earned across all shifts.


## Generating the report
The report can be generated:
Production | Shifts | Summary reports | Packers
* From the report page menu  - select revelant dates
    * From the resulting grid select the relevant packers and submit
      The report can be generated:

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|FromDateTime| Start date time of the selected period   |  Passed in date time                 |
|ToDateTime  | End date time of the selected period     |  Passed in date time                 |
|WorkerIds   | Shift workers Id                         |  Passed in selected packer IDs  |
## Report
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number` |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`|
|  Shifts  |List if shifts packed in by packer  | `shifts.id` |
|  Count Shifts  |The number of shifts packed in by packer |`count(shifts.id)`|
| Total carton |Number of cartons packed | `count(carton_labels.id)` |
| Total fruit  |Total sum of Fruit Quantity packed by each packer | `sum(fruit_actual_counts_for_packs.actual_count_for_pack)` |
| Running hours  |The duration of the shift in hours | the first of `shift_exceptions.running_hours` or `shifts.running_hours` that has a value |
| Basic Wage  |The total basic amount paid to packer for all shifts packed  | number of shifts * `wage_level` |
| Incentive  |Additional earnings paid to packer | wage_level/std_hours_per_day /require_pack_hour * incentive_factor * (reduced_fruit_for_work_day - require_for_work_day): `wage_levels.wage_level /9/1500 * 1.1 * ((sum(Total fruit * packing_methods.actual_count_reduction_factor)) -(1500 * Running hours))`|
| Total earnings   |The total amount per packer| Basic Wage +  Incentive|


