# Inversion Running Tutorial

We are going to run a fault system inversion for the simple San Jacinto rupture set built in the [rupture set tutorial](../rupture_sets).

First, lets run a simple slip-rate only inversion for 30 seconds (this is a tiny model, so 30 seconds will be plenty):

```
fst_inversion_runner.sh --rupture-set ../rupture_sets/example_output/azimuthal_rup_set.zip --output-file user_output/slip_rate_solution.zip --completion 30s --slip-constraint
```

And then generate a report to look at that solution, this time with the level of detail set to `FULL` in order to get a more detailed report:

```
fst_report_builder.sh --input-file user_output/slip_rate_solution.zip --output-dir user_output/slip_rate_report --plot-level FULL
```

Now, lets add an MFD constraint. The tool can infer a Gutenberg-Richter target MFD from the total moment-rate implied by the slip rates, or you can specify your own target values. Here, we'll use the implied G-R MFD and set run it for a bit longer (it takes longer to converge with more constraints).

```
fst_inversion_runner.sh --rupture-set ../rupture_sets/example_output/azimuthal_rup_set.zip --output-file user_output/slip_rate_inferred_gr_solution.zip --completion 1m --slip-constraint --mfd-constraint --infer-target-gr
```

Then again, generate a report:

```
fst_report_builder.sh --input-file user_output/slip_rate_inferred_gr_solution.zip --output-dir user_output/slip_rate_inferred_gr_report --plot-level FULL
```

A few other constraint options exist, lets try the new segmentation constraint (proposed in Field et al., 2021):

```
fst_inversion_runner.sh --rupture-set ../rupture_sets/example_output/azimuthal_rup_set.zip --output-file user_output/slip_rate_inferred_gr_seg_solution.zip --completion 1m --slip-constraint --mfd-constraint --infer-target-gr --norm-slip-seg-constraint
```

And again, a report:

```
fst_report_builder.sh --input-file user_output/slip_rate_inferred_gr_seg_solution.zip --output-dir user_output/slip_rate_inferred_gr_seg_report --plot-level FULL
```

As with rupture sets, the file format is fairly simple and contains rate information in a CSV file. More information on the file format [can be found here](https://opensha.org/Modular-Fault-System-Solution).

