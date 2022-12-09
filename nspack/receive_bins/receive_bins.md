
# Bin Assets Report

## Description
This report shows the quantity  and type of bins received from a farm in a transaction and the total quantity of bins  at the farm at the time of the issue
transaction.

## Generating the report
The report can be generated:

* Raw materials | Bin Assets | Bin Asset Transaction History
  
* From a Bin asset issue transaction  row  - click on the "Issue/Receipt Report" button.

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
| bin_asset_transaction_id | Bin asset transaction id |`bin_asset_transactions.id`  |
## Report 
| Label | Description | Source |
| ----- | ----------- | ------ |
|Date and time of issue|Transaction date and time  | `bin_asset_transactions.created_at`|
|From location|Location of bin at the time of transaction  | `bin_asset_transaction_items.bin_asset_from_location_id`|
|To Producer|Destination location of bin  | `bin_asset_transaction_items.bin_asset_to_location_id`|
|Bin type| Material type of bin | `rmt_container_material_types.container_material_type_code`|
|Number Of Bins Issued| Total quantity of bins received  in a transaction | `bin_asset_transaction_items.quantity_bins`|
|Bins Now On farm|The quantity of bins at farm  | (total quantity of issued bins to farm + total bins issued by bin sales) - (total quantity of issued bins received from farm + total quantity of issued bins received from deliveries)|
