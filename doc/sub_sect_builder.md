# Subsection Builder Tool

USAGE: `fst_sub_sect_builder.sh --input-file </path/to/faults.geojson> --output-file </path/to/subsections.geojson>`

This command line tool allows a user to convert a fault model to a set of subsections, to be used when building a rupture set.

## Command Line Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-if/--input-file` | **REQUIRED** | Path to a file containing fault sections. This should either be a GeoJSON file, or a legacy OpenSHA fault sections XML file. See https://opensha.org/Geospatial-File-Formats for more information. | `--input-file faults.geojson` |
| `-of/--output-file` | **REQUIRED** | Path to output GeoJSON file where subsections should be written. | `--output-file subsections.geojson` |
| `-ddf/--down-dip-fract` | `0.5` | Fault sections are divided into equal length subsections; those lengths are determined as a function of the down-dip width of the fault. | `--down-dip-fract 0.5` |
| `-fl/--fixed-length` | _(disabled)_ | Fault sections are divided into equal length subsections; those lengths are usually determined as a function of the down-dip width of the fault (see --down-dip-fraction), but can instead be of a fixed length through this optino. If supplied, each subsection will be no longer than the given length (in kilometers). | `--fixed-length 10` |
| `-fm/--fault-model` | _(disabled)_ | UCERF3 Fault Model, used to fetch UCERF3 fault sections as an alternative to --input-file. | `--fault-model FM3_1` |
| `-mpf/--min-per-fault` | `2` | Minimum number of subsections per fault, regaurdless of fault length. | `--min-per-fault 2` |
