# Rupture Set Building Tutorial

We are giong to build a rupture set using the example San Jacinto Fault geometry file located in [data/san_jacinto.geojson](../../data/san_jacinto.geojson).

First, navigate to this directory (`opensha-fault-sys-tools/tutorial/rupture_sets`) in a terminal. These commands place all data files the `user_output` subdirectory, example outputs can be found in the `example_output` subdirectory.

## Building Sub-Sections

First, we will convert the fault sections, stored as [GeoJSON](https://opensha.org/Geospatial-File-Formats), to smaller subsections using the [Subsection Builder Tool](../../doc/sub_sect_builder.md):

```
fst_sub_sect_builder.sh --input-file ../../data/san_jacinto.geojson --output-file user_output/san_jacinto_sub_sections.geojson
```

This broke the 9 San Jacinto fault sections into 46 approximately equal-length subsections. You can veiw an example output of that [command here](example_output/san_jacinto_sub_sections.geojson).

## Building a Rupture Set

Next, we will build a rupture set using those sub-sections with the [Rupture Set Builder Tool](../../doc/rup_set_builder.md). We will need to use a scaling relationship to determine magnitudes and average slip data for each rupture, here we will use the average model from UCERF3. We then need to choose a multifault rupture plausibility model. The simplest is to enforce strict segmentation, where no fault sections are allowed to co-rupture with any other fault sections. Here is the command to create a fully segmented model:

```
fst_rup_set_builder.sh --sub-sections user_output/san_jacinto_sub_sections.geojson --output-file user_output/segmented_rup_set.zip --scale MEAN_UCERF3 --preset SEGMENTED
```

This built a rupture set with 154 ruptures and a magnitude range of 5.9-7.2. We can create a diagnostic report to view more information about this rupture set with the [Report Builder](../../doc/report_builder.md):

```
fst_report_builder.sh --input-file user_output/segmented_rup_set.zip --output-dir user_output/segmented_report
```

That tool will write out an HTML report that can be openened in a web browser, `user_output/segmented_report/index.html` in our example.

Now, lets build a more complicated multifault rupture ste. We'll use the simple azimuthal model, which has a default maximum jump distance of 5 km and azimuth change of 60 degrees:

```
fst_rup_set_builder.sh --sub-sections user_output/san_jacinto_sub_sections.geojson --output-file user_output/azimuthal_rup_set.zip --scale MEAN_UCERF3 --preset SIMPLE_AZIMUTHAL
```

This built a rupture set with 592 ruptures and a magnitude range of 6.2-7.8. Similarly, lets generate a report:

```
fst_report_builder.sh --input-file user_output/azimuthal_rup_set.zip --output-dir user_output/azimuthal_report
```

These Rupture Set files are just zip files containing simple JSON/CSV files, and can be unzipped and examined/modified by hand if need be. Details on the file format [can be found here](https://opensha.org/Modular-Fault-System-Solution).

