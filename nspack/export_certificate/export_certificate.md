# Export Certificate report

## Description
This report summarizes the contents of the load to be exported.

## Generating the report

The report can be generated:
Finished Goods | Dispatch | List Loads
* From a load - click on the "Export Certificate" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|load_id|Load id | loads.id |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Trader/Exporter's name | Info related to the exporter  |Address , City and country|
|Serial Number |Serial number  | 42/`loads.exporter_certificate_code`/`loads.id`|
|Packer/production unit code identified on packaging| Unit Code | AS Per Attached Addendum |
|Country of origin |Exporting country  |Republic Of South Africa|
|Country of destination |Importing country  | `destination_countries.description`|
|Means of Transport |Method used to transport the load  |SEA|
|Vessel |Name of Vessel used in transporting the load  | `vessels.vessel_code`|
|Container numbers | Container code | `load_containers.container_code`|
|Packages (number and type) | Total quantity of cartons per commodity,marketing variety and product class| `sum(pallet_sequences.carton_quantity)`|
|Type of product | Product description | `commodities.description` and `marketing_varieties.description`|
|Quality class |Product class description  | if `rmt_classes.description` = CAT I  then CLASS 1 elseif `rmt_classes.description` = CAT II then CLASS 2 else `rmt_classes.description`|
|Total weight in kg gross/net |Total Pallet nett weight per commodity,marketing variety and product class| `sum(pallet_sequences.nett_weight)`|
|Period of validity days   |The period of time during which the export certificate is intended to be valid  |40 days by Sea or Land and 10 days by Air|
|Date of issue   |Date of issue of certificate  | date today|
|Place of issue |Place where the certificate is issued  | manually filled in|
|Inspector | Inspector name |manually filled in|
|Comments/observations | Other comments |manually filled in|
