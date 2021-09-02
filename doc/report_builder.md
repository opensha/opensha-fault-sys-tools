# Rupture Set/Solution Report Builder

USAGE: `fst_report_builder.sh --input-file /path/to/input.zip --output-dir /path/to/report`

Generates Markdown/HTML reports with diagnostic plots from a [Rupture Set](glossary.md#rupture-set) or [Solution](glossary.md#solution).

## Command Line Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-i/--input-file` | **REQUIRED** | Path to the primary rupture set/solution being evaluated. | `--input-file rup_set.zip` |
| `-od/--output-dir` | **REQUIRED** | Output directory to write the report. Must supply either this or --reports-dir. | `--output-dir /path/to/dir` |
| `-/--alt-plausibility` | _(disabled)_ | Path to a JSON file with an alternative set of plausibility filters which the rupture set should be tested against. | `--alt-plausibility plausibility.json` |
| `-cd/--cache-dir` | _(disabled)_ | Path to cache files to speed up calculations. | `--cache-dir /path/to/cache` |
| `-cmp/--compare-to` | _(disabled)_ | Optional path to an alternative rupture set for comparison. | `--compare-to other_rup_set.zip` |
| `-cn/--compare-name` | _(file name)_ | Name of the comparison rupture set, if not supplied then the file name will be used. | `--compare-name "My Comparison"` |
| `-dmd/--default-max-dist` | `10` | Default maximum distance to use to infer connection strategies (if rupture set doesn't have one). Default: 10.0 km. | `--default-max-dist 10` |
| `-n/--name` | _(file name)_ | Name of the rupture set/solution, if not supplied then the file name will be used as the name. | `--name "My Rupture Set"` |
| `-pl/--plot-level` | `DEFAULT` | This determins which set of plots should be included. One of: LIGHT, DEFAULT, FULL. Default: DEFAULT. | `--plot-level DEFAULT` |
| `-rd/--reports-dir` | _(single output dir)_ | Directory where reports should be written. Individual reports will be placed in subdirectories created using the fault system rupture set/solution file names. Must supply either this or --output-dir. | `--reports-dir /path/to/dir` |
| `-sp/--skip-plausibility` | _(disabled)_ | Flag to skip plausibility calculations | `--skip-plausibility` |
