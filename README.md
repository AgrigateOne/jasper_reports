# Jasper Reports

A repository for storing Jasper reports.

* The first level of the directory structure is the application.
* Below this, each report exists in its own folder. These are the "standard" reports - available for all clients.
* Also on the second level is a `logos` directory. This holds all client logos etc.
* On the same level are `client` directories (named for the client). These have client-specific copies of reports in them.
* On the same level are `industry` directories (named for the industry type). These have industry-specific copies of reports in them.
* Per application, by convention, there can be a `shared` directory where subreports that are used in multiple reports can be stored.

An illustration of the directory structure:

    jasper_reports
    ├── nspack
    │   ├── images
    │   ├── report_one
    │   ├── report_two
    │   ├── shared
    │   ├── citrus
    │   │   └── report_two
    │   ├── the_1st_client
    │   │   └── report_two
    │   └── the_2nd_client
    └── pack_materials
        ├── images
        ├── report_one
        └── the_1st_client

In this example, the applications are `nspack` and `pack_materials`.

All clients will use the standard version of `report_two` (`nspack/report_two`) - except for:
* The `the_1st client` which has a specific version of `report_two` (`nspack/the_1st_client/report_two`)
* Any other clients that have an industry type `citrus` will use the industry-specific version of the report (`nspack/citrus/report_two`)

## Conventions

* A directory must have `jrxml` and `jasper` files with the same name as the directory. This is the main report that is run.
* Any subreports should be in the same directory (except for shared subreports - in the `shared` diresctory).
* Each directory should include a markdown file with the same name as the directory with a `.md` file extension.
* The markdown file must describe the report and each field in it.
* When a new report is added, it must also be defined in the `reports_list.yml` file in the root.
* When a report's parameters change, the entry in the `reports_list.yml` file should be updated.

## Reports Config

Attributes for every report in this repository must be kept up-to-date in this file (`reports_list.yml`).

The structure of entries in `reports_list.yml` is as follows:

```yml
reportname:
  group: groupname
  caption: report caption
  path: appliaction/inustry_or_client_or_none/reportname
  params:
    - name: param_name_as_specified_in_the_report
      datatype: integer/string/date/datetime/numeric/boolean/intarray/strarray
      selection: SQL/Array/blank
      default:  Default value or blank
      required: true/false
```

The selection can start with:

* Blank :: if the value is blank, the param is an input, otherwise it is a dropdown.
* `sql1 - ` :: follow with a query that returns a single value.
* `sql2 - ` :: follow with a query that returns two values (display the first, return the second.
* `method - ` :: follow with a method call (e.g. `for_select_party_roles, EXPORTER`)
* `array - ` :: follow with a comma-separated values list.

A default can be:

* Blank (no default value)
* A value (used as-is)
* A Hash in the form:

```yml
default:
  table: table_name
  order: field_name1
  get: field_name2
```
This will return the first `field_name2` in `table_name` ordered by `field_name1`.

## Development

* Clone the repository.
* Run `bin/install-hooks.bash`. This ensures that you do not accidentally check-in a `.jasper` file without a corresponding `.jrxml` file.
* Create the bash alias: `alias deploystats='cp deploystats.sh deploystats.sh.bak && bash deploystats.sh && rm deploystats.sh'`

## Deployment

* Run capistrano: `cap <target> deploy` (where target is one of the targets in the `config/deploy/` directory - without `.rb`. (ensure you are runnning with a version of ruby that has capistrano installed).
* Run the alias `deploystats` to update the Deploys application in staging.
