# Delivery report

## Description
This report summarizes the delivery information(date and time of delivery ,source of delivery ,(the number ,type and fullness of rmt bins))

## Generating the report

The report can be generated:
Raw materials | Deliveries | List Deliveries
* From a delivery - click on the "Print Delivery" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|delievery_id|Rmt delivery id | rmt_deliveries.id |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
| To| Farm owner  from where the fruit on this delivery came from  | `organizations.medium_description` of the farm owner on the delivery|
| Farm| The farm name from where the fruit on this delivery came from  | `farms.farm_code` |
| Reference number|Reference number | `deliveries.reference_number` |
|  Intake document  | Delivery document number | `deliveries.id`|
|  Date  |Date of delivery| `deliveries.date_delivered` |
|  Date picked  |Date for when the fruit on the delivery was picked/harvested |`deliveries.date_picked` |
|  Week  |Week number for when fruit was picked/harvested | week`deliveries.date_picked` |
|  Waste  |Quantity of bad/damaged fruit | manually filled in |
|  Degreened  |Indication if delivery is to be degreened  | marked if `rmt_delivery_destinations.delivery_destination_code` is 'degreened'  |
|  Drenched  |Indication if delivery is to be drenched  | marked if `rmt_delivery_destinations.delivery_destination_code` is 'drenching'  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Commodity  |Commodity | `commodities.commodity_code` |
|  Variety  | Fruit Cultivar | `cultivars.description` |
|  RMT code  |RMT code|`rmt_codes.rmt_code`  |
|  Orchard  |Orchard code | `orchards.orchard_code` |
|  PUC  |Farm PUC  |`pucs.puc_code`  |
|  GGN  |Global Gap Number | `pucs.gap_code`  |
|  Farm  |Farm  |`farms.farm_code`|
|  Damaged bins   |Number of damaged bins |`rmt_deliveries.qty_damaged_bins`  |
|  Remarks   |Remarks |`rmt_deliveries.remarks` |
|  Container material |Bin container material type  |`rmt_container_material_types.container_material_type_code`|
|  Fullness   |Quantity of damaged bins |`rmt_bins.bin_fullness`  |
|  Bin qty   |Quantity of bins per  container material type and  fullness  |count of rmt_bins |
|  Other Measurements   |Other Measurements |Manually filled in |
|  Defects   |Defects |Manually filled in  |















