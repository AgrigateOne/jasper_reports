# Detailed packout report

## Description
This report represents the production run - it's  input and the output summary.
The report can either represent a run with the output already dispatched  or not.

## Generating the report

The report can be generated:
Production | Runs | List Production Runs
* From a production run  - click on the "Reports" button.
    * Report is either under dispatched only report menu or packout report menu

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
| production_run_id |  |production_run.id  |
| carton_or_bin     |fg packaging type pm_type_code for Product Setups  | AppConst::DEFAULT_FG_PACKAGING_TYPE |
| use_packed_weight |  | either 'true' or 'false' |
| dispatched_only   |  | either 'true' or 'false' |
| client_code       |  | AppConst::CLIENT_CODE |

## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
| Producer| Pucs from where the fruit on this runs came from | `pucs.puc_code` |
| Farm|The farm names from where the fruit on this runs came from  | `farms.farm_code` |
| Packhse| The packhouse code | `packhouses.plant_resource_code` |
| Run Start and Completed Date|The time when the runs  was started and completed  | `production_runs.started_at` and `production_runs.completed_at`|
| Run numbers|Run numbers  | first of: `rmt_bins.production_run_tipped_id` or `production_run_stats.production_run_id` that has a value|
| Pack Week|The week number in the year when the fruit was packed  | Extract week from `production_runs.pr.started_at` |
| Fruit Type|Fruit commodity  | `commodities.code` |
| Actual Variety| Fruit variety | the first of: customer marketing variety or `marketing_varieties.marketing_variety_code` that has a value|
## Subreport: grade summary
| Label | Description | Source |
| ----- | ----------- | ------ |
| Grade|Fruit grade  | `grades.grade_code` |
| Kgs|Total nett weight of packed fruit  | sum of `pallet_sequences.nett_weight` |
| %| Percentage nett weight of packed fruit in relation to the total tipped bin weight | sum(pallet_sequences.nett_weight)/max(bin_tipped.total_bin_weight)) * 100 |
## Bin Tipping details
| Label | Description | Source |
| ----- | ----------- | ------ |
| Bin type|The type of container of the tipped bins | `rmt_container_types.container_type_code` |
| Grade| Fruit grade | `grades.grade_code` |
| Quantity| The number of bins tipped  |total number of bins tipped on this run/s |
| Ave.Kgs| Average tipped bin nett weight |sum(rmt_bins.nett_weight)/count(rmt_bins.id)|
| Kgs|The total bins tipped nett weight |sum(rmt_bins.nett_weight) |
## Subreport: delivery summary
| Label | Description | Source |
| ----- | ----------- | ------ |
| Del.no|Delivery number | `rmt_bins.rmt_delivery_id` |
| Orchard| Orchard code from which this delivery came from | `orchards.orchard_code` |
| Bin Type|Container type of bins on a delivery  | `rmt_container_types.container_type_code` |
| Kilograms|Total nett weight of bins on a delivery  | sum(rmt_bins.nett_weight)|
| Qty| The number of bins on a delivery | count of bins |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
| Variety|Fruit variety  | the first of: customer marketing variety or `marketing_varieties.marketing_variety_code` that has a value |
| Grade| Fruit grade | `grades.grade_code` |
| Pack|Basic pack  | `basic_pack_codes.basic_pack_code` |
| Mark|Mark code  | `marks.mark_code` |
| Orgzn|Marketing organization| organizations.medium description of the marketing org selected on the production run |
| TM| Packed target market | `target_market_groups.target_market_group_name` |
| Inv|Inventory code  | `inventory_codes.inventory_code` |
| Count|Actual count and size ref  | `fruit_actual_counts_for_packs.actual_count_for_pack`/`fruit_size_references.size_reference` |
| Qty|Carton quantity  | sum(`pallet_sequences.carton_quantity`)|
| Kgs|Packed weight  | if parameter 'use_packed_weight' is true `sum(pallet_sequences.nett_weight)` else `sum(standard_product_weights.nett_weight * pallet_sequences.carton_quantity)` |
| %| Packed weight over total tipped bin weight percentage | if parameter 'use_packed_weight' is true `sum(pallet_sequences.nett_weight)/sum(rmt_bins.nett_weight)` else `sum(standard_product_weights.nett_weight * pallet_sequences.carton_quantity)/sum(rmt_bins.nett_weight)`  |
## Subreport: Rebinned Kgs
| Label | Description | Source |
| ----- | ----------- | ------ |
|Rmt_class|Rebinned Rmt class id |`rmt_classes.id`|
|Rmt_class_code|Rebinned rmt class code| `rmt_classes.rmt_class_code`|
|Weight|Total rebin weight| `sum(b.nett_weight)`|
## Subreport: Counts
| Label | Description | Source |
| ----- | ----------- | ------ |
| Count|Actual count and size ref  | `fruit_actual_counts_for_packs.actual_count_for_pack`/`fruit_size_references.size_reference` |
| Std Size|Fruit stanard size  | `std_fruit_size_counts.size_count_value` |
| Qty|Carton quantity  | `sum(pallet_sequences.carton_quantity)` |
| %| Packed weight over tipped bin weight percentage | `(sum(pallet_sequences.nett_weight)/max(bin_tipped.total_bin_weight)) * 100 ` |