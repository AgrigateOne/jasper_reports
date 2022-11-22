# Delivery Cost Invoice report

## Description
This report summarizes the delivery batch cost.

## Generating the report
The report can be generated:
Raw materials | Deliveries | Batches
* From a Batch - click on the "Delivery Cost Invoice" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|batch_number|Delivery batch identification| batch number |
|vat|VAT set amount or percentage | AppConst::VAT_FACTOR |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Address| Info related to the implemenation owner | `party role address.jasper`  using delivery address of implementation owner|
|Vat no |Implementation owner's vat number | `organizations.vat_number`|
|Company Reg No |Implementation owner's company registration number | `organizations.company_reg_no`|
| Farm| The farm name from where the fruit on this delivery came from  | `farms.farm_code` |
|Address 2| Info related to the farm owner | `party role address.jasper`  using delivery address of farm  owner|
|Date Range |Delivery date range of the deliveries in the batch   | min `deliveries.date_delivered` to max`deliveries.date_delivered`|
|Invoice No |Invoice number | parameter `batch_number`|
|Delivery No |Delivery ids of the batched deliveries | concatenated `deliveries.id`|
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Cost code | RMT delivery cost code| `costs.code_code`|
|Cost Description |RMT delivery cost description | `costs.description`|
|Deliver qty |The total number of deliveries batched | count`deliveries.id`|
|Bin qty |The total quantity of bins in the batch | sum of `count(rmt_bins.id)`|
|Cost type |RMT delivery cost amount per cost unit(i.e per BIN)| `rmt_delivery_costs.amount`|
|Cost| RMT delivery cost amount| `rmt_delivery_costs.amount` * Bin qty|
|Vat |Total Vat amount  | parameter `vat` * Cost|
|Total |Total invoice amount | Cost + Vat |
|Total due | | ``| #TODO: Get the report to work and complete
