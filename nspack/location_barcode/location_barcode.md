# Location barcode report

## Description
This report displays a location barcode together with location_short_code and location_long_code and print_code.

## Generating the report

The report can be generated:
Masterfiles | Locations | Print Location Barcodes
* From a location - click on the "Print barcode" button.


## Report parameters
| Parameter | Description | Source |
| ----- | ----------- | ------ |
|location_ids|list of location ids | locations.id |
## Report detail
| Label | Description | Source |
| ----- | ----------- | ------ |
|Location long code| Location long code |`locations.location_long_code`|
|Location short code |Location short code |`locations.location_short_code`|
|Print code /Location print code| Location print Code | `locations.print_code` |
