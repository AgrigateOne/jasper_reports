# Accompanying Phyto report

## Description

Phytosanitary report, also known as the China phyto report.

This one is for the apple industry.

It presents a list of selected pallets for inspection on a load.

## Generating the report

The report can be generated:

* From a load - click on the "China Phyto Report" button.


## Report header
| Label | Description | Source |
| ----- | ----------- | ------ |
| Document No / Series no | | '00' followed by the load `id` |
| Commodity | The commodity of all fruit on the report | Commodity `description` |
| Importing | Importing country | the first of: destination country on the govt inspection sheet's `description or final destination selected on a load that has a value. ) |
| Exporting Company & contact details: | Info related to the exporter | Organizations (medium description), contact method tel and contact method - cell |
| Producer's Address: | subreport  | `producer_address.jasper`  using delivery address of implementation owner |
| Magestrial District |The district in which the depot is located or the place where the phyto inspection takes place| `depots.magisterial_district` |
|Inspection Depot | name of depot | passed in 'install depot'|
|Packhouse Code |The packhouse code where the fruit was packed | depot selected on load`ph.packhouse_code`|
|Packhouse Person's Contact details |Info related to the packhouse contact person |person `first and last name,contact method tel and contact method` - cell|
|Daff seq no | | |
|Inspection date |The date on which the Dalrrd phyto inspector inspects the pallets on this document |manually filled in by the inspector |
|Inspector no |The inspector's code |manually filled in by the inspector|
|Contact Details & No | The inspector's contact |manually filled in by the inspector |
## Subreport: puc_summary
| Label | Description | Source |
| ----- | ----------- | ------ |
|Intake Document |The number on the document that represents a batch of received pallets |the first of: `govt_inspection_sheets.consignment_note_number` or `pallets.edi_in_consignment_note_number` that has a value  |
|PUC's |Grouped PUCs for each intake | `pucs.puc_code`|
|Total Ctns |Sum of cartons on an intake| sum of pallet_sequences.carton_quantity|
|Total Plts |Total number of pallets on an intake |number of pallets |
## Report Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|PalletID/Pallet barcode ID |Unique string that identifies each pallet |`pallets.pallet_number`|
|PUC's |The name of the farm where fruit was obtained |`pucs.puc_code` |
|Variety | Pallet fruit variety|`varieties.variety code` |
|Block No | The section on the farm where fruit was obtained|`orchards.orchard_code` |
|Carton qty | Sum of cartons on a pallet|sum of `pallet_sequences.carton_quantity` |
|Date  | sell by code| `pallet_sequences.pick_ref`|
|Count |Size of individual fruit items that fits into a box |first of:`fruit_size_references.size_reference` or `fruit_actual_counts_for_packs.actual_count_for_pack`  that has a value|
|On Hold | | |
|Remarks/Comments by Dalrrd | |manually filled in |