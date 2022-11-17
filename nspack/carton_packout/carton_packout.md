# Carton packout report

## Description
This report represents the production run - it's  input(bins) and the output(cartons) summary.

## Generating the report

The report can be generated:
Production | Runs | List Production Runs
* From a production run  - click on the "Reports | Carton Packout" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|production_run_id|Production run id | production_runs.id |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
| Client  name| The farm names from where the fruit on this runs came from  | `farms.description` |
| Date| Date packed  | `production_runs.started_at`|
| Pack Week|The week number in the year when the fruit was packed  | Extract week from `production_runs.pr.started_at` |
|  Variety  | Cultivar | the first of: `cultivar_groups.cultivar_group_code` or `cultivars.cultivar_name` that has a value |
|  Total  |Total tipped bin weight | `sum(rmt_bins.nett_weight)` |
|  Weight packed  |Total carton packed nett weight plus total nett weight of rebins |`sum(standard_product_weights.nett_weight )` + `sum(rmt_bins.nett_weight)` |
|  Percentage  | Total packed weight over total bin tipped weight  percentage| Weight packed/Total  * 100 |
|  Bins  |Total tipped bins | count of bins tipped on the production run |
|  Prod. run  | Production run id | `rmt_bins.production_run_tipped_id`  |
|  Packhouse  |Packhouse  | `packhouses.plant_resource_code`  |
|  Line  | Production line | `plant_resources.plant_resource_code`  |
## Subreport: Pack Intakes
| Label | Description | Source |
| ----- | ----------- | ------ |
| Intakes |Delivery numbers | `rmt_deliveries.id` |
| Orchards|Orchard code  | `orchards.orchard_code` |
## Subreport: Pack Out
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Class  |Fruit grade of tipped fruit| `grades.grade_code` |
|  Variety  | Fruit Variety | the first of: customer marketing variety or marketing marketing_variety_code that has a value |
|  Carton  |Basic pack |`basic_pack_codes.basic_pack_code`  |
|  Count  |Fruit actual count over size reference   |`fruit_actual_counts_for_packs.actual_count_for_pack`/`fruit_size_references.size_reference`  |
|  Inv  |Inventory code | `inventory_codes.inventory_code` |
|  Packed TM  |Packed target market group |`target_market_groups.target_market_group_name`  |
|  Percentage  |Percentage of packed weight to tipped bin weight | `sum(standard_product_weights.nett_weight)/sum(rmt_bins.nett_weight)`  |
|  Weight  |Total packed weight |`sum(standard_product_weights.nett_weight)`|
|  Total   |Total number of packed cartons |`count(carton_labels.id)`  |
















