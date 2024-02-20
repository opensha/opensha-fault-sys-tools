# OpenSHA Fault System Tools

Tools for Fault Systems: building and analyzing [Rupture Sets](doc/glossary.md#rupture-set), inverting for [Solutions](doc/glossary.md#solution), computing and disaggregating hazard.

## Prerequisites

* Java (either JRE or JDK) 11 or above in your path: https://adoptopenjdk.net/
  * confirm by typing `java -version` in a terminal
* Unix-like environment: Linux, Mac OS X, Windows Subsystem for Linux (WSL)
* Basic command line skills (changing directories, defining environmental variables, editing text files, running scripts)

## Setup

First, clone this entire repository from GitHub or download it as a zip file. Here's the command to do it in a terminal:

```
git clone https://github.com/opensha/opensha-fault-sys-tools.git
```

For convenience, you may want to add the `sbin` directory of this repository to your PATH, otherwise you will have to manually type the full path to each scrip that you want to execute. This is outside the scope of this documentation, but for most users adding the following line to `~/.bash_profile` should work:

```
export PATH=$PATH:/path/to/opensha-fault-sys-tools/sbin
```

If you want to allocate a specific maximum amount of memory to Java when running these tools, you can specify the maximum amount of memory in gigabytes by defining the `OPENSHA_MEM_GB` environmental variable in your `~/.bash_profile` script, e.g., to allocation 12 GB:

```
export OPENSHA_MEM_GB=12
```

If not specified, up to 80% of total system memory will be allocated.

### Building and Updating OpenSHA

The first time you attempt to run a script, it will attempt to download/build OpenSHA. The preferred method is to fully check out and build the [OpenSHA source code from GitHub](https://github.com/opensha/opensha). If the tools required to build OpenSHA are not avaiable, then a pre-built version of OpenSHA will be downloaded.

If you check out the OpenSHA project, updates will be checked when you run Fault System Tools scrips (at most once an hour). If you download a pre-built jar file, updates will be checked weekly. Automatic updates can be fully disabled by setting the environmental variable `OPENSHA_JAR_DISABLE_UPDATE=1`.

You can force an update at any time by running `fst_force_opensha_update.sh`, which you might want to do now to ensure that you can successfully download/build OpenSHA.

If you encounter any problems, or wish to switch your build/update method, you can safely delete the 'opensha' subdirectory and try again.

## Calculation Pipeline and Example

### Defining Your Fault Model

The first step is to define your [fault sections](doc/glossary.md#fault-section) in the [OpenSHA GeoJSON format](https://opensha.org/Geospatial-File-Formats). An example input file, consisting of UCERF3 Southern San Andreas fault sections is [available here](data/u3_ssaf_sects.geojson). You can skip this step if you wish to use an existing UCERF3 Fault Model.

### Building Fault Subsections

Then, you must convert your fault model into smaller, approximately equal length [fault subsections](doc/glossary.md#fault-subsections) with the [Subsection Builder Tool](doc/sub_sect_builder.md). For example, to convert the example S.SAF fault model to subsections:

```
opensha-fault-sys-tools$ fst_sub_sect_builder.sh --input-file data/u3_ssaf_sects.geojson --output-file u3_ssaf_sub_sects.geojson 
Loaded 10 fault sections.
Built 88 subsections
Writing sections to u3_ssaf_sub_sects.geojson
```

Or to use a UCERF3 fault model, in this case FM3.1:

```
opensha-fault-sys-tools$ fst_sub_sect_builder.sh --ucerf3 --fault-model FM3_1 --output-file fm3_1_sub_sects.geojson 
Loading FM from cached file: FM3_1.xml
Loaded 313 fault sections.
Built 2606 subsections
Writing sections to fm3_1_sub_sects.geojson
```

### Build a Rupture Set

Next, you can build a [Rupture Set](doc/glossary.md#rupture-set) using those subsections with the [Rupture Set Builder Tool](doc/rup_set_builder.md). This tool has a number of options and various [multifault rupture](doc/glossary.md#multifault-rupture) plausibility models, but the basic usage is as follows to build a [simple azimuthal](doc/rup_set_builder.md#simple-azimuthal) rupture set from the S.SAF demo subsections:

```
opensha-fault-sys-tools$ fst_rup_set_builder.sh --sub-sections data/u3_ssaf_sub_sects.geojson --preset SIMPLE_AZIMUTHAL --scale MEAN_UCERF3 --output-file u3_ssaf_simple_rup_set.zip 
Rupture plausibility preset: SIMPLE_AZIMUTHAL
Loaded 88 sub-sections
Scaling relationship: Mean UCERF3 Scaling Relationship
Initializing connections w/ 32 threads...
Building ruptures with 32 threads...
Waiting on 10 cluster build futures
New largest rup has 10 subsections with 0 jumps and 0 splays.
	67 total unique passing ruptures found, longest has 10 subsections.	Clusters: 10 running (16 futures), 0 completed, 10 total. 	Rate: 3,526 rups/s (3,526 rups/s over last 0.0s)
New largest rup has 20 subsections with 2 jumps and 0 splays.
	272 total unique passing ruptures found, longest has 20 subsections.	Clusters: 10 running (59 futures), 0 completed, 10 total. 	Rate: 5,551 rups/s (6,833 rups/s over last 0.0s)
New largest rup has 30 subsections with 3 jumps and 0 splays.
	806 total unique passing ruptures found, longest has 30 subsections.	Clusters: 10 running (111 futures), 0 completed, 10 total. 	Rate: 11,514 rups/s (25,429 rups/s over last 0.0s)
	1,000 total unique passing ruptures found, longest has 34 subsections.	Clusters: 10 running (118 futures), 0 completed, 10 total. 	Rate: 12,658 rups/s (21,556 rups/s over last 0.0s)
New largest rup has 40 subsections with 4 jumps and 0 splays.
	1,196 total unique passing ruptures found, longest has 40 subsections.	Clusters: 10 running (122 futures), 0 completed, 10 total. 	Rate: 13,907 rups/s (28,000 rups/s over last 0.0s)
New largest rup has 50 subsections with 6 jumps and 0 splays.
	1,377 total unique passing ruptures found, longest has 50 subsections.	Clusters: 10 running (121 futures), 0 completed, 10 total. 	Rate: 15,132 rups/s (36,200 rups/s over last 0.0s)
New largest rup has 60 subsections with 7 jumps and 0 splays.
	1,598 total unique passing ruptures found, longest has 60 subsections.	Clusters: 10 running (118 futures), 0 completed, 10 total. 	Rate: 16,306 rups/s (31,571 rups/s over last 0.0s)
New largest rup has 70 subsections with 8 jumps and 0 splays.
	1,870 total unique passing ruptures found, longest has 70 subsections.	Clusters: 10 running (107 futures), 0 completed, 10 total. 	Rate: 17,642 rups/s (34,000 rups/s over last 0.0s)
	2,000 total unique passing ruptures found, longest has 73 subsections.	Clusters: 10 running (101 futures), 0 completed, 10 total. 	Rate: 18,182 rups/s (32,500 rups/s over last 0.0s)
New largest rup has 80 subsections with 9 jumps and 0 splays.
	2,242 total unique passing ruptures found, longest has 80 subsections.	Clusters: 10 running (92 futures), 0 completed, 10 total. 	Rate: 18,840 rups/s (26,889 rups/s over last 0.0s)
	3,000 total unique passing ruptures found, longest has 85 subsections.	Clusters: 4 running (37 futures), 6 completed, 10 total. 	Rate: 18,182 rups/s (16,478 rups/s over last 0.0s)
Merged in 870 ruptures after processing start cluster 1/10 (id=295): San Andreas (Coachella) rev (870 new, 870 incl. possible duplicates).
	3,081 total unique passing ruptures found, longest has 88 subsections.	Clusters: 0 running (0 futures), 10 completed, 10 total. 	Rate: 15,719 rups/s (2,613 rups/s over last 0.0s)
Merged in 1,311 ruptures after processing start cluster 2/10 (id=284): San Andreas (San Gorgonio Pass-Garnet HIll) (441 new, 441 incl. possible duplicates).
Merged in 1,650 ruptures after processing start cluster 3/10 (id=283): San Andreas (San Bernardino S) (339 new, 339 incl. possible duplicates).
Merged in 1,905 ruptures after processing start cluster 4/10 (id=282): San Andreas (San Bernardino N) (255 new, 255 incl. possible duplicates).
Merged in 2,486 ruptures after processing start cluster 5/10 (id=301): San Andreas (Mojave S) (581 new, 581 incl. possible duplicates).
Merged in 2,616 ruptures after processing start cluster 6/10 (id=286): San Andreas (Mojave N) (130 new, 130 incl. possible duplicates).
Merged in 2,781 ruptures after processing start cluster 7/10 (id=287): San Andreas (Big Bend) (165 new, 165 incl. possible duplicates).
Merged in 2,928 ruptures after processing start cluster 8/10 (id=300): San Andreas (Carrizo) rev (147 new, 147 incl. possible duplicates).
Merged in 3,053 ruptures after processing start cluster 9/10 (id=285): San Andreas (Cholame) rev (125 new, 125 incl. possible duplicates).
Merged in 3,081 ruptures after processing start cluster 10/10 (id=32): San Andreas (Parkfield) (28 new, 28 incl. possible duplicates).
Built 3,081 ruptures in 0.20 secs = 0.00 mins. Total rate: 15,328 rups/s
...
------------ WRITING ARCHIVE ------------
Temporary archive: /data/kevin/git/opensha-fault-sys-tools/u3_ssaf_simple_rup_set.zip.tmp
Writing 1 modules
	Writing module: Rupture Set
...
Moving to /data/kevin/git/opensha-fault-sys-tools/u3_ssaf_simple_rup_set.zip
---------- END WRITING ARCHIVE ----------
```

### Build a Rupture Set Report

Once you have a [Rupture Set](doc/glossary.md#rupture-set), you can build a report with lots of different plots and diagnostic information with the [Rupture Set/Solution Report Builder Tool](doc/report_builder.md). The basic usage is as follows:

```
opensha-fault-sys-tools$ fst_report_builder.sh --input-file data/u3_ssaf_simple_rup_set.zip --output-dir report
```

You can [view an example report here](examples/rup_set_report).

### Invert for a Solution

Now it's time to solve for the rate of each rupture in a Rupture Set with the [Inversion Runner Tool](doc/inversion_runner.md). This is done with the UCERF3 [Simulated Annealing](glossary.md#simulated-annealing) algorithm, and requires at least one data constraint. Various constraint options exist, e.g., MFD and slip rate constraints. Here is an example command to run a quick (2 minute) inversion constrained to match the slip rates on the S.SAF example rupture set:

```
opensha-fault-sys-tools$ fst_inversion_runner.sh --rupture-set data/u3_ssaf_simple_rup_set.zip --output-file data/u3_ssaf_simple_sol.zip --slip-constraint --completion 2m
------------ LOADING ARCHIVE ------------
Archive: data/u3_ssaf_simple_rup_set.zip
...
---------- END LOADING ARCHIVE ----------
Generating inversion inputs with 3081 ruptures and 1 constraints
Building empty intial solution (all zeroes)
Calculating constraint row counts
	SlipRate: [0..88), 88 rows (took 0 ms)
Took 7 ms to get row counts
Building A matrix with 88 rows and 3081 columns
Encoding matrices
	Encoding Slip Rate, ineq=false
		DONE, took 51 ms to encode 95685 values (density: 35.3 %)
DONE encoding, took 59 ms to encode 95685 values (density: 35.3 %)
Took 75 ms to generate inputs
Computing variable perturbation basis:
	Inferring target GR from slip rates
Inferring target G-R
Perturbation-basis range: [1.2706653E-6, 0.07460762]
Annealing!
Threaded Simulated Annealing starting with 32 threads, TimeCompletionCriteria(milis: 120000 = 120.0 seconds), SUB: TimeCompletionCriteria(milis: 1000 = 1.0 seconds)
Threaded total round 1 DONE after 1 secs, 2,512,720 total iterations (2,490,307 /sec).	2,309/3,081 = 74.94% non-zero rates.
Best energy after 1,949,173 total perturbations:
	Total:	1.8534018E-5	Equality:	1.8534018E-5	Entropy:	0.0
	Inequality:	0.0	SlipRate:	1.8534018E-5
Threaded total round 2 DONE after 2 secs, 5,864,866 total iterations (2,909,160 /sec).	2,345/3,081 = 76.11% non-zero rates.
Best energy after 4,436,692 total perturbations:
	Total:	9.632446E-6 (-48.03%)	Equality:	9.632446E-6 (-48.03%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	9.632446E-6 (-48.03%)
Threaded total round 3 DONE after 3 secs, 9,802,925 total iterations (3,247,077 /sec).	2,338/3,081 = 75.88% non-zero rates.
Best energy after 7,440,634 total perturbations:
	Total:	5.701911E-6 (-40.81%)	Equality:	5.701911E-6 (-40.81%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	5.701911E-6 (-40.81%)
...
Threaded total round 120 DONE after 2 mins 0.1 secs, 466,913,800 total iterations (3,887,482 /sec).	2,324/3,081 = 75.43% non-zero rates.
Best energy after 245,766,967 total perturbations:
	Total:	1.1790262E-7 (-0.23%)	Equality:	1.1790262E-7 (-0.23%)	Entropy:	0.0 (NaN)
	Inequality:	0.0 (NaN)	SlipRate:	1.1790262E-7 (-0.23%)
Threaded annealing schedule completed.
Done with Inversion after 2 mins 0.1 secs.
Rounds: 120
Total Iterations: 466913800
Total Perturbations: 245766967
Best energy:
	Total:	1.1790262E-7	Equality:	1.1790262E-7	Entropy:	0.0
	Inequality:	0.0	SlipRate:	1.1790262E-7
DONE. Building solution...
```

### Build a Solution Report

Once you have a [Solution](doc/glossary.md#solution), you can build a report with lots of different plots and diagnostic information with the same [Rupture Set/Solution Report Builder Tool](doc/report_builder.md):

```
opensha-fault-sys-tools$ fst_report_builder.sh --input-file data/u3_ssaf_simple_solution.zip --output-dir report
```

You can [view an example report here](examples/sol_report).

### Compute and Disaggregate Hazard

You can compute and disaggregate hazard curves and spectra at individual sites with the [Hazard Calculation Tool](doc/hazard_calculator.md). You can also compute hazard maps with the [Hazard Map Calculation Tool](doc/hazard_map_calculator.md).

