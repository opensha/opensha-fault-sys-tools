# Inversion Runner Tool

USAGE: `fst_inversion_runner.sh --rupture-set </path/to/rupture_set.zip> --output-file </path/to/output_solution.zip> [constraint arguments] --completion 30m`

This command line tool allows a user to run an inversion to solve for the rates of each [supra-seismogenic rupture](glossary.md#supra-seismogenic-rupture) from a [Rupture Set](glossary.md#rupture-set). The output is a [Solution](glossary.md#solution) zip file.

The [Simulated Annealing](glossary.md#simulated-annealing) inversion approach is described in detail in [this publication](https://pubs.geoscienceworld.org/ssa/bssa/article/104/3/1181/351434/The-UCERF3-Grand-Inversion-Solving-for-the-Long):

Morgan T. Page, Edward H. Field, Kevin R. Milner, Peter M. Powers; The UCERF3 Grand Inversion: Solving for the Long‐Term Rate of Ruptures in a Fault System. _Bulletin of the Seismological Society of America 2014_;; 104 (3): 1181–1204. doi: https://doi.org/10.1785/0120130180

## Command Line Arguments

### Required Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-rs/--rupture-set` | **REQUIRED** | Path to Rupture Set zip file. | `--rupture-set rupture_set.zip` |
| `-of/--output-file` | **REQUIRED** | Path to write output Fault System Solution file. | `--output-file solution.zip` |
| `-c,--completion` | **REQUIRED** | Total inversion completion criteria. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. | `--completion 30m` |

Additionally, at least one constraint is required (see next section).

### Constraints

Various inversion constraints are availble, and each constraint can optinoally be assigned custom weights (e.g., to favor one piece of data over another).

#### Slip Rate Constraints

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-sl/--slip-constraint` | _(disabled)_ | Enables the slip-rate constraint. | `--slip-constraint` |
| `-sw/--slip-weight` | `1.0` | Sets the weight for the regular slip-rate constraint, where misfits are not normalized by the section slip rate. Enabled by default, disable by setting the weight to `0` if desired. | `--slip-weight 1.0` |
| `-nsw/--norm-slip-weight` | `0.0` | Sets the weight for the normalized slip-rate constraint, where misfits are normalized by the section slip rate. Disabled by default. | `--norm-slip-weight 1.0` |

#### MFD Constraints

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-mfd/--mfd-constraint` | _(disabled)_ | Enables the MFD constraint. Must also supply either `--infer-target-gr` or `--mfd-total-rate`. | `--mfd-constraint` |
| `-b/--b-value` | `1.0` | Gutenberg-Richter b-value. | `--b-value 1.0` |
| `-itgr/--infer-target-gr` | _(disabled)_ | Flag to infer target MFD as a G-R from total deformation model moment rate. | `--infer-target-gr` |
| `-mtr/--mfd-total-rate` | _(disabled)_ | Total (cumulative) rate for the MFD constraint. By default, this will apply to the minimum magnitude from the rupture set, but another magnitude can be supplied with `--mfd-min-mag` | `--mfd-total-rate 5.0` |
| `-mmm/--mfd-min-mag` | _(determined from rupture set)_ | Minimum magnitude for the MFD constraint (default is minimum magnitude of the rupture set), used with --mfd-total-rate. | `--mfd-min-mag 5.0` |
| `-mw/--mfd-weight` | `1.0` | Sets the weight for the MFD constraint. | `--mfd-weight 1.0` |

#### Total Moment Rate Constraint

| Argument | Default Value | Description | Example |
|---|---|---|---|
| ` -mr,--moment-rate-constraint` | _(disabled)_ | Enables the total moment-rate constraint. By default, the slip-rate implied moment rate will be used, but you can supply your own target moment rate with `--target-moment-rate`. | `--moment-rate-constraint` |
| `-mrw,--moment-rate-weight` | `1e-5` | Sets weight for the moment-rate constraint. | `--moment-rate-weight 1.0` |
| `-tmr,--target-moment-rate` | _(determined from deformation models)_ | Specifies a custom target moment-rate in N-m/yr (must also supply --moment-rate-constraint option) | `--target-moment-rate 1.0e18` |

#### Total Event Rate Constraint

| Argument | Default Value | Description | Example |
|---|---|---|---|
| ` -er,--event-rate-constraint` | _(disabled)_ | Enables the total event-rate constraint with the supplied total event rate. | `--event-rate-constraint 5.0` |
| `-erw,--event-rate-weight` | `1.0` | Sets weight for the event-rate constraint. | `--event-rate-weight 1.0` |

### Simulated Annealing Parameters

At a minimum, you must supply a completion criteria for the iteration via either `--hours <val>`, `--minutes <val>`, `--seconds <val>`, or `--iterations <val>`. Additionally, the algorithm will be multithreaded by default (disable with `--threads 1`) and across-thread synchronization time can be controlled with the `--sub-seconds <val>` or `--sub-iterations <val>` options.

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-c,--completion` | **REQUIRED** | Total inversion completion criteria. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. | `--completion 30m` |
| `-t,--threads` | _(system-dependent)_ | Number of calculation threads. Default is the lesser of 32 and the number of processors on the system. | `--threads 8` |
| `-sc,--sub-completion` | `1s` | Interval between across-thread synchronization. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. Default: 1s | `--sub-seconds 1` |
| `-si,--sub-iterations` | _(none)_ | Iterations between across-thread synchronization in seconds. Default: 1 s. | `--sub-completion 1s` |
| `-at,--average-threads` | _(disabled)_ | Enables a top layer of threads that average results of worker threads at fixed intervals. Supply the number of averaging threads, which must be < threads. Default is no averaging, if enabled you must also supply `--average-completion <value>`. | `--average-threads 4`
| `-ac,--average-completion` | _(disabled)_ | Interval between across-thread averaging. If either no suffix or 'i' is appended, then it is assumed to be an iteration count. Specify times in hours, minutes, or seconds by appending 'h', 'm', or 's' respecively. Fractions are not allowed. | `--average-completion 1m` |
| `-pt,--perturb` | `VARIABLE_EXPONENTIAL_SCALE` | Perturbation function. One of UNIFORM_NO_TEMP_DEPENDENCE, VARIABLE_NO_TEMP_DEPENDENCE, GAUSSIAN, TANGENT, POWER_LAW, EXPONENTIAL, EXPONENTIAL_RANGE, EXPONENTIAL_SCALE, VARIABLE_EXPONENTIAL_SCALE. | `--perturb VARIABLE_EXPONENTIAL_SCALE` |
| `-nn,--non-negativity` | `TRY_ZERO_RATES_OFTEN` | Non-negativity constraint. One of TRY_ZERO_RATES_OFTEN, LIMIT_ZERO_RATES, PREVENT_ZERO_RATES. | `--non-negativity TRY_ZERO_RATES_OFTEN` |

### Example

This was the command used to build the example [simple Southern San Andreas solution](../data/u3_ssaf_simple_sol.zip)

```
$ fst_inversion_runner.sh --rupture-set data/u3_ssaf_simple_rup_set.zip --output-file data/u3_ssaf_simple_sol.zip --slip-constraint --moment-rate-constraint --completion 2m --threads 32 --average-threads 8 --average-completion 10s
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
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas$Default' to: Section Areas
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas' to: Section Areas
Target moment rate: 5.4376451019042826E18 N-m/yr
Generating inversion inputs with 3081 ruptures and 2 constraints
Building empty intial solution (all zeroes)
Calculating constraint row counts
	SlipRate: [0..88), 88 rows (took 0 ms)
	TotMoment: [88..89), 1 rows (took 0 ms)
Took 8 ms to get row counts
Building A matrix with 89 rows and 3081 columns
Encoding matrices
	Encoding Slip Rate, ineq=false
		DONE, took 50 ms to encode 95685 values (density: 35.3 %)
	Encoding Total Moment, ineq=false
		DONE, took 0 ms to encode 3081 values (density: 100.0 %)
DONE encoding, took 59 ms to encode 98766 values (density: 36.0 %)
Took 76 ms to generate inputs
Computing variable perturbation basis:
	Inferring target GR from slip rates
Inferring target G-R
Perturbation-basis range: [1.2706653E-6, 0.07460762]
Annealing!
Threaded Simulated Annealing starting with 8 threads, TimeCompletionCriteria(milis: 120000 = 120.0 seconds), SUB: TimeCompletionCriteria(milis: 10000 = 10.0 seconds)
Threaded total round 1 DONE after 10 secs, 32,561,372 total iterations (3,252,884 /sec).	2,857/3,081 = 92.73% non-zero rates.
Best energy after 7,361 total perturbations:
	Total:	68.9859	Equality:	68.9859	Entropy:	0.0
	Inequality:	0.0	SlipRate:	0.008719863	TotMoment:	68.97718
Threaded total round 2 DONE after 20 secs, 69,141,370 total iterations (3,453,270 /sec).	2,857/3,081 = 92.73% non-zero rates.
Best energy after 7,371 total perturbations:
	Total:	3.6024995 (-94.78%)	Equality:	3.6024995 (-94.78%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (+0.00%)	TotMoment:	3.5937796 (-94.79%)
Threaded total round 3 DONE after 30 secs, 105,706,492 total iterations (3,520,616 /sec).	2,857/3,081 = 92.73% non-zero rates.
Best energy after 7,373 total perturbations:
	Total:	2.024415 (-43.81%)	Equality:	2.024415 (-43.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (-0.00%)	TotMoment:	2.0156953 (-43.91%)
Threaded total round 4 DONE after 40 secs, 142,428,820 total iterations (3,558,319 /sec).	2,857/3,081 = 92.73% non-zero rates.
Best energy after 7,376 total perturbations:
	Total:	1.3237073 (-34.61%)	Equality:	1.3237073 (-34.61%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (+0.00%)	TotMoment:	1.3149875 (-34.76%)
Threaded total round 5 DONE after 50 secs, 179,123,911 total iterations (3,580,187 /sec).	2,857/3,081 = 92.73% non-zero rates.
Best energy after 7,379 total perturbations:
	Total:	0.75251967 (-43.15%)	Equality:	0.75251967 (-43.15%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (-0.00%)	TotMoment:	0.7437998 (-43.44%)
Threaded total round 6 DONE after 1 min 0 secs, 216,459,796 total iterations (3,605,620 /sec).	2,857/3,081 = 92.73% non-zero rates.
Best energy after 7,379 total perturbations:
	Total:	0.75251967 (0.00%)	Equality:	0.75251967 (0.00%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (0.00%)	TotMoment:	0.7437998 (0.00%)
Threaded total round 7 DONE after 1 min 10 secs, 254,125,004 total iterations (3,628,232 /sec).	2,858/3,081 = 92.76% non-zero rates.
Best energy after 7,383 total perturbations:
	Total:	0.3681804 (-51.07%)	Equality:	0.3681804 (-51.07%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (-0.00%)	TotMoment:	0.35946053 (-51.67%)
Threaded total round 8 DONE after 1 min 20 secs, 292,045,120 total iterations (3,648,603 /sec).	2,858/3,081 = 92.76% non-zero rates.
Best energy after 7,386 total perturbations:
	Total:	0.22704446 (-38.33%)	Equality:	0.22704446 (-38.33%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (-0.00%)	TotMoment:	0.2183246 (-39.26%)
Threaded total round 9 DONE after 1 min 30 secs, 329,637,682 total iterations (3,660,851 /sec).	2,858/3,081 = 92.76% non-zero rates.
Best energy after 7,386 total perturbations:
	Total:	0.22704446 (-0.00%)	Equality:	0.22704446 (-0.00%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (-0.00%)	TotMoment:	0.2183246 (-0.00%)
Threaded total round 10 DONE after 1 min 40 secs, 367,509,075 total iterations (3,673,364 /sec).	2,858/3,081 = 92.76% non-zero rates.
Best energy after 7,386 total perturbations:
	Total:	0.22704446 (0.00%)	Equality:	0.22704446 (0.00%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (0.00%)	TotMoment:	0.2183246 (0.00%)
Threaded total round 11 DONE after 1 min 50 secs, 405,455,766 total iterations (3,684,320 /sec).	2,858/3,081 = 92.76% non-zero rates.
Best energy after 7,387 total perturbations:
	Total:	0.18352056 (-19.17%)	Equality:	0.18352056 (-19.17%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (+0.00%)	TotMoment:	0.1748007 (-19.94%)
Threaded total round 12 DONE after 2 mins 0.1 secs, 443,604,043 total iterations (3,695,130 /sec).	2,858/3,081 = 92.76% non-zero rates.
Best energy after 7,387 total perturbations:
	Total:	0.18352056 (0.00%)	Equality:	0.18352056 (0.00%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	0.008719863 (0.00%)	TotMoment:	0.1748007 (0.00%)
Threaded annealing schedule completed.
Done with Inversion after 2 mins 0.1 secs.
Rounds: 12
Total Iterations: 443604043
Total Perturbations: 7387
Best energy:
	Total:	0.18352056	Equality:	0.18352056	Entropy:	0.0
	Inequality:	0.0	SlipRate:	0.008719863	TotMoment:	0.1748007
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
