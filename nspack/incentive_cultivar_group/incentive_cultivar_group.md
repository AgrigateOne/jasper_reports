# Incentive Cultivar Group Report

## Description
Calculates the total earnings based on the cultivar group packing factor.

## Generating the report
The report can be generated:

* Production | Shifts | List Shifts
* From a shift row menu  - click on the "Incentive Cultivar Group" link.


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
| Label              | Description                                    | Source                                                                                                                                                 |
|--------------------|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Pno                | Contract worker personnel barcode              | `contract_workers.personnel_number`                                                                                                                    |
| Name               | Contract worker first and last name            | `contract_workers.first_name`  +  `contract_workers.last_name`                                                                                         |
| Shift D/N          | Shift type                                     | `shift_types.day_night_or_custom`                                                                                                                      |
| Cultivar Group     | Cultivar group packed in the shift             | `cartons.cultivar_groups.cultivar_group_code`                                                                                                          |
| Packing Method     | Packing method used in the shift               | `cartons.packing_methods.packing_method_code`                                                                                                          |
| Total Carton       | Total sum of cartons packed                    | `count(cartons.id)`                                                                                                                                    |
| Total Fruit        | Total Sum of  Fruit Qty packed by worker       | `sum(cartons.fruit_actual_counts_for_packs.actual_count_for_pack)`                                                                                     |
| Packing Factor     | Actual_count_reduction_factor                  | `cartons.packing_methods.actual_count_reduction_factor`                                                                                                |
| Cult Grp Factor    | Cultivar group incentive factor                | `cultivar_groups.incentive_factor`                                                                                                                     |
| Total Fruit Factor | Total_Fruit * Packing Factor * Cult Grp Factor | Total_Fruit * Packing Factor * Cult Grp Factor                                                                                                         |
| Basic Wage         | Average compensation earned by worker          | `contract_worker.wage_levels.wage_level`                                                                                                               
| Incentive          | A bonus or additional payment                  | if Total Fruit Factor > 12000.00 then  incentive = (-12000.00 +Total Fruit Factor  ) * Basic Wage/12000.00 * Cult Grp Factor else incentive = 0        |
| Total Earnings     | Total cost of fruit packed + Incentive         | if Total Fruit Factor > 12000.00  then  total_earnings =( (-12000.00 + Total Fruit Factor) * Basic Wage/12000.00 * Cult Grp Factor) + Basic Wage else total_earnings = Basic Wage |

Total Fruit Factor  =    Total Fruit * Packing Factor * Cult Grp Factor
Total Fruit Factor  =    28980  * 1 * 1

Incentive
if total_fruit_factor_for_work_day > 12000.00
incentive = (-12000.00 +Total Fruit Factor  ) * Basic Wage/12000.00 * Cult Grp Factor
else
incentive = 0


Total Earnings
if Total Fruit Factor > 12000.00
total_earnings =( (-12000.00 + Total Fruit Factor) * Basic Wage/12000.00 * Cult Grp Factor) + Basic Wage
else
total_earnings = Basic Wage
