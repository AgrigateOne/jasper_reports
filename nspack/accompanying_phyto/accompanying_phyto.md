# Accompanying Phyto report

## Description

Phytosanitary report, also known as the China phyto report.

It presents a list of selected pallets for inspection.

## Generating the report

The report can be generated:

* From a load - click on the "China Phyto Report" button.
* From the `Finished Goods | Inspection | Phyto report` menu - select the pallets to appear on the report and press the save button in the grid header.

## Data sources

| Label | Description | Source |
| ----- | ----------- | ------ |
| Document No / Series no | | '00' followed by the load `id` |
| Commodity | The commodity of all fruit on the report | Commodity `description` |
| Importing | Importing country | Final destination (OR destination country on the govt inspection sheet's `description` !!! BUG??? - two cols same name]) |
| Exporting Company & contact details: | Info related to the exporter | Organizations (medium description), contact method tel and contact method - cell |
| Producer's Address: | subreport  | `producer_address.jasper` using delivery address of pallet's exporter party or the default exporter |
