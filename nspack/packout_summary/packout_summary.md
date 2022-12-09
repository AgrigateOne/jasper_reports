# Packout Summary

## Description
This report summarizes the out from one or more production runs.

The report is either for dispatched output or in-stock. If it dispatched only information 
denoting to loaded out pallets is displayed. 

## Generating the report

The report can be generated as:

  * Production runs | Reports | Aggregate Packout
    
       * From the returned screen several or default parameters are selected.
       * The report can either display summarized info or the details are displayed

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|FromDate|Production run started at time start date range | date  |
|ToDate|Production run started at time end range |date |
|cultivar|Cultivar |`cultivars.cultivar_name`  |
|puc| Puc| `pucs.puc_code`|
|orchard|Orchard| `orchard_orchard_code`|
|line|Production line|`plant_resources.plant_resource_code`  |
|detail_level |Denoting details returned by report |either true or false  |
|dispatched_only|Denoting state of information displayed | either true or false |
## Table Header
| Label | Description | Source |
| ----- | ----------- | ------ |
|  From date |Production run started at time start date range | `production_runs.started_at ` |
|  To date |Production run started at time end range | `production_runs.started_at ` |
|  Cultivar |Selected parameter  cultivar |`cultivar` parameter |
|  PUC |Selected parameter  puc  | `puc` parameter|
|  Orchard |Selected parameter  orchard  | `orchard` parameter |
|  Line |Selected parameter  production_line  | `line` parameter|
## Table Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Season | Production run selected season code | ` seasons.season_code` |
|  Cultivar |Cultivar |`cultivars.description`  |
|  PUC |Puc  | `pucs.puc_code` |
|  Orchard |Orchard  | `orchards.orchard_code`  |
|  Variety |Marketing variety  | ` marketing_varieties.marketing_variety_code` |
|  Grade |Grade  | `grades.grade_code ` |
|  Basic pack | Carton basic pack type | `basic_pack_codes.basic_pack_code ` |
|  Size ref |Fruit size ref  | `fruit_size_references.size_reference ` |
|  Std size |Fruit standard size  | `std_fruit_size_counts.size_count_value ` |
|  Inv code |Inventory code  | `inventory_codes.inventory_code ` |
|  TM |Target market  | ` target_market_groups.target_market_group_name` |
|  Tipped qty |Total number of bins tipped for the selected runs  | `sum(production_run_stats.bins_tipped) ` |
|  Carton qty | Total number of cartons packed for the displayed group |  `sum(pallet_sequences.carton_quantity` |
|  Tipped weight | Total weight of tipped bins | `sum(production_run_stats.bins_tipped_weight) ` |
|   Pack nett weight |Total pallet packed weight from the selected runs  | `sum(pallets.nett_weight) ` |
|  Pack out % |Total packed weight over total bin tipped weight percentage  | `sum(pallets.nett_weight)/sum(production_run_stats.bins_tipped_weight)*100 ` |

