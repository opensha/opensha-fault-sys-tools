# Hazard Map Calculator Tool

USAGE: `fst_hazard_calc.sh --input-file </path/to/solution.zip> --output-dir </path/to/dir> --periods 0,1`

This command line tool allows a user to calculate hazard products at specific sites for a [Solution](glossary.md#solution). The output is a CSV file (or series of CSV files, depending on supplied options), and optionally an HTML report with plots.

If you run into memory issues (e.g., calcluations crash with OutOfMemory exceptions or similar), either increase memory available by setting the `OPENSHA_MEM_GB` environmental variable, or decrease parallelism via the `--threads <num>` command line argument.

## Command Line Arguments

### Inputs and Outputs

You are required to supply an input file (via `--input-file`), and either an output directory (via `--output-dir`) or an output file (via `--output-file`).

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-if/--input-file` | **REQUIRED** | Path to input solution zip file. | `--input-file solution.zip` |
| `--name` | _Solution_ | Name of the solution (used in plots). | `--name "Solution""` |
| `-cmp/--compare-to` | _(disabled)_ | Optional path to an alternative solution for comparison. | `--compare-to comp_solution.zip` |
| `--comp-name` | _Comparison Solution_ | Name of the comparison solution. | `--comp-name "Comparison Solution"` |
| `-od/--output-dir` | _(N/A)_ | Output directory where curves and a report (with plots) will be written. You must supply either this, or --output-file to write curves only (without the repoort). The report will be written to `index.html` and `README.md`, curves will be written to `curves_<period>.csv`, and all plots will be placed in a `resources` subdirctory. | `--output-dir /path/to/dir` |
| `-of/--output-file` | _(N/A)_ | Output CSV file where hazard curves will be written if you don't want to generate a report with plots (alternative to --output-dir). If multiple periods are supplied, a period-specific suffix will be added before the .csv extension. If a comparison model, '_comp' will also be appended. | `--output-file /path/to/file` |

### Site Specification

You are required to supply at least one site for calculation. Example site list CSV files are available here: [without site parameters](../examples/hazard_site_list.csv), [with site parameters](../examples/hazard_site_list_with_params.csv)

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `--nehrp-sites` | _(N/A)_ | Flag to calculate at NEHRP sites. If the solutions supplies a model region, sites in that region will be included, otherwise sites within the hazard calculation maximum distance (see --max-distance) will be included. | `--nehrp-sites` |
| `--site-location` | _(N/A)_ | Site location specified as <lat>,<lon>; must supply either this, --sites, or --nehrp-sites. | `--site-location 34,-118` |
| `--site-name` | _(N/A)_ | Site name, optionally used in conjunction with --site-location. | `--site-name "My Location"` |
| `--sites` | _(N/A)_ | Path to a site list CSV file. The first 3 columns must be: `Name`, `Latitude`, and `Longitude`. The first row is assumed to be a header, and site parameters can optionally be passed in via additional columns (supplied in any combination/order). Recognized site paramter column headers are: `Vs30` (unts are m/s), `Z1.0` (units are m, supply `NaN` for default treatment), and `Z2.5` (units are km, supply `NaN` for default treatment). | `--sites /path/to/sites.csv` |
| `--vs30` | _(GMM default)_ | Site Vs30 in m/s. | `--vs30 760` |
| `--z10` | _(GMM default)_ | Site Z1.0 (depth Vs=1.0 km/s), supplied in meters. If not supplied (and the chosen GMPE uses Z1.0), the default (usually Vs30-dependent) model will be used. | `--z10 100` |
| `--z20` | _(N/A)_ | Site Z2.5 (depth Vs=2.5 km/s), supplied in kilometers. If not supplied (and the chosen GMPE uses Z2.5), the default (usually Vs30-dependent) model will be used. | `--z25 1.25` |

### Calculation Parameters

You are required to specify calculation spectral periods (or PGA/PGV). This can be done via `--period` or `--all-periods`.

| `--gmpe` | `ASK_2014` | GMPE name. Default is `ASK_2014`, and the full list can be found at https://github.com/opensha/opensha/blob/master/src/main/java/org/opensha/sha/imr/AttenRelRef.java | `--gmpe ASK_2014` |
| `-p/--periods` | _(N/A)_ | Calculation spectral period(s). Mutliple can be comma separated; supply 0 for PGA, or -1 for PGV. | `--periods 0,1` |
| `--all-periods` | _(N/A)_ | Flag to calculate all available periods (alternative to --periods). | `--all-periods` |
| `-t,--threads` | _(system-dependent)_ | Number of calculation threads. Default is the lesser of 32 and the number of processors on the system. | `--threads 8` |
| `--spectra` | _(N/A)_ | Flag to calculate and plot hazard spectra. Usually used in conjunction with --all-periods. Also see --return-periods. | `--spectra` |
| `--max-distance` | 200 | Maximum distance for hazard curve calculations in km. | `--max-distance 200` |
| `--gridded-seis` | _(N/A)_ | By default, gridded seismicity will be included in calculations if gridded sources are present in the input fault system solution. You can override this behavior with this argument, and options are: INCLUDE, EXCLUDE, ONLY. | `--gridded-seis INCLUDE` |
| `--duration` | 1 | Sets the duration for curve calculations; default is 1 year (annual probabilities of exceedance). | `--` |
| `--return-periods` | _(N/A)_ | Sets custom return periods (in years) to highlight in plots (or use in disaggregations if --disagg-rps is supplied). Default are those corresponding to 2% and 10% probability in 50 years. | `--return-periods 2500` |
| `--disagg-prob` | _(N/A)_ | Enables disaggregation at the specified probability of exceedance level(s); multiple levels can be comma separated. | `--disagg-prob 4e-4,0.001` |
| `--disagg-iml` | _(N/A)_ | Enables disaggregation at the specified intensity measure level(s); multiple levels can be comma separated. | `--disagg-iml 0.1,0.5` |
| `--disagg-rps` | _(N/A)_ | Enables disaggregation at the recurrence intervals. By default, those corresponding to 2% and 10% in 50 years (override with --return-periods). | `--disagg-rps` |
| `--disagg-max-dist` | _200_ | Sets the maximum distance for disaggregation plots. | `--disagg-max-dist 200` |
| `--disagg-min-mag` | _(N/A)_ | Sets the minimum magnitude for disaggregation plots. | `--disagg-min-mag 5.0` |
| `--disagg-max-mag` | _(N/A)_ | Sets the maximum magnitude for disaggregation plots. | `--disagg-max-mag 8.5` |

### Miscellaneous Arguments

| `--write-pdfs` | _(PNG plots only)_ | Flag to also write figures as PDFs. Plotting may take significantly longer if there are many sites, periods, and/or disaggregations. | `--write-pdfs` |

### Examples

To calculate hazard curves and spectra periods spectra for all NEHRP sites near your model:

```
fst_hazard_calc.sh --input-file solution.zip --nehrp-sites --all-periods --spectra --output-dir report
```

To calculate and disaggregate PGA hazard at a single site, overriding the Vs30 value and using the BSSA (2014) ground motion model:

```
fst_hazard_calc.sh --input-file solution.zip --site-location 34,-118 --periods 0 --vs30 500 --gmpe BSSA_2014 --name "My Site" --disagg-rps --output-dir report
```


