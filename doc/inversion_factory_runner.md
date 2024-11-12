# Inversion Runner Tool

USAGE: `fst_inversion_factory_runner.sh [--rupture-set </path/to/rupture_set.zip>] --output-file </path/to/output_solution.zip> [--nshm23 OR --ucerf3] --branch-choice <Level>:<Choice>`

This command line tool allows a user to run an inversion to solve for the rates of each [supra-seismogenic rupture](glossary.md#supra-seismogenic-rupture) from a [Rupture Set](glossary.md#rupture-set). The output is a [Solution](glossary.md#solution) zip file.

Unlike the regular [Inversion Runner Tool](inversion_runner.md), this tool is used to reproduce results from published models (possibly with modified inputs or options). You first select a model (such as UCERF3 or NSHM23), and then optionally override [logic tree branch](glossary.md#logic-tree-branch) paremeters. You can either pass in a externally created rupture set (e.g., one created with the [Rupture Set Builder Tool](rup_set_builder.md) and with all slip rates and scaling relationships already set), or build one for a logic tree branch. All inversion paramters and constraints will be set to default values for that model, though some can be overridden either through overriding [simulated annealing](#simulated-annealing-parameters) and [model-specific](#models-and-paremeters) parameters.

The [Simulated Annealing](glossary.md#simulated-annealing) inversion approach is described in detail in these publications:

* Milner, K. R., & Field, E. H. (2023). A Comprehensive Fault‐System Inversion Approach: Methods and Application to NSHM23. _Bulletin of the Seismological Society of America_, 114(1), 486-522. doi: 
https://doi.org/10.1785/0120230122
* Morgan T. Page, Edward H. Field, Kevin R. Milner, Peter M. Powers; The UCERF3 Grand Inversion: Solving for the Long‐Term Rate of Ruptures in a Fault System. _Bulletin of the Seismological Society of America_, 104 (3): 1181–1204. doi: https://doi.org/10.1785/0120130180

## Models and Parameters

You must specify an inversion model using one of the following flags. Models can define their own optional command line arguments in addition to their logic tree branch choices.

### NSHM23

The NSHM23 model for active crustral faults in the Western U.S. can be used by supplying the `--nshm23` flag. NSHM23 is described in the following publications:

* Field, E. H., Milner, K. R., Hatem, A. E., Powers, P. M., Pollitz, F. F., Llenos, A. L., ... & Herrick, J. A. (2023). The USGS 2023 conterminous US time‐independent earthquake rupture forecast. Bulletin of the Seismological Society of America, 114(1), 523-571, doi: https://doi.org/10.1785/0120230120
* Milner, K. R., & Field, E. H. (2023). A Comprehensive Fault‐System Inversion Approach: Methods and Application to NSHM23. _Bulletin of the Seismological Society of America_, 114(1), 486-522. doi: 
https://doi.org/10.1785/0120230122

By default, logic tree branch options will be set to average or preferred values. The default logic tree branch, along with avaiable options, is:

| Level | Type | Default Choice | Options |
|-----|-----|-----|-----|
| Fault Model | Rupture Set | `NSHM23_v3` | `NSHM23_v1p4, NSHM23_v2, NSHM23_v3` |
| Deformation Model | Rupture Set | `AVERAGE` | `GEOLOGIC, EVANS, POLLITZ, SHEN_BIRD, ZENG, AVERAGE, MEDIAN` |
| Scaling Relationship | Rupture Set | `NSHM23_Avg` | `LogA_C4p3, LogA_C4p2, LogA_C4p1, WdthLmtd, LogA_C4p2_SqrtLen, LogA_C4p1_SqrtLen, WdthLmtdCSD, NSHM23_Avg` |
| Supra-Seismogenic b-value | Solution | `AvgSupraB` | `SupraB0.0, SupraB0.25, SupraB0.5, SupraB0.75, SupraB1.0, AvgSupraB` |
| Paleoseismic Data Uncertainties | Solution | `AverageFitPaleo` | `EvenFitPaleo, OverFitPaleo, UnderFitPaleo, AverageFitPaleo` |
| Segmentation Model | Solution | `AvgSeg` | `None, LowSeg, MidSeg, HighSeg, Classic, FullClassic, AvgSeg` |
| Regional Seismicity Rate | Solution | `PrefSeis` | `PrefSeis, LowSeis, HighSeis` |
| Seismicity Declustering Algorithm | Solution | `AVERAGE` | `GK, NN, REAS, AVERAGE` |
| Seismicity Smoothing Kernel | Solution | `AVERAGE` | `ADAPTIVE, FIXED, AVERAGE` |
| Off Fault Mmax | Solution | `MAG_7p6` | `MAG_7p3, MAG_7p6, MAG_7p9` |

Branches listed with type 'Rupture Set' above will be omitted if a pre-built rupture set is passed in via `--rupture-set`.

The NSHM23 model supports the following optional command line arguments:

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `--full-sys-inv` | _(cluster-specific inversion)_ | Flag to force a single full-system inversion rather than splitting the problem into smaller inversions for each isolated fault system. | `--full-sys-inv` |
| `--iters-per-rup` | _2000_ | Specify the number of iterations per rupture in order to speed up the inversion or change convergence. | `--iters-per-rup 2000` |
| `--no-gridded` | _(including gridded)_ | Flag to disable the gridded seismicity model; useful if you are applying NSHM23 methodology to a new region (or just don't need gridded seismicity). | `--no-gridded` |

### UCERF3

The UCERF3 model can be used by supplying the `--ucerf3` flag. UCERF3 is described in the following publications:

* Field, E. H., Arrowsmith, R. J., Biasi, G. P., Bird, P., Dawson, T. E., Felzer, K. R., ... & Zeng, Y. (2014). Uniform California earthquake rupture forecast, version 3 (UCERF3)—The time‐independent model. _Bulletin of the Seismological Society of America_, 104(3), 1122-1180, doi: 
https://doi.org/10.1785/0120130164
* Morgan T. Page, Edward H. Field, Kevin R. Milner, Peter M. Powers; The UCERF3 Grand Inversion: Solving for the Long‐Term Rate of Ruptures in a Fault System. _Bulletin of the Seismological Society of America_, 104 (3): 1181–1204. doi: https://doi.org/10.1785/0120130180

By default, logic tree branch options will be set to average or preferred values. The default logic tree branch, along with avaiable options, is:

| Level | Type | Default Choice | Options |
|-----|-----|-----|-----|
| Fault Model | Rupture Set | `FM3_1` | `FM2_1, FM3_1, FM3_2` |
| Deformation Model | Rupture Set | `MeanU3DM` | `UC2ALL, NCAL, BAY, ABM, GEOB, NEOK, ZENG, ZENGAB, ZENGBB, GEOL, GLUP, GLLOW, GLpABM, GLpABMOLD, MeanU3DM` |
| Scaling Relationship | Rupture Set | `MeanU3Scale` | `AveU2, Shaw09Mod, HB08, EllB, EllBsqrtLen, ShConStrDrp, MeanU3Scale, TMG_SUB_2017, TMG_CRU_2017` |
| Slip Along Rupture Model (Dsr) | Rupture Set | `DsrMeanU3Dsr` | `DsrChar, DsrUni, DsrWG02, DsrTap, DsrMeanU3Dsr` |
| Inversion Model | Solution | `CharConst` | `CharConst, GRConst, CharUnconst, GRUnconst` |
| Total Mag 5 Rate | Solution | `M5Rate7.9` | `M5Rate6.5, M5Rate7.9, M5Rate9.6, M5Rate7.6, M5Rate8.7, M5Rate10.0` |
| MMax Off Fault | Solution | `MMaxOff7.6` | `MMaxOff7.3, MMaxOff7.6, MMaxOff7.9, MMaxOff7.2, MMaxOff8.0` |
| Moment Rate Fixes | Solution | `NoFix` | `ApplyCC, RelaxMFD, ApplyCCRelaxMFD, NoFix` |
| Spatial Seismicity PDF | Solution | `SpatSeisU3` | `SpatSeisU2, SpatSeisU3, SpatSeisAveDM_off, SpatSeisAveDM_all, SpatSeisUnsmoothed` |

Branches listed with type 'Rupture Set' above will be omitted if a pre-built rupture set is passed in via `--rupture-set`.

## Common Command Line Arguments

### Inputs and Outputs

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-rs/--rupture-set` | _Built according to logic tree branch_ | Path to Rupture Set zip file. | `--rupture-set rupture_set.zip` |
| `-of/--output-file` | **REQUIRED** | Path to write output Fault System Solution file. | `--output-file solution.zip` |
| `-cd/--cache-dir` | _(none)_ | Optional directory to store/load cache files (distances, coulomb, etc) to speed up rupture set building and processing. | `--cache-dir /path/to/cache` |

### Logic Tree Branch Overrides

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `--branch-choice` | _(according to model)_ | Set a logic tree branch choice to a non-default value. See `--list-branch-choices` to see available branching levels and choices along with example syntax. Supply this argument multiple times to set multiple branch choices. | `--branch-choice name:value` |
| `--list-branch-choices` | _(N/A)_ | Flag to list all logic tree branch choices and exit. Make sure to also supply a model flag. | `--list-branch-choices` |

### Simulated Annealing Parameters

Although not required, you can override various simulated annealing parameters using command line arguments. See the regular [inversion runner tool](inversion_runner.md#simulated-annealing-parameters) documentation for a list of available options.

## Examples

List all logic tree branch options for NSHM23 (giving example command line options):

```
$ fst_inversion_factory_runner.sh --nshm23 --list-branch-choices
Logic Tree Branch options. Each branching level will be listed separately with the level name, and then each choice following (indented). Each choice lists its full descriptive name and then an example showing how to set that branch choice from the command line. Options selected by default will be annotated with '(DEFAULT)'
Fault Model
	NSHM23 WUS Fault Model v1.4;	--branch-choice FM:WUS_FM_v1p4
	NSHM23 WUS Fault Model v2;	--branch-choice FM:WUS_FM_v2
	NSHM23 WUS Fault Model v3 (DEFAULT);	--branch-choice FM:WUS_FM_v3
Deformation Model
	NSHM23 Geologic Deformation Model;	--branch-choice DM:GEOLOGIC
	NSHM23 Evans Deformation Model;	--branch-choice DM:EVANS
	NSHM23 Pollitz Deformation Model;	--branch-choice DM:POLLITZ
	NSHM23 Shen-Bird Deformation Model;	--branch-choice DM:SHEN_BIRD
	NSHM23 Zeng Deformation Model;	--branch-choice DM:ZENG
	NSHM23 Averaged Deformation Model (DEFAULT);	--branch-choice DM:AVERAGE
	NSHM23 Median Deformation Model (Unweighted, Geol. Rakes);	--branch-choice DM:MEDIAN
...
```

Reproduce an NSHM23 inversion, setting the deformation model to Geologic. The rupture set will be built on the fly:

```
$ fst_inversion_factory_runner.sh --nshm23 --branch-choice DM:GEOLOGIC --output-file solution.zip
```

The same, but using a passed in rupture set (possibly for another region, and likely built with the [Rupture Set Builder](rup_set_builder.md)). Here I also disable gridded seismicity as this may be for a different region:

```
$ fst_inversion_factory_runner.sh --nshm23 --branch-choice DM:GEOLOGIC --output-file solution.zip --no-gridded
```
