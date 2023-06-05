# Inversion Runner Tool

USAGE: `fst_inversion_runner.sh --rupture-set </path/to/rupture_set.zip> --output-file </path/to/output_solution.zip> --slip-constraint --completion 30m`

This command line tool allows a user to run an inversion to solve for the rates of each [supra-seismogenic rupture](glossary.md#supra-seismogenic-rupture) from a [Rupture Set](glossary.md#rupture-set). The output is a [Solution](glossary.md#solution) zip file.

The [Simulated Annealing](glossary.md#simulated-annealing) inversion approach is described in detail in [this publication](https://pubs.geoscienceworld.org/ssa/bssa/article/104/3/1181/351434/The-UCERF3-Grand-Inversion-Solving-for-the-Long):

Morgan T. Page, Edward H. Field, Kevin R. Milner, Peter M. Powers; The UCERF3 Grand Inversion: Solving for the Long‐Term Rate of Ruptures in a Fault System. _Bulletin of the Seismological Society of America 2014_;; 104 (3): 1181–1204. doi: https://doi.org/10.1785/0120130180

## Command Line Arguments

### Required Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-rs/--rupture-set` | **REQUIRED** | Path to Rupture Set zip file. | `--rupture-set rupture_set.zip` |
| `-of/--output-file` | **REQUIRED** | Path to write output Fault System Solution file. | `--output-file solution.zip` |
| `-c,--completion` | **REQUIRED** | Total inversion completion criteria. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively, or in iterations per rupture by appending 'ip'. Fractions are not allowed. This can be skipped if (and only if) the `--config-json` argument is supplied. | `--completion 30m` |

Additionally, at least one constraint is required (see next section).

### Constraints

Various inversion constraints are availble, and each constraint can optinoally be assigned custom weights (e.g., to favor one piece of data over another).

#### External Constraints/Configuration

External constraints or inversion configuration can be supplied via a JSON interface.

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-cfg/--config-json` | _(disabled)_ | Path to a JSON file containing a full inversion configuration, as an alternative to using command line options. | `--config-json config.json` |
| `-wcj/--write-config-json` | _(disabled)_ | Path to write inversion configuration JSON, which can be later loaded in (and manually edited if required) via `--config-json`. | `--write-config-json config.json` |
| `-cnstr/--constraints-json` | _(disabled)_ | Path to a JSON file containing inversion constraints that should be included. | `--constraints-json constraints.json` |

#### Slip Rate Constraints

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-sl/--slip-constraint` | _(disabled)_ | Enables the slip-rate constraint. | `--slip-constraint` |
| `-sw/--slip-weight` | `1.0` | Sets the weight for the regular slip-rate constraint, where misfits are not normalized by the section slip rate. Enabled by default if `--slip-constraint` is enabled and no other slip weights are explicitly set. | `--slip-weight 1.0` |
| `--norm-slip-weight` | `0.0` | Sets the weight for the normalized slip-rate constraint, where misfits are normalized by the section slip rate. Disabled by default. | `--norm-slip-weight 1.0` |
| `--uncertain-slip-weight` | `0.0` | Sets the weight for the uncertainty-weighted slip-rate constraint, where misfits are normalized by the section slip rate standard deviation. Disabled by default. | `--uncertain-slip-weight 1.0` |

#### MFD Constraints

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-mfd/--mfd-constraint` | _(disabled)_ | Enables the MFD constraint. Must also supply either `--infer-target-gr` or `--mfd-total-rate`. | `--mfd-constraint` |
| `--rel-gr-constraint` | _(disabled)_ | Enables the relative Gutenberg-Richter constraint, which constrains the overal MFD to be G-R withought constraining the total event rate. The b-value will default to 1, override with `--b-value <vlalue>`. Set constraint weight with `--mfd-weight <weight>`. | `-rel-gr-constraint` |
| `-b/--b-value` | `1.0` | Gutenberg-Richter b-value. | `--b-value 1.0` |
| `--infer-target-gr` | _(disabled)_ | Flag to infer target MFD as a G-R from total deformation model moment rate. | `--infer-target-gr` |
| `--mfd-total-rate` | _(disabled)_ | Total (cumulative) rate for the MFD constraint. By default, this will apply to the minimum magnitude from the rupture set, but another magnitude can be supplied with `--mfd-min-mag` | `--mfd-total-rate 5.0` |
| `--mfd-min-mag` | _(determined from rupture set)_ | Minimum magnitude for the MFD constraint (default is minimum magnitude of the rupture set), used with --mfd-total-rate. | `--mfd-min-mag 5.0` |
| `-mw/--mfd-weight` | `1.0` | Sets the weight for the MFD constraint. | `--mfd-weight 1.0` |
| `--mfd-ineq` | _(disabled)_ | Flag to configure MFD constraints as inequality rather than equality constraints.  Used in conjunction with `--mfd-constraint`. Use `--mfd-transition-mag` instead if you want to transition from equality to inequality constraints. | `--mfd-ineq` |
| `--mfd-transition-mag` | _(disabled)_ | Magnitude at and above which the mfd constraint should be applied as a inequality, allowing a natural taper (default is equality only). | `--mfd-transition-mag 7.8` |
| `--rel-gr-constraint ` | _(disabled)_ | Enables the relative Gutenberg-Richter constraint, which constraints the overal MFD to be G-R withought constraining the total event rate. The b-value will default to 1, override with `--b-value <vlalue>`. Set constraint weight with `--mfd-weight <weight>`, or configure as an inequality with `--mfd-ineq`. | `--rel-gr-constraint ` |

#### Paleoseismic Data Constraints

Paleoseismic constraitns are always weighted by their uncertainties, and also use a probability-of-detection model (see `--paleo-prob-model`). Note that the NSHM23 probability model should not be used generally (it delegates to other models based on region or fault names).

Paleoseismic constraint data needs to either be attached to the input rupture set, or supplied via a simple CSV file. See example CSV file for paleo data here: [u3_ssaf_paleo_data.csv](../data/u3_ssaf_paleo_data.csv).

You may wish to apply the smoothness constraint if you enable this option, and can use `--paleo-smooth` to do so only on faults with paleoseismic constraint data.

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-paleo/--paleo-constraint` | _(disabled)_ | Enables the paleoseismic data constraint. Must supply --paleo-data, or rupture set must already have a PaleoseismicConstraintData module attached. See also --paleo-prob-model. | `--paleo-constraint` |
| `--paleo-data` | _(supplied by rupture set)_ | Paleoseismic data CSV file. Format must be as follows (including a header row with column names, although those names are not tested to exactly match those that follow). If values are omitted (or are negative) for 'Subsection Index', the closest subsection to each site location will be mapped automatically. CSV File columns: Site Name, Subsection Index, Latitude, Longitude, Rate, Rate Std Dev. | `--paleo-data data.csv` |
| `--paleo-prob-model` | `UCERF3` | Paleoseismic probability of detection model, one of: UCERF3, YOUNGS_2003, NSHM23, NONE | `--paleo-prob-model UCERF3` |
| `--paleo-weight` | `1.0` | Sets the weight for the Paleoseismic data constraint. | `--mfd-weight 1.0` |

#### Total Event Rate Constraint

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `--event-rate-constraint` | _(disabled)_ | Enables the total event-rate constraint with the supplied total event rate. | `--event-rate-constraint 5.0` |
| `--event-rate-weight` | `1.0` | Sets weight for the event-rate constraint. | `--event-rate-weight 1.0` |

#### Smoothness Constraint

Note: good starting weights to try are 1000 or 10000, depending on how other constraints are weighted.

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `--smooth` | _(disabled)_ | Laplacian smoothness constraint that smooths supra-seismogenic participation rates along adjacent subsections on a parent section. | `--smooth` |
| `--paleo-smooth` | _(disabled)_ | Enables the Laplacian smoothness constraint (see --smooth), but only for faults with paleoseismic constraints. | `--paleo-smooth` |
| `--smooth-weight` | `1.0` | Sets weight for the smoothness constraint. | `--event-rate-weight 1.0` |

#### Segmentation Constraint

_Note: this constraint implementation is deprecated and not recommended. It will be repalced with a better version in the future._

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-seg,--slip-seg-constraint` | _(disabled)_ | Enables the slip-rate segmentation constraint. | `--slip-seg-constraint` |
| `-nseg,--norm-slip-seg-constraint` | _(disabled)_ | Enables the normalized slip-rate segmentation constraint. | `--norm-slip-seg-constraint` |
| `-ntseg,--net-slip-seg-constraint` | _(disabled)_ | Enables the net (distance-binned) slip-rate segmentation constraint. | `--net-slip-seg-constraint` |
| `-segi,--slip-seg-ineq` | _(equality constraint)_ | Flag to make segmentation constraints an inequality constraint (only applies if segmentation rate is exceeded). | `--slip-seg-ineq` |
| `-r0,--shaw-r0` | `3.0` | Sets R0 in the Shaw (2007) jump-distance probability model in km (used for segmentation constraint). | `--shaw-r0 3` |
| `-segw,--slip-seg-weight` | `1.0` | Sets weight for the slip-rate segmentation constraint. | `--slip-seg-weight 1.0` |

### Simulated Annealing Parameters

At a minimum, you must supply a completion criteria for the iteration via either `--hours <val>`, `--minutes <val>`, `--seconds <val>`, or `--iterations <val>`. Additionally, the algorithm will be multithreaded by default (disable with `--threads 1`) and across-thread synchronization time can be controlled with the `--sub-seconds <val>` or `--sub-iterations <val>` options.

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-c,--completion` | **REQUIRED** | Total inversion completion criteria. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. | `--completion 30m` |
| `-t,--threads` | _(system-dependent)_ | Number of calculation threads. Default is the lesser of 32 and the number of processors on the system. | `--threads 8` |
| `-sc,--sub-completion` | `1s` | Interval between across-thread synchronization. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. Default: 1s | `--sub-completion 1s` |
| `-at,--avg-threads` | _(disabled)_ | Enables a top layer of threads that average results of worker threads at fixed intervals. Supply the number of averaging threads, which must be < threads. Default is no averaging, if enabled you must also supply `--average-completion <value>`. | `--average-threads 4`
| `-ac,--avg-completion` | _(disabled)_ | Interval between across-thread averaging. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. | `--average-completion 1m` |
| `-pt,--perturb` | `VARIABLE_EXPONENTIAL_SCALE` | Perturbation function. One of UNIFORM_NO_TEMP_DEPENDENCE, VARIABLE_NO_TEMP_DEPENDENCE, GAUSSIAN, TANGENT, POWER_LAW, EXPONENTIAL, EXPONENTIAL_RANGE, EXPONENTIAL_SCALE, VARIABLE_EXPONENTIAL_SCALE. | `--perturb VARIABLE_EXPONENTIAL_SCALE` |
| `-nn,--non-negativity` | `TRY_ZERO_RATES_OFTEN` | Non-negativity constraint. One of TRY_ZERO_RATES_OFTEN, LIMIT_ZERO_RATES, PREVENT_ZERO_RATES. | `--non-negativity TRY_ZERO_RATES_OFTEN` |

### Example

This was the command used to build the example [simple Southern San Andreas solution](../data/u3_ssaf_simple_sol.zip). It uses just the slip rate constraint, and runs quickly (2 minutes).

```
fst_inversion_runner.sh --rupture-set data/u3_ssaf_simple_rup_set.zip --output-file data/u3_ssaf_simple_sol.zip --slip-constraint --completion 2m --threads 32
Using global OPENSHA_MEM_GB=180
------------ LOADING ARCHIVE ------------
Archive: data/u3_ssaf_simple_rup_set.zip
	Found available module 'Rupture Set' with path='ruptures/'
Building instance: org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet
	Loading ruptures CSV...
	Parsing rupture properties CSV
	Parsing rupture sections CSV
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel
	Found available module 'Single-Strand Cluster Ruptures' with path='ruptures/'
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.ClusterRuptures$SingleStranded
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.ClusterRuptures
	Found available module 'Rupture Average Slips' with path='ruptures/'
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule$Precomputed
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule
	Found available module 'Plausibility Configuration' with path='ruptures/'
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.ruptures.plausibility.PlausibilityConfiguration
Loaded 6 available sub-modules
Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet' to: Rupture Set
Loaded 1 top-level modules
---------- END LOADING ARCHIVE ----------
Rupture Set:	Lazily loading available module...
Building instance: org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule$Precomputed
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule$Precomputed' to: Rupture Average Slips
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule' to: Rupture Average Slips
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel$Default' to: Default (Uniform) Slip Along Rupture
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel' to: Default (Uniform) Slip Along Rupture
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates$Default' to: Section Slip Rates
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates' to: Section Slip Rates
Generating inversion inputs with 3081 ruptures and 1 constraints
Building empty intial solution (all zeroes)
Calculating constraint row counts
	SlipRate: [0..88), 88 rows (took 0 ms)
Took 8 ms to get row counts
Building A matrix with 88 rows and 3081 columns
Encoding matrices
	Encoding Slip Rate, ineq=false
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas$Default' to: Section Areas
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas' to: Section Areas
		DONE, took 50 ms to encode 95685 values (density: 35.3 %)
DONE encoding, took 58 ms to encode 95685 values (density: 35.3 %)
Took 74 ms to generate inputs
Computing variable perturbation basis:
	Inferring target GR from slip rates
Inferring target G-R
Perturbation-basis range: [1.2706653E-6, 0.07460762]
Annealing!
Threaded Simulated Annealing starting with 32 threads, TimeCompletionCriteria(milis: 120000 = 120.0 seconds), SUB: TimeCompletionCriteria(milis: 1000 = 1.0 seconds)
Threaded total round 1 DONE after 1 secs, 2,677,112 total iterations (2,655,865 /sec).	2,341/3,081 = 75.98% non-zero rates.
Best energy after 2,099,065 total perturbations:
	Total:	1.8915325E-5	Equality:	1.8915325E-5	Entropy:	0.0
	Inequality:	0.0	SlipRate:	1.8915325E-5
Threaded total round 2 DONE after 2 secs, 5,948,975 total iterations (2,950,880 /sec).	2,321/3,081 = 75.33% non-zero rates.
Best energy after 4,457,840 total perturbations:
	Total:	9.610003E-6 (-49.19%)	Equality:	9.610003E-6 (-49.19%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	9.610003E-6 (-49.19%)
Threaded total round 3 DONE after 3 secs, 9,804,772 total iterations (3,248,765 /sec).	2,341/3,081 = 75.98% non-zero rates.
Best energy after 7,404,248 total perturbations:
	Total:	5.2776686E-6 (-45.08%)	Equality:	5.2776686E-6 (-45.08%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.2776686E-6 (-45.08%)
Threaded total round 4 DONE after 4 secs, 13,743,212 total iterations (3,419,560 /sec).	2,301/3,081 = 74.68% non-zero rates.
Best energy after 10,284,935 total perturbations:
	Total:	4.3526843E-6 (-17.53%)	Equality:	4.3526843E-6 (-17.53%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.3526843E-6 (-17.53%)
Threaded total round 5 DONE after 5 secs, 17,778,563 total iterations (3,541,546 /sec).	2,354/3,081 = 76.40% non-zero rates.
Best energy after 13,108,769 total perturbations:
	Total:	3.6027366E-6 (-17.23%)	Equality:	3.6027366E-6 (-17.23%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.6027366E-6 (-17.23%)
Threaded total round 6 DONE after 6 secs, 21,802,358 total iterations (3,621,053 /sec).	2,304/3,081 = 74.78% non-zero rates.
Best energy after 16,033,692 total perturbations:
	Total:	3.0002795E-6 (-16.72%)	Equality:	3.0002795E-6 (-16.72%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.0002795E-6 (-16.72%)
Threaded total round 7 DONE after 7 secs, 25,816,042 total iterations (3,676,451 /sec).	2,317/3,081 = 75.20% non-zero rates.
Best energy after 18,969,748 total perturbations:
	Total:	2.4830408E-6 (-17.24%)	Equality:	2.4830408E-6 (-17.24%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.4830408E-6 (-17.24%)
Threaded total round 8 DONE after 8 secs, 29,648,948 total iterations (3,695,494 /sec).	2,342/3,081 = 76.01% non-zero rates.
Best energy after 21,434,192 total perturbations:
	Total:	2.2572776E-6 (-9.09%)	Equality:	2.2572776E-6 (-9.09%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.2572776E-6 (-9.09%)
Threaded total round 9 DONE after 9 secs, 33,649,417 total iterations (3,728,880 /sec).	2,360/3,081 = 76.60% non-zero rates.
Best energy after 24,267,638 total perturbations:
	Total:	1.9408978E-6 (-14.02%)	Equality:	1.9408978E-6 (-14.02%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.9408978E-6 (-14.02%)
Threaded total round 10 DONE after 10 secs, 37,620,837 total iterations (3,752,702 /sec).	2,288/3,081 = 74.26% non-zero rates.
Best energy after 27,108,912 total perturbations:
	Total:	1.7818653E-6 (-8.19%)	Equality:	1.7818653E-6 (-8.19%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.7818653E-6 (-8.19%)
Threaded total round 11 DONE after 11 secs, 41,561,027 total iterations (3,769,366 /sec).	2,319/3,081 = 75.27% non-zero rates.
Best energy after 29,910,144 total perturbations:
	Total:	1.6210954E-6 (-9.02%)	Equality:	1.6210954E-6 (-9.02%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.6210954E-6 (-9.02%)
Threaded total round 12 DONE after 12 secs, 45,516,100 total iterations (3,784,493 /sec).	2,353/3,081 = 76.37% non-zero rates.
Best energy after 31,838,540 total perturbations:
	Total:	1.4751313E-6 (-9.00%)	Equality:	1.4751313E-6 (-9.00%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.4751313E-6 (-9.00%)
Threaded total round 13 DONE after 13 secs, 49,410,868 total iterations (3,792,958 /sec).	2,305/3,081 = 74.81% non-zero rates.
Best energy after 34,018,150 total perturbations:
	Total:	1.2832877E-6 (-13.01%)	Equality:	1.2832877E-6 (-13.01%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2832877E-6 (-13.01%)
Threaded total round 14 DONE after 14 secs, 53,334,284 total iterations (3,801,988 /sec).	2,293/3,081 = 74.42% non-zero rates.
Best energy after 36,717,864 total perturbations:
	Total:	1.1641387E-6 (-9.28%)	Equality:	1.1641387E-6 (-9.28%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1641387E-6 (-9.28%)
Threaded total round 15 DONE after 15 secs, 57,249,767 total iterations (3,809,287 /sec).	2,306/3,081 = 74.85% non-zero rates.
Best energy after 39,405,351 total perturbations:
	Total:	1.0674154E-6 (-8.31%)	Equality:	1.0674154E-6 (-8.31%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.0674154E-6 (-8.31%)
Threaded total round 16 DONE after 16 secs, 61,180,316 total iterations (3,816,614 /sec).	2,300/3,081 = 74.65% non-zero rates.
Best energy after 42,108,797 total perturbations:
	Total:	1.0303513E-6 (-3.47%)	Equality:	1.0303513E-6 (-3.47%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.0303513E-6 (-3.47%)
Threaded total round 17 DONE after 17 secs, 65,096,496 total iterations (3,822,236 /sec).	2,288/3,081 = 74.26% non-zero rates.
Best energy after 44,650,955 total perturbations:
	Total:	1.0001352E-6 (-2.93%)	Equality:	1.0001352E-6 (-2.93%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.0001352E-6 (-2.93%)
Threaded total round 18 DONE after 18 secs, 68,993,769 total iterations (3,826,397 /sec).	2,330/3,081 = 75.62% non-zero rates.
Best energy after 46,322,929 total perturbations:
	Total:	9.463325E-7 (-5.38%)	Equality:	9.463325E-7 (-5.38%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	9.463325E-7 (-5.38%)
Threaded total round 19 DONE after 19 secs, 72,851,024 total iterations (3,827,818 /sec).	2,326/3,081 = 75.49% non-zero rates.
Best energy after 47,594,122 total perturbations:
	Total:	9.150678E-7 (-3.30%)	Equality:	9.150678E-7 (-3.30%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	9.150678E-7 (-3.30%)
Threaded total round 20 DONE after 20 secs, 76,655,824 total iterations (3,826,478 /sec).	2,333/3,081 = 75.72% non-zero rates.
Best energy after 49,963,844 total perturbations:
	Total:	8.927439E-7 (-2.44%)	Equality:	8.927439E-7 (-2.44%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	8.927439E-7 (-2.44%)
Threaded total round 21 DONE after 21 secs, 80,430,540 total iterations (3,823,835 /sec).	2,330/3,081 = 75.62% non-zero rates.
Best energy after 51,712,321 total perturbations:
	Total:	8.7960314E-7 (-1.47%)	Equality:	8.7960314E-7 (-1.47%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	8.7960314E-7 (-1.47%)
Threaded total round 22 DONE after 22 secs, 84,377,998 total iterations (3,829,445 /sec).	2,334/3,081 = 75.75% non-zero rates.
Best energy after 53,599,193 total perturbations:
	Total:	8.545319E-7 (-2.85%)	Equality:	8.545319E-7 (-2.85%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	8.545319E-7 (-2.85%)
Threaded total round 23 DONE after 23 secs, 88,272,303 total iterations (3,832,095 /sec).	2,345/3,081 = 76.11% non-zero rates.
Best energy after 56,223,875 total perturbations:
	Total:	7.8770125E-7 (-7.82%)	Equality:	7.8770125E-7 (-7.82%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	7.8770125E-7 (-7.82%)
Threaded total round 24 DONE after 24 secs, 92,177,636 total iterations (3,834,982 /sec).	2,345/3,081 = 76.11% non-zero rates.
Best energy after 58,789,983 total perturbations:
	Total:	7.3459495E-7 (-6.74%)	Equality:	7.3459495E-7 (-6.74%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	7.3459495E-7 (-6.74%)
Threaded total round 25 DONE after 25 secs, 96,052,885 total iterations (3,836,437 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 60,293,362 total perturbations:
	Total:	6.533481E-7 (-11.06%)	Equality:	6.533481E-7 (-11.06%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	6.533481E-7 (-11.06%)
Threaded total round 26 DONE after 26 secs, 99,905,176 total iterations (3,837,046 /sec).	2,327/3,081 = 75.53% non-zero rates.
Best energy after 61,781,668 total perturbations:
	Total:	6.2925346E-7 (-3.69%)	Equality:	6.2925346E-7 (-3.69%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	6.2925346E-7 (-3.69%)
Threaded total round 27 DONE after 27 secs, 103,775,543 total iterations (3,838,137 /sec).	2,327/3,081 = 75.53% non-zero rates.
Best energy after 62,955,940 total perturbations:
	Total:	6.2003863E-7 (-1.46%)	Equality:	6.2003863E-7 (-1.46%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	6.2003863E-7 (-1.46%)
Threaded total round 28 DONE after 28 secs, 107,661,289 total iterations (3,839,698 /sec).	2,337/3,081 = 75.85% non-zero rates.
Best energy after 65,545,538 total perturbations:
	Total:	6.0698216E-7 (-2.11%)	Equality:	6.0698216E-7 (-2.11%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	6.0698216E-7 (-2.11%)
Threaded total round 29 DONE after 29 secs, 111,493,989 total iterations (3,839,192 /sec).	2,351/3,081 = 76.31% non-zero rates.
Best energy after 68,057,031 total perturbations:
	Total:	5.844831E-7 (-3.71%)	Equality:	5.844831E-7 (-3.71%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.844831E-7 (-3.71%)
Threaded total round 30 DONE after 30 secs, 115,362,716 total iterations (3,840,048 /sec).	2,333/3,081 = 75.72% non-zero rates.
Best energy after 70,607,184 total perturbations:
	Total:	5.488066E-7 (-6.10%)	Equality:	5.488066E-7 (-6.10%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.488066E-7 (-6.10%)
Threaded total round 31 DONE after 31 secs, 119,228,123 total iterations (3,840,741 /sec).	2,325/3,081 = 75.46% non-zero rates.
Best energy after 72,998,686 total perturbations:
	Total:	5.3885725E-7 (-1.81%)	Equality:	5.3885725E-7 (-1.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.3885725E-7 (-1.81%)
Threaded total round 32 DONE after 32 secs, 123,129,813 total iterations (3,842,643 /sec).	2,323/3,081 = 75.40% non-zero rates.
Best energy after 75,545,875 total perturbations:
	Total:	5.3513037E-7 (-0.69%)	Equality:	5.3513037E-7 (-0.69%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.3513037E-7 (-0.69%)
Threaded total round 33 DONE after 33 secs, 127,028,758 total iterations (3,844,231 /sec).	2,319/3,081 = 75.27% non-zero rates.
Best energy after 78,100,813 total perturbations:
	Total:	5.3268644E-7 (-0.46%)	Equality:	5.3268644E-7 (-0.46%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.3268644E-7 (-0.46%)
Threaded total round 34 DONE after 34 secs, 130,940,275 total iterations (3,846,094 /sec).	2,316/3,081 = 75.17% non-zero rates.
Best energy after 80,648,436 total perturbations:
	Total:	5.195895E-7 (-2.46%)	Equality:	5.195895E-7 (-2.46%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.195895E-7 (-2.46%)
Threaded total round 35 DONE after 35 secs, 134,862,381 total iterations (3,848,263 /sec).	2,315/3,081 = 75.14% non-zero rates.
Best energy after 82,696,829 total perturbations:
	Total:	5.0547067E-7 (-2.72%)	Equality:	5.0547067E-7 (-2.72%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.0547067E-7 (-2.72%)
Threaded total round 36 DONE after 36 secs, 138,753,406 total iterations (3,849,343 /sec).	2,319/3,081 = 75.27% non-zero rates.
Best energy after 85,203,216 total perturbations:
	Total:	4.9463154E-7 (-2.14%)	Equality:	4.9463154E-7 (-2.14%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.9463154E-7 (-2.14%)
Threaded total round 37 DONE after 37 secs, 142,625,930 total iterations (3,849,864 /sec).	2,315/3,081 = 75.14% non-zero rates.
Best energy after 87,059,710 total perturbations:
	Total:	4.815628E-7 (-2.64%)	Equality:	4.815628E-7 (-2.64%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.815628E-7 (-2.64%)
Threaded total round 38 DONE after 38 secs, 146,441,339 total iterations (3,848,959 /sec).	2,316/3,081 = 75.17% non-zero rates.
Best energy after 88,804,818 total perturbations:
	Total:	4.709393E-7 (-2.21%)	Equality:	4.709393E-7 (-2.21%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.709393E-7 (-2.21%)
Threaded total round 39 DONE after 39 secs, 150,364,651 total iterations (3,850,764 /sec).	2,307/3,081 = 74.88% non-zero rates.
Best energy after 90,843,688 total perturbations:
	Total:	4.6747078E-7 (-0.74%)	Equality:	4.6747078E-7 (-0.74%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.6747078E-7 (-0.74%)
Threaded total round 40 DONE after 40 secs, 154,245,858 total iterations (3,851,428 /sec).	2,306/3,081 = 74.85% non-zero rates.
Best energy after 93,040,452 total perturbations:
	Total:	4.6425447E-7 (-0.69%)	Equality:	4.6425447E-7 (-0.69%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.6425447E-7 (-0.69%)
Threaded total round 41 DONE after 41 secs, 158,125,944 total iterations (3,852,127 /sec).	2,308/3,081 = 74.91% non-zero rates.
Best energy after 95,518,598 total perturbations:
	Total:	4.6137572E-7 (-0.62%)	Equality:	4.6137572E-7 (-0.62%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.6137572E-7 (-0.62%)
Threaded total round 42 DONE after 42 secs, 161,927,788 total iterations (3,850,839 /sec).	2,309/3,081 = 74.94% non-zero rates.
Best energy after 97,916,481 total perturbations:
	Total:	4.5736263E-7 (-0.87%)	Equality:	4.5736263E-7 (-0.87%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.5736263E-7 (-0.87%)
Threaded total round 43 DONE after 43.1 secs, 165,751,962 total iterations (3,850,130 /sec).	2,309/3,081 = 74.94% non-zero rates.
Best energy after 100,365,649 total perturbations:
	Total:	4.4357586E-7 (-3.01%)	Equality:	4.4357586E-7 (-3.01%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.4357586E-7 (-3.01%)
Threaded total round 44 DONE after 44.1 secs, 169,688,335 total iterations (3,852,088 /sec).	2,301/3,081 = 74.68% non-zero rates.
Best energy after 102,039,758 total perturbations:
	Total:	4.3418223E-7 (-2.12%)	Equality:	4.3418223E-7 (-2.12%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.3418223E-7 (-2.12%)
Threaded total round 45 DONE after 45.1 secs, 173,575,018 total iterations (3,852,771 /sec).	2,297/3,081 = 74.55% non-zero rates.
Best energy after 103,139,824 total perturbations:
	Total:	4.22719E-7 (-2.64%)	Equality:	4.22719E-7 (-2.64%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.22719E-7 (-2.64%)
Threaded total round 46 DONE after 46.1 secs, 177,506,364 total iterations (3,854,477 /sec).	2,291/3,081 = 74.36% non-zero rates.
Best energy after 105,635,285 total perturbations:
	Total:	4.1281942E-7 (-2.34%)	Equality:	4.1281942E-7 (-2.34%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	4.1281942E-7 (-2.34%)
Threaded total round 47 DONE after 47.1 secs, 181,404,786 total iterations (3,855,329 /sec).	2,286/3,081 = 74.20% non-zero rates.
Best energy after 108,096,637 total perturbations:
	Total:	3.9944186E-7 (-3.24%)	Equality:	3.9944186E-7 (-3.24%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.9944186E-7 (-3.24%)
Threaded total round 48 DONE after 48.1 secs, 185,342,608 total iterations (3,856,965 /sec).	2,304/3,081 = 74.78% non-zero rates.
Best energy after 110,023,249 total perturbations:
	Total:	3.8667898E-7 (-3.20%)	Equality:	3.8667898E-7 (-3.20%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.8667898E-7 (-3.20%)
Threaded total round 49 DONE after 49.1 secs, 189,261,158 total iterations (3,858,221 /sec).	2,297/3,081 = 74.55% non-zero rates.
Best energy after 112,382,675 total perturbations:
	Total:	3.772306E-7 (-2.44%)	Equality:	3.772306E-7 (-2.44%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.772306E-7 (-2.44%)
Threaded total round 50 DONE after 50.1 secs, 193,173,830 total iterations (3,859,231 /sec).	2,294/3,081 = 74.46% non-zero rates.
Best energy after 114,683,360 total perturbations:
	Total:	3.7070535E-7 (-1.73%)	Equality:	3.7070535E-7 (-1.73%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.7070535E-7 (-1.73%)
Threaded total round 51 DONE after 51.1 secs, 197,086,367 total iterations (3,860,276 /sec).	2,298/3,081 = 74.59% non-zero rates.
Best energy after 116,990,763 total perturbations:
	Total:	3.6661538E-7 (-1.10%)	Equality:	3.6661538E-7 (-1.10%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.6661538E-7 (-1.10%)
Threaded total round 52 DONE after 52.1 secs, 200,875,933 total iterations (3,858,843 /sec).	2,297/3,081 = 74.55% non-zero rates.
Best energy after 119,373,647 total perturbations:
	Total:	3.630293E-7 (-0.98%)	Equality:	3.630293E-7 (-0.98%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.630293E-7 (-0.98%)
Threaded total round 53 DONE after 53.1 secs, 204,819,812 total iterations (3,860,300 /sec).	2,284/3,081 = 74.13% non-zero rates.
Best energy after 121,874,796 total perturbations:
	Total:	3.5844795E-7 (-1.26%)	Equality:	3.5844795E-7 (-1.26%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.5844795E-7 (-1.26%)
Threaded total round 54 DONE after 54.1 secs, 208,816,081 total iterations (3,862,816 /sec).	2,280/3,081 = 74.00% non-zero rates.
Best energy after 122,793,370 total perturbations:
	Total:	3.520738E-7 (-1.78%)	Equality:	3.520738E-7 (-1.78%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.520738E-7 (-1.78%)
Threaded total round 55 DONE after 55.1 secs, 212,775,038 total iterations (3,864,492 /sec).	2,281/3,081 = 74.03% non-zero rates.
Best energy after 124,242,153 total perturbations:
	Total:	3.4732273E-7 (-1.35%)	Equality:	3.4732273E-7 (-1.35%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.4732273E-7 (-1.35%)
Threaded total round 56 DONE after 56.1 secs, 216,716,659 total iterations (3,865,798 /sec).	2,281/3,081 = 74.03% non-zero rates.
Best energy after 125,999,985 total perturbations:
	Total:	3.3877777E-7 (-2.46%)	Equality:	3.3877777E-7 (-2.46%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.3877777E-7 (-2.46%)
Threaded total round 57 DONE after 57.1 secs, 220,657,250 total iterations (3,867,109 /sec).	2,279/3,081 = 73.97% non-zero rates.
Best energy after 128,160,558 total perturbations:
	Total:	3.3334538E-7 (-1.60%)	Equality:	3.3334538E-7 (-1.60%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.3334538E-7 (-1.60%)
Threaded total round 58 DONE after 58.1 secs, 224,582,079 total iterations (3,868,037 /sec).	2,279/3,081 = 73.97% non-zero rates.
Best energy after 130,580,075 total perturbations:
	Total:	3.2895596E-7 (-1.32%)	Equality:	3.2895596E-7 (-1.32%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.2895596E-7 (-1.32%)
Threaded total round 59 DONE after 59.1 secs, 228,497,561 total iterations (3,868,840 /sec).	2,329/3,081 = 75.59% non-zero rates.
Best energy after 132,790,289 total perturbations:
	Total:	3.2684326E-7 (-0.64%)	Equality:	3.2684326E-7 (-0.64%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.2684326E-7 (-0.64%)
Threaded total round 60 DONE after 1 min 0.1 secs, 232,434,543 total iterations (3,869,910 /sec).	2,326/3,081 = 75.49% non-zero rates.
Best energy after 135,087,116 total perturbations:
	Total:	3.102218E-7 (-5.09%)	Equality:	3.102218E-7 (-5.09%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	3.102218E-7 (-5.09%)
Threaded total round 61 DONE after 1 min 1.1 secs, 236,380,029 total iterations (3,870,767 /sec).	2,325/3,081 = 75.46% non-zero rates.
Best energy after 137,553,884 total perturbations:
	Total:	2.9337724E-7 (-5.43%)	Equality:	2.9337724E-7 (-5.43%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.9337724E-7 (-5.43%)
Threaded total round 62 DONE after 1 min 2.1 secs, 240,324,641 total iterations (3,871,957 /sec).	2,340/3,081 = 75.95% non-zero rates.
Best energy after 139,106,074 total perturbations:
	Total:	2.748795E-7 (-6.31%)	Equality:	2.748795E-7 (-6.31%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.748795E-7 (-6.31%)
Threaded total round 63 DONE after 1 min 3.1 secs, 244,264,572 total iterations (3,872,974 /sec).	2,331/3,081 = 75.66% non-zero rates.
Best energy after 141,567,280 total perturbations:
	Total:	2.680991E-7 (-2.47%)	Equality:	2.680991E-7 (-2.47%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.680991E-7 (-2.47%)
Threaded total round 64 DONE after 1 min 4.1 secs, 248,192,155 total iterations (3,873,826 /sec).	2,339/3,081 = 75.92% non-zero rates.
Best energy after 143,992,255 total perturbations:
	Total:	2.4836996E-7 (-7.36%)	Equality:	2.4836996E-7 (-7.36%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.4836996E-7 (-7.36%)
Threaded total round 65 DONE after 1 min 5.1 secs, 252,160,895 total iterations (3,875,225 /sec).	2,319/3,081 = 75.27% non-zero rates.
Best energy after 146,445,301 total perturbations:
	Total:	2.4061404E-7 (-3.12%)	Equality:	2.4061404E-7 (-3.12%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.4061404E-7 (-3.12%)
Threaded total round 66 DONE after 1 min 6.1 secs, 256,114,028 total iterations (3,876,404 /sec).	2,317/3,081 = 75.20% non-zero rates.
Best energy after 148,896,535 total perturbations:
	Total:	2.3409372E-7 (-2.71%)	Equality:	2.3409372E-7 (-2.71%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.3409372E-7 (-2.71%)
Threaded total round 67 DONE after 1 min 7.1 secs, 260,039,172 total iterations (3,877,073 /sec).	2,317/3,081 = 75.20% non-zero rates.
Best energy after 149,794,129 total perturbations:
	Total:	2.3184668E-7 (-0.96%)	Equality:	2.3184668E-7 (-0.96%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.3184668E-7 (-0.96%)
Threaded total round 68 DONE after 1 min 8.1 secs, 263,997,769 total iterations (3,878,214 /sec).	2,324/3,081 = 75.43% non-zero rates.
Best energy after 152,250,634 total perturbations:
	Total:	2.2399895E-7 (-3.38%)	Equality:	2.2399895E-7 (-3.38%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.2399895E-7 (-3.38%)
Threaded total round 69 DONE after 1 min 9.1 secs, 267,934,701 total iterations (3,879,064 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 154,678,825 total perturbations:
	Total:	2.1771527E-7 (-2.81%)	Equality:	2.1771527E-7 (-2.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.1771527E-7 (-2.81%)
Threaded total round 70 DONE after 1 min 10.1 secs, 271,874,268 total iterations (3,879,872 /sec).	2,344/3,081 = 76.08% non-zero rates.
Best energy after 156,892,855 total perturbations:
	Total:	2.1417881E-7 (-1.62%)	Equality:	2.1417881E-7 (-1.62%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.1417881E-7 (-1.62%)
Threaded total round 71 DONE after 1 min 11.1 secs, 275,815,608 total iterations (3,880,737 /sec).	2,345/3,081 = 76.11% non-zero rates.
Best energy after 159,191,774 total perturbations:
	Total:	2.1104542E-7 (-1.46%)	Equality:	2.1104542E-7 (-1.46%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.1104542E-7 (-1.46%)
Threaded total round 72 DONE after 1 min 12.1 secs, 279,761,598 total iterations (3,881,588 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 161,593,789 total perturbations:
	Total:	2.046773E-7 (-3.02%)	Equality:	2.046773E-7 (-3.02%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.046773E-7 (-3.02%)
Threaded total round 73 DONE after 1 min 13.1 secs, 283,690,525 total iterations (3,882,236 /sec).	2,329/3,081 = 75.59% non-zero rates.
Best energy after 163,804,701 total perturbations:
	Total:	2.0097244E-7 (-1.81%)	Equality:	2.0097244E-7 (-1.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	2.0097244E-7 (-1.81%)
Threaded total round 74 DONE after 1 min 14.1 secs, 287,661,736 total iterations (3,883,385 /sec).	2,328/3,081 = 75.56% non-zero rates.
Best energy after 166,212,975 total perturbations:
	Total:	1.976281E-7 (-1.66%)	Equality:	1.976281E-7 (-1.66%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.976281E-7 (-1.66%)
Threaded total round 75 DONE after 1 min 15.1 secs, 291,524,435 total iterations (3,883,058 /sec).	2,325/3,081 = 75.46% non-zero rates.
Best energy after 167,695,823 total perturbations:
	Total:	1.942992E-7 (-1.68%)	Equality:	1.942992E-7 (-1.68%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.942992E-7 (-1.68%)
Threaded total round 76 DONE after 1 min 16.1 secs, 295,521,867 total iterations (3,884,561 /sec).	2,326/3,081 = 75.49% non-zero rates.
Best energy after 170,153,171 total perturbations:
	Total:	1.9111363E-7 (-1.64%)	Equality:	1.9111363E-7 (-1.64%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.9111363E-7 (-1.64%)
Threaded total round 77 DONE after 1 min 17.1 secs, 299,500,493 total iterations (3,885,731 /sec).	2,328/3,081 = 75.56% non-zero rates.
Best energy after 172,558,406 total perturbations:
	Total:	1.8844413E-7 (-1.40%)	Equality:	1.8844413E-7 (-1.40%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.8844413E-7 (-1.40%)
Threaded total round 78 DONE after 1 min 18.1 secs, 303,440,606 total iterations (3,886,428 /sec).	2,329/3,081 = 75.59% non-zero rates.
Best energy after 174,925,826 total perturbations:
	Total:	1.8512364E-7 (-1.76%)	Equality:	1.8512364E-7 (-1.76%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.8512364E-7 (-1.76%)
Threaded total round 79 DONE after 1 min 19.1 secs, 307,381,249 total iterations (3,887,064 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 177,341,836 total perturbations:
	Total:	1.8016E-7 (-2.68%)	Equality:	1.8016E-7 (-2.68%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.8016E-7 (-2.68%)
Threaded total round 80 DONE after 1 min 20.1 secs, 311,335,656 total iterations (3,887,905 /sec).	2,334/3,081 = 75.75% non-zero rates.
Best energy after 179,726,904 total perturbations:
	Total:	1.763943E-7 (-2.09%)	Equality:	1.763943E-7 (-2.09%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.763943E-7 (-2.09%)
Threaded total round 81 DONE after 1 min 21.1 secs, 315,273,950 total iterations (3,888,479 /sec).	2,332/3,081 = 75.69% non-zero rates.
Best energy after 182,093,692 total perturbations:
	Total:	1.6958302E-7 (-3.86%)	Equality:	1.6958302E-7 (-3.86%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.6958302E-7 (-3.86%)
Threaded total round 82 DONE after 1 min 22.1 secs, 319,134,310 total iterations (3,888,089 /sec).	2,333/3,081 = 75.72% non-zero rates.
Best energy after 184,453,878 total perturbations:
	Total:	1.6807184E-7 (-0.89%)	Equality:	1.6807184E-7 (-0.89%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.6807184E-7 (-0.89%)
Threaded total round 83 DONE after 1 min 23.1 secs, 323,043,742 total iterations (3,888,345 /sec).	2,335/3,081 = 75.79% non-zero rates.
Best energy after 186,662,739 total perturbations:
	Total:	1.6440103E-7 (-2.18%)	Equality:	1.6440103E-7 (-2.18%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.6440103E-7 (-2.18%)
Threaded total round 84 DONE after 1 min 24.1 secs, 326,900,532 total iterations (3,887,924 /sec).	2,347/3,081 = 76.18% non-zero rates.
Best energy after 187,703,516 total perturbations:
	Total:	1.6070831E-7 (-2.25%)	Equality:	1.6070831E-7 (-2.25%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.6070831E-7 (-2.25%)
Threaded total round 85 DONE after 1 min 25.1 secs, 330,693,796 total iterations (3,886,811 /sec).	2,348/3,081 = 76.21% non-zero rates.
Best energy after 190,006,843 total perturbations:
	Total:	1.5807154E-7 (-1.64%)	Equality:	1.5807154E-7 (-1.64%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.5807154E-7 (-1.64%)
Threaded total round 86 DONE after 1 min 26.1 secs, 334,538,820 total iterations (3,886,281 /sec).	2,346/3,081 = 76.14% non-zero rates.
Best energy after 191,816,241 total perturbations:
	Total:	1.5653725E-7 (-0.97%)	Equality:	1.5653725E-7 (-0.97%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.5653725E-7 (-0.97%)
Threaded total round 87 DONE after 1 min 27.1 secs, 338,429,793 total iterations (3,886,290 /sec).	2,345/3,081 = 76.11% non-zero rates.
Best energy after 194,070,632 total perturbations:
	Total:	1.5356517E-7 (-1.90%)	Equality:	1.5356517E-7 (-1.90%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.5356517E-7 (-1.90%)
Threaded total round 88 DONE after 1 min 28.1 secs, 342,376,120 total iterations (3,886,972 /sec).	2,336/3,081 = 75.82% non-zero rates.
Best energy after 195,525,592 total perturbations:
	Total:	1.5209683E-7 (-0.96%)	Equality:	1.5209683E-7 (-0.96%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.5209683E-7 (-0.96%)
Threaded total round 89 DONE after 1 min 29.1 secs, 346,237,542 total iterations (3,886,641 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 197,862,986 total perturbations:
	Total:	1.4935006E-7 (-1.81%)	Equality:	1.4935006E-7 (-1.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.4935006E-7 (-1.81%)
Threaded total round 90 DONE after 1 min 30.1 secs, 350,150,632 total iterations (3,886,935 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 199,477,667 total perturbations:
	Total:	1.4505697E-7 (-2.87%)	Equality:	1.4505697E-7 (-2.87%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.4505697E-7 (-2.87%)
Threaded total round 91 DONE after 1 min 31.1 secs, 354,068,226 total iterations (3,887,229 /sec).	2,339/3,081 = 75.92% non-zero rates.
Best energy after 201,598,756 total perturbations:
	Total:	1.4296688E-7 (-1.44%)	Equality:	1.4296688E-7 (-1.44%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.4296688E-7 (-1.44%)
Threaded total round 92 DONE after 1 min 32.1 secs, 357,986,459 total iterations (3,887,565 /sec).	2,337/3,081 = 75.85% non-zero rates.
Best energy after 203,079,805 total perturbations:
	Total:	1.4167577E-7 (-0.90%)	Equality:	1.4167577E-7 (-0.90%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.4167577E-7 (-0.90%)
Threaded total round 93 DONE after 1 min 33.1 secs, 361,950,300 total iterations (3,888,343 /sec).	2,337/3,081 = 75.85% non-zero rates.
Best energy after 205,415,295 total perturbations:
	Total:	1.3913017E-7 (-1.80%)	Equality:	1.3913017E-7 (-1.80%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.3913017E-7 (-1.80%)
Threaded total round 94 DONE after 1 min 34.1 secs, 365,872,878 total iterations (3,888,707 /sec).	2,336/3,081 = 75.82% non-zero rates.
Best energy after 206,811,745 total perturbations:
	Total:	1.3702353E-7 (-1.51%)	Equality:	1.3702353E-7 (-1.51%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.3702353E-7 (-1.51%)
Threaded total round 95 DONE after 1 min 35.1 secs, 369,804,283 total iterations (3,889,115 /sec).	2,331/3,081 = 75.66% non-zero rates.
Best energy after 209,142,242 total perturbations:
	Total:	1.3595862E-7 (-0.78%)	Equality:	1.3595862E-7 (-0.78%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.3595862E-7 (-0.78%)
Threaded total round 96 DONE after 1 min 36.1 secs, 373,747,762 total iterations (3,889,640 /sec).	2,330/3,081 = 75.62% non-zero rates.
Best energy after 211,495,850 total perturbations:
	Total:	1.3244193E-7 (-2.59%)	Equality:	1.3244193E-7 (-2.59%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.3244193E-7 (-2.59%)
Threaded total round 97 DONE after 1 min 37.1 secs, 377,699,547 total iterations (3,890,280 /sec).	2,330/3,081 = 75.62% non-zero rates.
Best energy after 213,846,884 total perturbations:
	Total:	1.3082004E-7 (-1.22%)	Equality:	1.3082004E-7 (-1.22%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.3082004E-7 (-1.22%)
Threaded total round 98 DONE after 1 min 38.1 secs, 381,621,084 total iterations (3,890,559 /sec).	2,331/3,081 = 75.66% non-zero rates.
Best energy after 216,125,809 total perturbations:
	Total:	1.2858631E-7 (-1.71%)	Equality:	1.2858631E-7 (-1.71%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2858631E-7 (-1.71%)
Threaded total round 99 DONE after 1 min 39.1 secs, 385,530,020 total iterations (3,890,745 /sec).	2,326/3,081 = 75.49% non-zero rates.
Best energy after 218,459,581 total perturbations:
	Total:	1.2744525E-7 (-0.89%)	Equality:	1.2744525E-7 (-0.89%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2744525E-7 (-0.89%)
Threaded total round 100 DONE after 1 min 40.1 secs, 389,440,736 total iterations (3,890,906 /sec).	2,323/3,081 = 75.40% non-zero rates.
Best energy after 219,843,512 total perturbations:
	Total:	1.2532111E-7 (-1.67%)	Equality:	1.2532111E-7 (-1.67%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2532111E-7 (-1.67%)
Threaded total round 101 DONE after 1 min 41.1 secs, 393,405,662 total iterations (3,891,599 /sec).	2,320/3,081 = 75.30% non-zero rates.
Best energy after 222,216,911 total perturbations:
	Total:	1.2491232E-7 (-0.33%)	Equality:	1.2491232E-7 (-0.33%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2491232E-7 (-0.33%)
Threaded total round 102 DONE after 1 min 42.1 secs, 397,295,317 total iterations (3,891,580 /sec).	2,319/3,081 = 75.27% non-zero rates.
Best energy after 224,524,825 total perturbations:
	Total:	1.2402265E-7 (-0.71%)	Equality:	1.2402265E-7 (-0.71%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2402265E-7 (-0.71%)
Threaded total round 103 DONE after 1 min 43.1 secs, 401,200,927 total iterations (3,891,679 /sec).	2,317/3,081 = 75.20% non-zero rates.
Best energy after 226,854,657 total perturbations:
	Total:	1.2289067E-7 (-0.91%)	Equality:	1.2289067E-7 (-0.91%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2289067E-7 (-0.91%)
Threaded total round 104 DONE after 1 min 44.1 secs, 405,091,870 total iterations (3,891,672 /sec).	2,317/3,081 = 75.20% non-zero rates.
Best energy after 229,182,308 total perturbations:
	Total:	1.225723E-7 (-0.26%)	Equality:	1.225723E-7 (-0.26%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.225723E-7 (-0.26%)
Threaded total round 105 DONE after 1 min 45.1 secs, 408,992,612 total iterations (3,891,721 /sec).	2,314/3,081 = 75.11% non-zero rates.
Best energy after 230,921,729 total perturbations:
	Total:	1.2157787E-7 (-0.81%)	Equality:	1.2157787E-7 (-0.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2157787E-7 (-0.81%)
Threaded total round 106 DONE after 1 min 46.1 secs, 412,968,178 total iterations (3,892,511 /sec).	2,313/3,081 = 75.07% non-zero rates.
Best energy after 233,282,048 total perturbations:
	Total:	1.2119185E-7 (-0.32%)	Equality:	1.2119185E-7 (-0.32%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2119185E-7 (-0.32%)
Threaded total round 107 DONE after 1 min 47.1 secs, 416,891,030 total iterations (3,892,758 /sec).	2,313/3,081 = 75.07% non-zero rates.
Best energy after 235,588,707 total perturbations:
	Total:	1.2071655E-7 (-0.39%)	Equality:	1.2071655E-7 (-0.39%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2071655E-7 (-0.39%)
Threaded total round 108 DONE after 1 min 48.1 secs, 420,797,692 total iterations (3,892,887 /sec).	2,311/3,081 = 75.01% non-zero rates.
Best energy after 237,873,298 total perturbations:
	Total:	1.2005079E-7 (-0.55%)	Equality:	1.2005079E-7 (-0.55%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.2005079E-7 (-0.55%)
Threaded total round 109 DONE after 1 min 49.1 secs, 424,769,704 total iterations (3,893,576 /sec).	2,306/3,081 = 74.85% non-zero rates.
Best energy after 238,843,601 total perturbations:
	Total:	1.1810085E-7 (-1.62%)	Equality:	1.1810085E-7 (-1.62%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1810085E-7 (-1.62%)
Threaded total round 110 DONE after 1 min 50.1 secs, 428,700,893 total iterations (3,893,883 /sec).	2,305/3,081 = 74.81% non-zero rates.
Best energy after 240,470,026 total perturbations:
	Total:	1.1695833E-7 (-0.97%)	Equality:	1.1695833E-7 (-0.97%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1695833E-7 (-0.97%)
Threaded total round 111 DONE after 1 min 51.1 secs, 432,660,389 total iterations (3,894,473 /sec).	2,314/3,081 = 75.11% non-zero rates.
Best energy after 242,271,021 total perturbations:
	Total:	1.1565808E-7 (-1.11%)	Equality:	1.1565808E-7 (-1.11%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1565808E-7 (-1.11%)
Threaded total round 112 DONE after 1 min 52.1 secs, 436,608,257 total iterations (3,894,915 /sec).	2,315/3,081 = 75.14% non-zero rates.
Best energy after 244,568,072 total perturbations:
	Total:	1.1506235E-7 (-0.52%)	Equality:	1.1506235E-7 (-0.52%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1506235E-7 (-0.52%)
Threaded total round 113 DONE after 1 min 53.1 secs, 440,582,885 total iterations (3,895,620 /sec).	2,310/3,081 = 74.98% non-zero rates.
Best energy after 245,951,885 total perturbations:
	Total:	1.1269019E-7 (-2.06%)	Equality:	1.1269019E-7 (-2.06%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1269019E-7 (-2.06%)
Threaded total round 114 DONE after 1 min 54.1 secs, 444,522,175 total iterations (3,895,968 /sec).	2,307/3,081 = 74.88% non-zero rates.
Best energy after 248,282,283 total perturbations:
	Total:	1.112867E-7 (-1.25%)	Equality:	1.112867E-7 (-1.25%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.112867E-7 (-1.25%)
Threaded total round 115 DONE after 1 min 55.1 secs, 448,468,541 total iterations (3,896,372 /sec).	2,308/3,081 = 74.91% non-zero rates.
Best energy after 250,572,584 total perturbations:
	Total:	1.1053699E-7 (-0.67%)	Equality:	1.1053699E-7 (-0.67%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1053699E-7 (-0.67%)
Threaded total round 116 DONE after 1 min 56.1 secs, 452,413,231 total iterations (3,896,788 /sec).	2,307/3,081 = 74.88% non-zero rates.
Best energy after 252,881,645 total perturbations:
	Total:	1.1008591E-7 (-0.41%)	Equality:	1.1008591E-7 (-0.41%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1008591E-7 (-0.41%)
Threaded total round 117 DONE after 1 min 57.1 secs, 456,361,895 total iterations (3,897,198 /sec).	2,308/3,081 = 74.91% non-zero rates.
Best energy after 255,194,694 total perturbations:
	Total:	1.09624196E-7 (-0.42%)	Equality:	1.09624196E-7 (-0.42%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.09624196E-7 (-0.42%)
Threaded total round 118 DONE after 1 min 58.1 secs, 460,314,693 total iterations (3,897,669 /sec).	2,304/3,081 = 74.78% non-zero rates.
Best energy after 257,513,247 total perturbations:
	Total:	1.0915787E-7 (-0.43%)	Equality:	1.0915787E-7 (-0.43%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.0915787E-7 (-0.43%)
Threaded total round 119 DONE after 1 min 59.1 secs, 464,265,561 total iterations (3,898,083 /sec).	2,304/3,081 = 74.78% non-zero rates.
Best energy after 259,241,376 total perturbations:
	Total:	1.08553365E-7 (-0.55%)	Equality:	1.08553365E-7 (-0.55%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.08553365E-7 (-0.55%)
Threaded total round 120 DONE after 2 mins 0.1 secs, 468,187,480 total iterations (3,898,249 /sec).	2,300/3,081 = 74.65% non-zero rates.
Best energy after 261,418,626 total perturbations:
	Total:	1.0825959E-7 (-0.27%)	Equality:	1.0825959E-7 (-0.27%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.0825959E-7 (-0.27%)
Threaded annealing schedule completed.
Done with Inversion after 2 mins 0.1 secs.
Rounds: 120
Total Iterations: 468187480
Total Perturbations: 261418626
Best energy:
	Total:	1.0825959E-7	Equality:	1.0825959E-7	Entropy:	0.0
	Inequality:	0.0	SlipRate:	1.0825959E-7
DONE. Building solution...
Solution:	Mapping module type 'scratch.UCERF3.simulatedAnnealing.completion.AnnealingProgress' to: Annealing Progress
Getting copy of sub-module 'Rupture Set' with updated parent
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel
Rupture Set:	Getting copy of sub-module 'Rupture Average Slips' with updated parent
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule$Precomputed' to: Rupture Average Slips
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule' to: Rupture Average Slips
Rupture Set:	Removing available module with type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel' as it is assignable from 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel'
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel$Default' to: Default (Uniform) Slip Along Rupture
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel' to: Default (Uniform) Slip Along Rupture
Rupture Set:	Getting copy of sub-module 'Section Slip Rates' with updated parent
Rupture Set:	Removing available module with type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates' as it is assignable from 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates'
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates$Default' to: Section Slip Rates
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates' to: Section Slip Rates
Rupture Set:	Getting copy of sub-module 'Section Areas' with updated parent
Rupture Set:	Removing available module with type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas' as it is assignable from 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas'
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas$Default' to: Section Areas
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas' to: Section Areas
Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet' to: Rupture Set
Removing module 'Rupture Set' with type 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet' as it is assignable from 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet'
Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet' to: Rupture Set
Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemSolution' to: Solution
------------ WRITING ARCHIVE ------------
Temporary archive: /data/kevin/git/opensha-fault-sys-tools/data/u3_ssaf_simple_sol.zip.tmp
Writing 2 modules
	Writing module: Rupture Set
Writing 4 nested modules from 'Rupture Set' with prefix='ruptures/'
	Writing module: Rupture Average Slips
	Skipping transient module: Default (Uniform) Slip Along Rupture
	Skipping transient module: Section Slip Rates
	Skipping transient module: Section Areas
Wrote 1 modules, writing index to ruptures/modules.json
	Writing module: Solution
Writing 1 nested modules from 'Solution' with prefix='solution/'
	Writing module: Annealing Progress
Wrote 1 modules, writing index to solution/modules.json
Wrote 2 modules, writing index to modules.json
Moving to /data/kevin/git/opensha-fault-sys-tools/data/u3_ssaf_simple_sol.zip
---------- END WRITING ARCHIVE ----------
```
