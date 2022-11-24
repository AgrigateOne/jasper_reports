













# Govt Finding Sheet report

## Description
This report represents the findings of inspection by the government.

## Generating the report
The report can be generated:
Finished Goods | Inspection | List Govt Inspection Sheets
* From a govt_inspection_sheet  - click on the "Print Finding Sheet" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
| presort_grading_pool_id |presort_grading_pool_id |presort_grower_grading_pools.id  |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
| Maf lot | Maf lot number |`presort_grower_grading_pools.maf_lot_number`  |
| Farm code  | Farm |`farms.farm_code`  |
| Commodity code  |Fruit commodity  |`commodities.code+`  |
| Variety code  | Fruit variety |`cultivars.cultivar_code`  |
| Track SLMS  |Track Slms indicator code  |`rmt_codes.rmt_code`  |
| Product Class  | Product class code |`rmt_classes.rmt_class_code`  |
| Ripe Point  | Ripe point code |`rmt_bins.legacy_data.ripe_point_code`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
| Input weight  |Tipped bins weight  |sum `presort_grower_grading_bins.rmt_bin_weight`  |
| Bins  | Total number of graded bins in the pool |`presort_grower_grading_pools.rmt_bin_count`  |
| Delivery no  | Delivery number |`rmt_deliveries.reference_number`  |
| Date  |Delivery date  |`rmt_deliveries.created_at`|
| Bin qty  |Number of bins per delivery  |`count(rmt_bins.id)`  |
## Crosstab
| Label | Description | Source |
| ----- | ----------- | ------ |
| Colour  |  |``  |
| Class  |  |``  |
| Size  |  |``  |
| %  |  |``  |
| Kg  |  |``  |
