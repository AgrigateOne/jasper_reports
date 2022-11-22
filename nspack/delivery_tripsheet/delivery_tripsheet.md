# Delivery Tripsheet report

## Description
This report details the move of a delivery received to a specified destination and the contents of the delivery.

## Generating the report

The report can be generated:
Raw materials | Deliveries | List Deliveries | Edit Delivery 
* From a delivery - click on the "Tripsheets | List Tripsheet" button.

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|vehicle_job_id|vehicle job id | vehicle_jobs.id |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Vehicle job No |Vehicle job id  | `vehicle_jobs.id`|
|Delivery id |Delivery id  | `deliveries.id`|
|Delivery ref | Delivery refence number | `deliveries.reference_number`|
|Farm| Farm code  | `farms.farm_code`|
|Puc |Puc  | `pucs.puc_code`|
|Orchard|Orchard  | `orchards.orchard_code`|
|Dest Location |Planned destination location  | `locations.location_long_code`|
|Loaded at |Time when vehicle was loaded at source  | `vehicle_jobs.loaded_at`|
|Offloaded at |Time when vehicle was off-loaded  at destination | `vehicle_jobs.offloaded_at`|
|Business process |Type of task/activity   | `business_processes.process`|
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Bin number |Rmt bin identifier  | the first of :`rmt_bins.bin_asset_number` or `rmt_bins.tipped_asset_number` or `rmt_bins.shipped_asset_number` or `rmt_bins.scrapped_bin_asset_number` that has a value|
|Cultivar |Cultivar  | the first of: `cultivars.cultivar_name` or `cultivar_groups.cultivar_group_code` that has a value|
|Rmt | Bin raw material code  | `rmt_codes.rmt_code`|
|Size |Bin raw material size  | `rmt_sizes.rmt_size_code`|
|Class | Bin raw material class | `rmt_classes.rmt_class_code`|
|Colour |Fruit in the bin colour percentage  | `colour_percentages.colour_percentage`|
|Farm |Farm code  | `farms.farm_code`|
|Age |Age of rmt bin  | Time now - `rmt_bins.created_at`|
|Main ColdStr |The main cold treatment applied to bin | `treatments.treatment_code`|
|Regime |Cold store type  | `rmt_bins.legacy_data ->> 'cold_store_type'`|
|Nett |Bin nett weight  | `rmt_bins.nett_weight`|
|Full | The level of bin fullness | `rmt_bins.bin_fullness`|
|Sample |Indication of whether a bin is a sample bin  | `rmt_bins.sample_bin`|
|Bin type material |Bin container material type  |`rmt_container_material_types.container_material_type_code`|
|Location |Bin planned destination location  | `locations.location_long_code`|
## Report footer
| Label | Description | Source |
| ----- | ----------- | ------ |
|Approved by |Name of person wo approves the tripsheet  |manually filled in|
|Driver |Name of driver of vehicle  | manually filled in|
|Driver Cell| Cell number of driver of vehicle | manually filled in|

