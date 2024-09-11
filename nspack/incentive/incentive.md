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
| Label           | Description                                                | Source                                                                                                                                                                              |
|-----------------|------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Pno             | Contract worker personnel barcode                          | `contract_workers.personnel_number`                                                                                                                                                 |
| Name            | Contract worker first and last name                        | `contract_workers.first_name`  +  `contract_workers.last_name`                                                                                                                      |
| Shift D/N       | Shift type                                                 | `shift_types.day_night_or_custom`                                                                                                                                                   |
| Ctn             | Inventory carton qty packed                                | `count(carton_labels.id)`                                                                                                                                                           |
| Total Carton    | Total carton quantity packed by contract worker            | `sum(carton_qty) OVER (PARTITION BY contract worket)`                                                                                                                               |
| Fruit Qty       | Actual fruit count  per inventory                          | `fruit_actual_counts_for_packs.actual_count_for_pack`                                                                                                                               |
| Total Fruit     | Total actual  fruit count by contract worker               | `sum(fruit_actual_counts_for_packs.actual_count_for_pack)`                                                                                                                          |
| Running hours   | Length of shift in hours                                   | `shifts.end_date_time - shifts.start_date_time`                                                                                                                                     | 
| Fruit per hour  | The actual number of fruit items packed in an hour         | Total Fruit/Running hours: `sum(fruit_actual_counts_for_packs.actual_count_for_pack)`/`shifts.end_date_time - shifts.start_date_time`                                               |
| Incentive_fruit | Bonus fruit for which incentive is paid                    | Total Fruit - (running_hours/std_hours_per_day *(fruit_per_hour_packing_target * running_hours) )                                                                                                                                                                    |
| Inv             | Inventory code                                             | `inventory_codes.inventory_code`                                                                                                                                                    | 
| Packing method  | The method used to pack in this shift                      | `packing_methods.packing_method_code`                                                                                                                                               | 
| Cost            | The basic cost for packing                                 | (reduced_fruit_qty -(reduced_fruit_qty - (running_hours/std_hours_per_day *(fruit_per_hour_packing_target * running_hours) ))) * inv_cost                                                                                             |  
| Incentive       | Bonus/extra cost for packing more than the required target | `((quantity_fruit_packed_per_inv * actual_count_reduction_factor) -(running_hours / std_hours_per_day *(fruit_per_hour_packing_target * running_hours))) * inv_cost AS incentive,`) 
| Total Earnings  | Total earned by worker in the shift                        | Cost + Incentive                                                                                                                                                                    
                  

## Report calculations
| Label                         | Description                                                                                     |                                                                                                                   
|-------------------------------|-------------------------------------------------------------------------------------------------|
| reduced_fruit_qty             | quantity_fruit_packed_per_inv * actual_count_reduction_factor                                   |         
| inv_cost                      | coalesce(inventory_codes_packing_costs.packing_cost, inventory_codes.fruit_item_incentive_rate) |
| fruit_per_hour_packing_target | commodities.fruit_per_hour_packing_target                                                       |                                                                                                                                                                          |
| actual_count_reduction_factor | packing_methods.actual_count_reduction_factor                                                   |
| shift_packing_target          | fruit_per_hour_packing_target * running_hours                                                   
|required_fruit_to_reach_incentive | running_hours/std_hours_per_day *(fruit_per_hour_packing_target * running_hours)                                                                                                | 
| actual_count_reduction_factor | packing_methods.actual_count_reduction_factor                                                   |





## Example
```
total_earnings  = incentive + cost

cost            = (reduced_fruit_qty-incentive_fruit) * inv_cost
                = (14000 - 3333) * 0.017
                = 181.339
                
incentive_fruit = (reduced_fruit_qty - required_fruit_to_reach_incentive)

       shift_packing_target =  fruit_per_hour_packing_target * running_hours 
 shift_running_hours_target = running_hours / std_hours_per_day *(fruit_per_hour_packing_target * running_hours) 


incentive    = incentive_fruit * inv_cost
			 = (reduced_fruit_qty - required_fruit_to_reach_incentive) * inv_cost
			 = ((quantity_fruit_packed_per_inv * actual_count_reduction_factor) - (running_hours/std_hours_per_day * shift_packing_target)) * inv_cost
			 = ((quantity_fruit_packed_per_inv * actual_count_reduction_factor) - (running_hours/std_hours_per_day * (fruit_per_hour_packing_target * running_hours))) * inv_cost
			 = ((quantity_fruit_packed_per_inv * actual_count_reduction_factor) -(running_hours / std_hours_per_day *(fruit_per_hour_packing_target * running_hours))) * inv_cost AS incentive,

			 = ((14000 * actual_count_reduction_factor) - (running_hours/std_hours_per_day * (fruit_per_hour_packing_target * running_hours))) * inv_cost
			 = ((14000 * 1.0) - (8/9 * (1500 * 8))) * 0.017
			 = 56.666666667
			  
			  =((14410 * 1.0) -(8.98 / 9 *(1500 * 8.98))) * 0.017 AS incentive,
			 =((14410 * 1.0) - (8/9 * (1500 * 8))) * 0.017
			 
			 14410 - (8.98/9 * 1500)
			 

quantity_fruit_packed_per_inv    = 14000
fruit_per_hour_packing_target    = 1500
incentive rate                   = 0.017
running hours                    = 8
shift_fruit_packing_target       = running hours * fruit_per_hour_packing_target
                                 =  8hrs * 1500 = 12000
required_fruit_to_reach_incentive      = 8/9 * 12000 = 10 667 (shift_target)
incentive_fruit                  = quantity_fruit_packed_per_inv - required_fruit_to_reach_incentive 
                                 = 14000 - 10667 = 3333
incentive paid                   = 3333 x 0,017 = R56.66

```