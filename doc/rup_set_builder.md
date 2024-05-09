# Rupture Set Builder Tool

USAGE: `fst_rup_set_builder.sh --sub-sections </path/to/subsections.geojson> --scale <scaling relationship> --preset <plausibility configuration prest> --output-file </path/to/output_file.zip>`

This command line tool allows a user to build a [rupture set](glossary.md#rupture-set) from a set of [subsections](glossary.md#fault-subsection), using various [plausibility filters](glossary.md#plausibility-filter) to determine [multifault ruptures](glossary.md#multifault-rupture).

## Command Line Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-of/--output-file` | **REQUIRED** | Path to write output Fault System Rupture Set file. If the supplied path is a directory, then a file name will be determined programatically and placed in that directory. | `--output-file rup_set.zip` |
| `-sc/--scale` | **REQUIRED** | Scaling relationship to use (for rupture magnitudes & average slips). Options: SHAW_2009_MOD, HANKS_BAKUN_08, ELLSWORTH_B, ELLB_SQRT_LENGTH, SHAW_CONST_STRESS_DROP, AVE_UCERF2, MEAN_UCERF3, LOGA_C4p3, LOGA_C4p2, LOGA_C4p1, WIDTH_LIMITED, LOGA_C4p2_SQRT_LEN, WIDTH_LIMITED_CSD, MEAN_NSHM23 | `--scale MEAN_UCERF3` |
| `-s/--sub-sections` | **REQUIRED** | Path to GeoJSON file containing subsections from which to build a rupture set. Must supply this or a UCERF3 fault model (via --fault-model). Can be generated with the [subsection builder tool](sub_sect_builder.md). | `--sub-sections faults.geojson` |
| `-p/--preset` | **REQUIRED** | Rupture set plausibility configuration preset. Presets may have their own command line options, which can be seen by selecting them and supplying the --help argument. Options: UCERF3, COULOMB, SEGMENTED, SIMPLE_AZIMUTHAL. | `--preset SIMPLE_AZIMUTHAL` |
| `-c/--config` | _(none)_ | Rupture set plausibility configuration JSON file to override default parameters for the selected preset. | `--config config.json` |
| `-cd/--cache-dir` | _(none)_ | Optional directory to store/load cache files (distances, coulomb, etc) to speed up rupture set building and processing. | `--cache-dir /path/to/cache` |
| `-fm/--fault-model` | _(disabled)_ | UCERF3 Fault Model, used to fetch UCERF3 fault sections as an alternative to --sub-sections. | `--fault-model FM3_1` |
| `-t/--threads` | _(system dependent)_ | Number of calculation threads. Default is the lesser of 32 and the number of processors on the system. | `--threads 8` |
| `-wc/--write-config` | _(disabled)_ | Flag to write the default configuration JSON file for the given preset instead of a rupture set, which can then be edited and passed back in with the --config option when building a rupture set. | `--write-config` |

## Plausibility Presets

Multifault rupture plausibility is complicated, and multiple models exist. Here, we allow the user to choose from 3 different plausibility configuration _presets_:

### UCERF3

The `UCERF3` preset allows a user to reproduce the plausibility rules used in UCERF3, and docmented in [Appendix T of the UCERF3 Open File Report](https://pubs.usgs.gov/of/2013/1165/). Parameter values cannot be edited, and note that the Coulomb calculations used in UCERF3 were precomputed for the two UCERF3 fault models and will be disabled if run with a different set of subsections.

### Segmented

The `SEGMENTED` preset creates a fully segmented model, where no fault sections rupture together, regardless of proximity.

### Simple Azimuthal

The `SIMPLE_AZIMUTHAL` preset is a UCERF3-like plausibility configuration that allows the user to edit the various filter thresholds, and exludes the precomptued UCERF3 Coulomb calculations. Parameters can be edited by first generating a default configuration file:

```
fst_rup_set_builder.sh --preset SIMPLE_AZIMUTHAL --write-config --output-file config.json
```

...and then editing the parameter values in that configuration file, and passing in the modified file with the `--config config.json` argument. Parameter values are as follows:

| Name | Description | Default Value |
|---|---|---|
| `jumpAzimuthChange` | Maximum azimuth change at any jump between fault sections/ | `60` |
| `totalAzimuthChange` | Maximum total azimuth change between the start and end of a multifault rupture/ | `60` |
| `leftLateralFlipAzimuth` | Flag to reverse azimuths for left-lateral faults, allowing acute angle connections between right-lateral and left-lateral faults/ | `true` |
| `cumulativeAzimuthChange` | Maximum total azimuth change, summed across each neighboring subsection pairs. In practice, this penalizes "squirrely" faults, as well as those with stepovers. | `560` |
| `cumulativeRakeChange` | Maximum total rake change in a multifault rupture. | `180` |
| `minSectsPerParent` | Minimum number of subsections per parent fault section in a rupture. This prevents ruptures with jumps to a single (tall and skinny) subsection from another fault. | `2` |
| `maxJumpDist` | Maximum allowed jump distance between faults in kilometers. | `5` |
| `adaptiveSectFract` | If non-zero, this reduces the set of similar long multifault ruptures by requiring that each subsequent rupture increase the subsection count by at least the given fraction. For example, if adaptiveSectFract=0.1, then each subsequent rupture must be at least 10% larger than the previous rupture. | `0.0` |

### Coulomb

The `COULOMB` preset is the NSHM23 plausibility configuration that largely replaces azimuthal constraints with on-the-fly Coulomb compatibility calculations, documented in [Milner et al. (2022)](https://doi.org/10.1785/0120210322). This is a complicated model with many user editable filter thresholds. Coulomb calculations can be very computationally demanding. Parameters can be edited by first generating a default configuration file:

```
fst_rup_set_builder.sh --preset COULOMB --write-config --output-file config.json
```

...and then editing the parameter values in that configuration file, and passing in the modified file with the `--config config.json` argument. Parameter values and recommended values will be documented in a future publication when the model is finalized. The following options are also available in the command line interface when using this preset:

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `--bilateral` | _(disabled)_ | Flag to enable bilateral rupture. Also see --bilateral-variation-mode. | `--bilateral` |
| `--bilateral-variation-mode` | `EQUAL_LEN` | Bilateral variation mode, see figure 13 of Milner et al. (2022). Options: ALL, SINGLE_FULL, EQUAL_LEN. | `--bilateral-variation-mode EQUAL_LEN` |

### Example

This was the command used to build the example [simple Southern San Andreas rupture set](../data/u3_ssaf_simple_rup_set.zip)

```
$ fst_rup_set_builder.sh --sub-sections data/u3_ssaf_sub_sects.geojson --preset SIMPLE_AZIMUTHAL --scale MEAN_UCERF3 --output-file data/u3_ssaf_simple_rup_set.zip
Using global OPENSHA_MEM_GB=180
Rupture plausibility preset: SIMPLE_AZIMUTHAL
Loaded 88 sub-sections
Scaling relationship: Mean UCERF3 Scaling Relationship
Initializing connections w/ 32 threads...
Building ruptures with 32 threads...
Waiting on 10 cluster build futures
New largest rup has 10 subsections with 0 jumps and 0 splays.
	70 total unique passing ruptures found, longest has 10 subsections.	Clusters: 10 running (17 futures), 0 completed, 10 total. 	Rate: 4,667 rups/s (4,667 rups/s over last 0.0s)
New largest rup has 20 subsections with 2 jumps and 0 splays.
	350 total unique passing ruptures found, longest has 20 subsections.	Clusters: 10 running (77 futures), 0 completed, 10 total. 	Rate: 8,750 rups/s (11,200 rups/s over last 0.0s)
New largest rup has 30 subsections with 3 jumps and 0 splays.
	719 total unique passing ruptures found, longest has 30 subsections.	Clusters: 10 running (110 futures), 0 completed, 10 total. 	Rate: 13,073 rups/s (24,600 rups/s over last 0.0s)
	1,000 total unique passing ruptures found, longest has 35 subsections.	Clusters: 10 running (120 futures), 0 completed, 10 total. 	Rate: 15,873 rups/s (35,125 rups/s over last 0.0s)
New largest rup has 40 subsections with 4 jumps and 0 splays.
	1,145 total unique passing ruptures found, longest has 40 subsections.	Clusters: 10 running (122 futures), 0 completed, 10 total. 	Rate: 17,090 rups/s (36,250 rups/s over last 0.0s)
New largest rup has 50 subsections with 6 jumps and 0 splays.
	1,374 total unique passing ruptures found, longest has 50 subsections.	Clusters: 10 running (123 futures), 0 completed, 10 total. 	Rate: 18,320 rups/s (28,625 rups/s over last 0.0s)
New largest rup has 60 subsections with 7 jumps and 0 splays.
	1,608 total unique passing ruptures found, longest has 60 subsections.	Clusters: 10 running (118 futures), 0 completed, 10 total. 	Rate: 19,852 rups/s (39,000 rups/s over last 0.0s)
New largest rup has 70 subsections with 8 jumps and 0 splays.
	1,946 total unique passing ruptures found, longest has 70 subsections.	Clusters: 10 running (106 futures), 0 completed, 10 total. 	Rate: 21,152 rups/s (30,727 rups/s over last 0.0s)
	2,000 total unique passing ruptures found, longest has 71 subsections.	Clusters: 10 running (102 futures), 0 completed, 10 total. 	Rate: 21,277 rups/s (27,000 rups/s over last 0.0s)
New largest rup has 80 subsections with 9 jumps and 0 splays.
	2,263 total unique passing ruptures found, longest has 80 subsections.	Clusters: 10 running (88 futures), 0 completed, 10 total. 	Rate: 22,186 rups/s (32,875 rups/s over last 0.0s)
	3,000 total unique passing ruptures found, longest has 85 subsections.	Clusters: 4 running (38 futures), 6 completed, 10 total. 	Rate: 20,833 rups/s (17,548 rups/s over last 0.0s)
Merged in 870 ruptures after processing start cluster 1/10 (id=295): San Andreas (Coachella) rev (870 new, 870 incl. possible duplicates).
	3,081 total unique passing ruptures found, longest has 88 subsections.	Clusters: 0 running (0 futures), 10 completed, 10 total. 	Rate: 17,707 rups/s (2,700 rups/s over last 0.0s)
Merged in 1,311 ruptures after processing start cluster 2/10 (id=284): San Andreas (San Gorgonio Pass-Garnet HIll) (441 new, 441 incl. possible duplicates).
Merged in 1,650 ruptures after processing start cluster 3/10 (id=283): San Andreas (San Bernardino S) (339 new, 339 incl. possible duplicates).
Merged in 1,905 ruptures after processing start cluster 4/10 (id=282): San Andreas (San Bernardino N) (255 new, 255 incl. possible duplicates).
Merged in 2,486 ruptures after processing start cluster 5/10 (id=301): San Andreas (Mojave S) (581 new, 581 incl. possible duplicates).
Merged in 2,616 ruptures after processing start cluster 6/10 (id=286): San Andreas (Mojave N) (130 new, 130 incl. possible duplicates).
Merged in 2,781 ruptures after processing start cluster 7/10 (id=287): San Andreas (Big Bend) (165 new, 165 incl. possible duplicates).
Merged in 2,928 ruptures after processing start cluster 8/10 (id=300): San Andreas (Carrizo) rev (147 new, 147 incl. possible duplicates).
Merged in 3,053 ruptures after processing start cluster 9/10 (id=285): San Andreas (Cholame) rev (125 new, 125 incl. possible duplicates).
Merged in 3,081 ruptures after processing start cluster 10/10 (id=32): San Andreas (Parkfield) (28 new, 28 incl. possible duplicates).
Built 3,081 ruptures in 0.18 secs = 0.00 mins. Total rate: 17,212 rups/s
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.ClusterRuptures
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.ruptures.util.SectionDistanceAzimuthCalculator
Rupture Set:	Mapping available module with type: org.opensha.sha.earthquake.faultSysSolution.ruptures.plausibility.PlausibilityConfiguration
Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.FaultSystemRupSet' to: Rupture Set
------------ WRITING ARCHIVE ------------
Temporary archive: /data/kevin/git/opensha-fault-sys-tools/data/u3_ssaf_simple_rup_set.zip.tmp
Writing 1 modules
	Writing module: Rupture Set
Writing 0 nested modules from 'Rupture Set' with prefix='ruptures/'
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas$Default' to: Section Areas
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectAreas' to: Section Areas
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates$Default' to: Section Slip Rates
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SectSlipRates' to: Section Slip Rates
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel$Default' to: Default (Uniform) Slip Along Rupture
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.SlipAlongRuptureModel' to: Default (Uniform) Slip Along Rupture
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.ClusterRuptures$SingleStranded' to: Single-Strand Cluster Ruptures
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.ClusterRuptures' to: Single-Strand Cluster Ruptures
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule$ModelBased' to: Rupture Average Slips
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.modules.AveSlipModule' to: Rupture Average Slips
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.ruptures.util.SectionDistanceAzimuthCalculator' to: Section Distance-Azimuth Calculator
Rupture Set:	Lazily loading available module...
Rupture Set:	Mapping module type 'org.opensha.sha.earthquake.faultSysSolution.ruptures.plausibility.PlausibilityConfiguration' to: Plausibility Configuration
	Skipping transient module: Section Areas
	Skipping transient module: Section Slip Rates
	Skipping transient module: Default (Uniform) Slip Along Rupture
	Writing module: Single-Strand Cluster Ruptures
	Writing module: Rupture Average Slips
	Skipping transient module: Section Distance-Azimuth Calculator
	Writing module: Plausibility Configuration
Wrote 3 modules, writing index to ruptures/modules.json
Wrote 1 modules, writing index to modules.json
Moving to /data/kevin/git/opensha-fault-sys-tools/data/u3_ssaf_simple_rup_set.zip
---------- END WRITING ARCHIVE ----------
```
