# Accompanying Phyto report

## Description

Phytosanitary report, also known as the China phyto report.

It presents a list of selected pallets for inspection.

## Generating the report

The report can be generated:

* From a load - click on the "China Phyto Report" button.
* From the `Finished Goods | Inspection | Phyto report` menu - select the pallets to appear on the report and press the save button in the grid header.

## Data sources


## Header
| Label | Description | Source |
| ----- | ----------- | ------ |
| Document No / Series no | | '00' followed by the load `id` |
| Commodity | The commodity of all fruit on the report | Commodity `description` |
| Importing | Importing country | Final destination (OR destination country on the govt inspection sheet's `description` ) |
| Exporting Company & contact details: | Info related to the exporter | Organizations (medium description), contact method tel and contact method - cell |
| Producer's Address: | subreport  | `producer_address.jasper` using delivery address of pallet's exporter party or the default exporter |
| Magestrial District |The district in which the depot is located or the place where the phyto inspection takes place| the first of `depots.magisterial_district` or the passed in default `phyto_inspection_depot`  that has a value|
|Dalrrd Inspection Depot | name of depot | the first of: `depots.depot_code` or the passed in default `phyto_inspection_depot`  that has a value|
|Packhouse Code |The packhouse code where the fruit was packed | `pallets.phc`|
|Packhouse Person's Contact details |Info related to the packhouse contact person |person `first and last name,contact method tel and contact method` - cell|
|Dalrrd seq no | | |
|Inspection date |The date on which the Dalrrd phyto inspector inspects the pallets on this document |manually filled in by the inspector |
|Inspector no |The inspector's code |manually filled in by the inspector|
|Inspector's Signature |The inspector's signature | manually filled in by the inspector|
|Contact Details & No | The inspector's contact |manually filled in by the inspector |
## Subreport: puc_summary
| Label | Description | Source |
| ----- | ----------- | ------ |
|Intake Document |The number on the document that represents a batch of received pallets |the first of: `govt_inspection_sheets.consignment_note_number` or `pallets.edi_in_consignment_note_number` that has a value  |
|PUC's |Grouped PUCs for each intake | `pucs.puc_code`|
|Total Ctns |Sum of cartons on an intake| sum of pallet_sequences.carton_quantity|
|Total Plts |Total number of pallets on an intake |number of pallets |
|PalletID/Pallet barcode ID |Unique string that identifies each pallet |`pallets.pallet_number`|
## Detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|PUC's |The name of the farm where fruit was obtained |`pucs.puc_code` |
|Variety | Pallet fruit variety|`varieties.variety code` |
|Block No | The section on the farm where fruit was obtained|`orchards.orchard_code` |
|Carton qty | Sum of cartons on a pallet|sum of `pallet_sequences.carton_quantity` |
|Date code | sell by code| `pallet_sequences.pick_ref`|
|Count |Size of individual fruit items that fits into a box |first of: calculated `edi_size_count` ,`fruit_actual_counts_for_packs.actual_count_for_pack` and `fruit_size_references.size_reference` that has a value.( edi_size_count - When std_pack_use_size_ref is true  or commodities.use_size_ref_for_edi is true  then the the first of:  fruit_size_references.edi_out_code,fruit_size_references.size_reference, fruit_actual_counts_for_packs.actual_count_for_pack that has a value is returned else return the first of fruit_actual_counts_for_packs.actual_count_for_pack,  fruit_size_references.edi_out_code  and fruit_size_references.size_reference that has a value ) |
|On Hold | | |
|Remarks/Comments by Dalrrd | |manually filled in |