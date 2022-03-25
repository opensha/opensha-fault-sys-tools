# Hazard Map Calculator Tool

USAGE: `fst_hazard_map_calc.sh --input-file </path/to/solution.zip> --output-dir </path/to/dir> --periods 0,1`

This command line tool allows a user to calculate hazard maps for a [Solution](glossary.md#solution). The output is a HTML file and map plots, and a CSV file containing the hazard curves themselves.

## Command Line Arguments

### Required Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-if/--input-file` | **REQUIRED** | Path to Solution zip file. | `--input-file solution.zip` |
| `-od/--output-dir` | **REQUIRED** | Path to write output the output plots, HTML, and curves. | `--output-dir /path/to/dir` |
| `-p/--periods` | **REQUIRED** | Calculation period(s). Mutliple can be comma separated, and PGA is `0`. | `--periods 0,1` |

### Optional Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-cf/--comp-file` | _(disabled)_ | Comparison solution file | `--comp-file comp_solution.zip` |
| `-g/--gmpe` | `ASK_2014` | GMPE name. Default is ASK_2014 | `--gmpe ASK_2014` |
| `-gs/--grid-spacing` | `ASK_2014` | Grid spacing in degrees. Default: 0.25 | `--grid-spacing 0.25` |
| `-md/--max-distance` | `200` | Maximum distance for hazard curve calculations in km. Default is 200 km | `--max-distance 200` |
| `-rc/--recalc` | _(disabled)_ | Flag to force recalculation (ignore existing curves files) | `--recalc` |

