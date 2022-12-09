
# Bin Load Report

## Description
This report lists all bins loaded dispatched per load.
It also lists the order products selected for an undispatched load.

## Generating the report
The report can be generated:

* Raw materials | Dispatch | List Bin Loads
* From a bin load   - click on the "Print Bin Load" button.

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
| bin_load_id | Bin load id |`loads.id`  |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Implementation owner address| Info related to the implemenation owner | `party role address.jasper`  using delivery address of implementation owner|
|Customer Address|Info related to the customer party  | `party role address.jasper`  using delivery address of the customer party of the load |
|Bin load id   |Bin load id  |`loads.id`  |
| Customer | Customer | `organizations.medium_description` of the customer on the load |
|Consignee  |Consignee  |  |
|Transporter  |Transporter  |`organizations.medium_description` of the transporter on the load |
|Dest Depot  | Destination Depot  |`depots.description`  |
|Bin Qty | The total sum of bins on load |sum `count(rmt_bins.id)`  |
| Shipped at | Shipped date |`bin_loads.shipped_at`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
| Com |Commodity  |`commodities.code`  |
| Cult |cultivar  |`cultivars.cultivar_name`  |
| Class | Class |`rmt_classes.rmt_class_code`  |
| Puc | Puc |`pucs.puc_code`  |
| Orch | Orchard |`orchards.orchard_code`  |
| Bin type |Bin type  |`rmt_container_material_types.container_material_type_code`  |
| Bin qty |Number of bins  |`bin_load_products.qty_bins`  |
## Subreport: bins
| Label | Description | Source |
| ----- | ----------- | ------ |
|ID  |Bin id  |`rmt_bins.id,`  |
|Asset no |Bin shipped asset number  |`rmt_bins.shipped_asset_number`  |
| Com |Commodities  |`commodities.code` |
|Cult  |Cultivar  |`cultivars.cultivar_name` |
|Cls  | Rmt Class code |`rmt_classes.rmt_class_code`  |
| Size | Rmt Size |`rmt_sizes.size_code`  |
|Puc  |Puc  |`pucs.puc_code`|
|Orch  | Orchard |`orchards.orchard_code`  |
|Bin type  |Bin Type  |`rmt_container_material_types.container_material_type_code`  |
|Nett weight  | Nett weight |`rmt_bins.nett_weight`  |