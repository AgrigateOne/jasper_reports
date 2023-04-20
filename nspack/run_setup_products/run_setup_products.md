# Run Product report

## Description
This report represents the production run - it's  input(bins) and the output(cartons) summary.

## Generating the report

The report can be generated:

* Production | Runs | List Production Runs
* From a production run  - click on the "Reports | Run Product" button.


## Report parameters

| Parameter | Description | Source |
| ----- | ----------- | ------ |
|production_run_id |production run id|production_runs.id  |

## Table Header

| Label | Description | Source |
| ----- | ----------- | ------ |
|Code| Production run code | fn_production_run_code  |
|Run Number|Production run batch number  | `production_runs.run_batch_number`  |
|Picking reference| Picking reference | `carton_labels.pick_ref`  |
|Puc phc|Puc code  | `pucs.puc_code`  |
|Created at|Production run created at date   | `production_runs.created_at`  |
|Updated at|Production run  updated at date  | `production_runs.updated_at`  |

## Report Detail

| Label | Description | Source |
| ----- | ----------- | ------ |
| Variety| Marketing variety code  |`marketing_varieties.marketing_variety_code` |
| Grade | Grade code| `grades.grade_code grade` |
| Size/Count |Fruit count that fits in a standard box  | the first of: `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.size_reference` that has a value is returned else return the first of `fruit_actual_counts_for_packs.actual_count_for_pack` or `fruit_size_references.edi_out_code`or  `fruit_size_references.size_reference` that has a value |
| Pack |Standard pack code  | `standard_pack_codes.standard_pack_code` |
| Mark |Mark codes | `marks.mark_code` |
| Target market |Target market  | first of: `target_markets.target_market_name` or `packed_tm_groups.target_market_group_name` that has a value |
| Inventory code | Inventory code | `inventory_codes.inventory_code` |
| Organization | Marketing organization | organizations.medium description of the marketing org specified on the carton label record|
| PUC |Puc  |`pucs.puc_code` |
|Orchard  | Orchard | `orchards.orchard_code orchard` |
|Global gap  |Global code code  | `pucs.gap_code ` |
|Organization short code  |Marketing Organization short code  | `marketing_org.short_description` |
|Organization medium description  |Marketing Organization medium description   | `marketing_org.medium_description` |
|Organization address  |Marketing organization's address  | fn_party_role_delivery_address |
|Farm group code  | Farm group code  | `farm_groups.farm_group_code` |
| Allokasie nr | Allocation number | blank |
| Signature |Signature  |manually filled in  |

