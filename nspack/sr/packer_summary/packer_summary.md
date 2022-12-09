# Packer  summary report

## Description
This report summarizes  the number of cartons and fruit quantity packed per each inventory type for each packer in a selected 
period of time and the total earnings earned across all shifts.


## Generating the report
The report can be generated:

* Production | Shifts | Summary reports | Packers
* From the report page menu  - select revelant dates
    * From the resulting grid select the relevant packers and submit
      The report can be generated:

## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|FromDateTime| Start date time of the selected period   |  Passed in date time                 |
|ToDateTime  | End date time of the selected period     |  Passed in date time                 |
|WorkerIds   | Shift workers Id                         |  Passed in selected packer IDs  |
## Report
| Label | Description | Source |
| ----- | ----------- | ------ |
|  Pno |Contract worker personnel barcode | `contract_workers.personnel_number` |
|  Name |Contract worker first and last name | `contract_workers.first_name`  +  `contract_workers.last_name`|
|  Ctn  |Number of cartons packed by worker with the same fruit_item_incentive_rate per  inventory code  | `count(carton_labels.id)` |
|  Total Cartons  |Number of cartons by packer |sum of all Ctns |
| Fruit Qty  |Actual  fruit count  packed   with the same fruit_item_incentive_rate per  inventory code| `sum(fruit_actual_counts_for_packs.actual_count_for_pack)` |
| Total fruit Qty  |Total sum of Fruit Quantity packed by each packer | sum of all Fruit Qty |
| Inv  |List of Inventory codes with the same fruit_item_incentive_rate| `inventory_codes.inventory_code` |
| Cost  |The total cost of packing fruit quantities with the same  fruit_item_incentive_rate  | `sum(fruit_actual_counts_for_packs.actual_count_for_pack * inventory_codes.fruit_item_incentive_rate)` |
|Total earnings   |The total amount to be paid for all fruit quantities packed by worker| Sum of Cost of fruit |

