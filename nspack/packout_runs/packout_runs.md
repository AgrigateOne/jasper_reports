# Packout Runs 

## Description
This report summarizes a production run.

The report is either for dispatched output or in-stock. If dispatched only loaded out ...

## Generating the report

The report can be generated as:
### Dispatched only

* From the `Production runs | Runs | List production runs` menu .
    * From a production run - click on the "Reports" button.
       * Report is either under dispatched only report menu or packout report menu
* From the `Production runs | Reports | Packout runs` menu .
  * Select relevant parameters and submit.
    *Multi-select relevant production runs 

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|production_run_id|Production run id | production_runs.id |
|carton_or_bin| |AppConst::DEFAULT_FG_PACKAGING_TYPE  |
|use_paked_weight|Denoting which type of weight to use | either true or false |
|dispatched_only|Denoting ... |either true or false  |
|client_code|Client code | AppConst::CLIENT_CODE |
## Table Header
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Client  |Source of fruit  | `farms.farm_code` |
|  Deliveries  |Delivery id of fruit received | ` rmt_bins.rmt_delivery_id` |
|  Pack Weeks  |Week number for when the fruit was tipped on a production run | week `production_runs.started_at` |
|  orchards  |Source Orchard of the fruit | `orchards.orchard_code` |
|  Puc  |Farm puc |`pucs.puc_code` |
|  packhouse  | Packhouse in which the production run was run |`packhouses.plant_resource_code`  |
|  Run started  |Start time of production run | `production_runs.started_at` |
|  Run Completed  |End time of production run | `production_runs.completed_at` |
|  Total weight  |Total tipped bin weight | `sum(rmt_bins.nett_weight)` |
|  Weight packed  |Total packed weight |if parameter 'use_packed_weight' is true then `sum(pallet_sequences.nett_weight)` else `sum(standard_product_weights.nett_weight * pallet_sequences.carton_quantity)`|
|  Total non pack weight  |Weight difference between packed weight and tipped bin weight | Total weight minus Weight packed |
|  Percentage  | Total packed weight over total bin tipped weight  percentage| Weight packed/Total weight * 100 |
|  Bins  |Total tipped bins | count of bins tipped on the production run |
|  Prod. run  | production run id| `production_runs.id`  |
## Pallet Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Class  |Fruit grade of tipped fruit| `grades.grade_code` |
|  Variety  | Fruit Variety | the first of: customer marketing variety or marketing marketing_variety_code that has a value |
|  Pack  |Basic pack |`basic_pack_codes.basic_pack_code`  |
|  Count  |Fruit actual count over size reference   |`fruit_actual_counts_for_packs.actual_count_for_pack`/`fruit_size_references.size_reference`  |
|  Inv  |Inventory code | `inventory_codes.inventory_code` |
|  Packed TM  |Packed target market group |`target_market_groups.target_market_group_name`  |
|  Weight  |Total packed weight |if parameter 'use_packed_weight' is true then `sum(pallet_sequences.nett_weight)` else `sum(standard_product_weights.nett_weight * pallet_sequences.carton_quantity)`|
|  Total cartons  |Total number of packed cartons |`sum(pallet_sequences.carton_quantity)`  |
|  Percentage  |Percentage of packed weight to tipped weight |if parameter 'use_packed_weight' then `sum(pallet_sequences.nett_weight)/sum(rmt_bins.nett_weight)`  else `sum(standard_product_weights.nett_weight * pallet_sequences.carton_quantity)/sum(rmt_bins.nett_weight)` |

Weight:
if parameter 'use_packed_weight' is true then `sum(pallet_sequences.nett_weight)` 
else `sum(standard_product_weights.nett_weight * pallet_sequences.carton_quantity)`

use_packed_weight?nett_weight:derived_nett_weight
It is not a bug. 
Weight: Packed weight( pallet sequences' nett weight)
Percentage: Percentage of packed weight ex tipped weight
If you check on that run menu:lists | pallet sequences you will see that pallets for which the weight is null have no nett weight
Under the reports you can choose to see the 'use derived weights' version of the report. And again only records for which the master files weights were set will have values 

