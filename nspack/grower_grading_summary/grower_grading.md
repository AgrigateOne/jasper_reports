# Grower grading summary report

## Description
This report summarizes the input and output of a maf grower grading pool of rebins and cartons from a production run.

## Generating the report
The report can be generated:
Production | Grower Grading | Grading Pools
* From a grading pool grid row menu  - click on the "Preview" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
| grading_pool_id |grading_pool_id |grower_grading_pools.id  |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Grower  |Farm  |`farms.farm_code`  |
|Commodity code  |Fruit commodity  |`commodities.code`  |
|Cultivar Group |Cultivar Group  |`cultivar_groups.cultivar_group_code`  |
|Cultivar  |Cultivar Name  |`cultivars.cultivar_name`  |
|Input weight  |Nett weight  |`grower_grading_pools.nett_weight`  |
|Season  |Season  |`seasons.season_code`  |
|Rmt code  | Rmt Code |`rmt_codes.rmt_code`  |
|Production  | Production Run |fn_production_run_code  |
|Total Cartons  | Total quantity of graded cartons in the pool |`sum(grower_grading_cartons.carton_quantity)`  |
## Crosstab
| Label | Description | Source |
| ----- | ----------- | ------ |
| Class  |Rmt class code  |`rmt_classes.rmt_class_code`  |
| Size  |Fruit Size  |`std_fruit_size_counts.size_count_value`  |
| %  |Percentage of graded weight of grower_grading_pool_details of a certain class and  size in comparison to the total weight of all rebins and cartons in this pool|(sum of weight of grower_grading_pool_details of this class and size)/(total weight of all grower_grading_pool_details in pool)*100 |
| Kg  |Sum total of weight of grower_grading_pool_details of  a certain class and  size  |`sum(grower_grading_pool_details.graded_weight)`  |
