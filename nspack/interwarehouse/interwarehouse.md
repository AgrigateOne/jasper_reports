# Interwarehouse report

## Description

Interwarehouse represents a list of pallets or bins to moved or moved from one location to another.


## Generating the report

The report can be generated:
1. Finished goods | IW Transfers | Vehicle jobs
* From a vehicle job  - click on the "print tripsheet" button.

2. Raw materials | IW Transfers | Vehicle jobs
* From a vehicle job  - click on the "print tripsheet" button.


## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Vehicle job no.  | Vehicle job number |`vehicle_jobs.id`  |
|Govt inspection sheet  |Govt inspection sheet id  |`vehicle_jobs.govt_inspection_sheet_id`  |
|Loaded at location |Packhouse name loaded from  |`plt_packhouses.plant_resource_code`  |
|Dstn location  |Location to  | `locations.location_long_code` |
|Loaded at | Time when bins or pallets were loaded |`vehicle_jobs.loaded_at` |
|Offloaded at |Time when bins or pallets were offloaded at the destination  |`vehicle_jobs.offloaded_at` |
|Business process  |The process/context of this move  |`business_processes.process`  |
|Vehicle job no.  |Vehicle job number |`vehicle_jobs.id`  |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Pallet number  | Pallet number | `pallets.pallet_number` |
|Varieties  |List of marketing varieties  | `marketing_varieties.marketing_variety_code` |
|Target market  |List of packed target market groups  |`target_market_groups.target_market_group_name`  |
|Pack  |List of standard pack codes  |`standard_pack_codes.standard_pack_code`  |
|Size ref  |List of fruit size references  | `fruit_size_references.size_reference` |
|Actual count |List of actual fruit counts  |` fruit_actual_counts_for_packs.actual_count_for_pack`  |
|Grade  |List of fruit grades  |`grades.grade_code`  |
|Ctn qty  |Total number of cartons on the tripsheet  |`sum(pallet_sequences.carton_quantity)`  |
|Inspection  |Inspection result status  | `pallets.govt_inspection_passed` |
## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
|Approved by  | Name of person that approves the move  |manually filled in |
|Signature  |Signature of approver  |manually filled in |
|Driver  |Name of driver transporting the pallets  |manually filled in  |
|Driver cell  | Cell phone number of driver |manually filled in  |
