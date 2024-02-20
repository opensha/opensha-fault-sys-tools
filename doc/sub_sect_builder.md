# Subsection Builder Tool

USAGE: `fst_sub_sect_builder.sh --input-file </path/to/faults.geojson> --output-file </path/to/subsections.geojson>`

This command line tool allows a user to convert a [fault model](glossary.md#fault-model) to a set of [subsections](glossary.md#fault-subsection), to be used when building a [rupture set](glossary.md#rupture-set).

## Command Line Arguments

| Argument | Default Value | Description | Example |
|---|---|---|---|
| `-if/--input-file` | **REQUIRED** | Path to a file containing fault sections. This should either be a GeoJSON file, or a legacy OpenSHA fault sections XML file. See https://opensha.org/Geospatial-File-Formats for more information. | `--input-file faults.geojson` |
| `-of/--output-file` | **REQUIRED** | Path to output GeoJSON file where subsections should be written. | `--output-file subsections.geojson` |
| `-dm/--deformation-model` | _(disabled)_ | Deformation Model, used to in conjunction with --fault-model to override properties including slip rates (and often rakes) in accordance with the chosen deformation model. | `--fault-model FM3_1` |
| `-ddf/--down-dip-fract` | `0.5` | Fault sections are divided into equal length subsections; those lengths are determined as a function of the down-dip width of the fault. | `--down-dip-fract 0.5` |
| `-fl/--fixed-length` | _(disabled)_ | Fault sections are divided into equal length subsections; those lengths are usually determined as a function of the down-dip width of the fault (see --down-dip-fraction), but can instead be of a fixed length through this option. If supplied, each subsection will be no longer than the given length (in kilometers). | `--fixed-length 10` |
| `-fm/--fault-model` | _(disabled)_ | Fault Model, used to fetch fault sections as an alternative to --input-file. Must supply a model flag, e.g. --ucerf3 or --nshm23. | `--fault-model FM3_1` |
| `-mpf/--min-per-fault` | `2` | Minimum number of subsections per fault, regaurdless of fault length. | `--min-per-fault 2` |
| `--nshm23` | _(N/A)_ | Flag to enable NSHM23 fault and deformation models via --fault-model and --deformation-model, as well as the --apply-std-dev-defaults option to apply NSHM23 uncertainty limits and defaults to externally supplied fault sections. | `--nshm23` |
| `--ucerf3` | _(N/A)_ | Flag to enable UCERF3 fault and deformation models via --fault-model and --deformation-model. | `--ucerf3` |

Note that individual models might have their own options. To see extra arguments for a specific model, supply that model flag along with the `--help` argument. Doing this will also list available fault and deformation models for that model.

## Example Inputs and Outputs

This example takes the 10 UCERF3 Southern San Andreas fault sections (located in [data/u3_ssaf_sects.geojson](../data/u3_ssaf_sects.geojson)) and divides them 88 sub-sections:

Here is the (abridged) [input file](../data/u3_ssaf_sects.geojson):

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 295,
      "properties": {
        "FaultID": 295,
        "FaultName": "San Andreas (Coachella) rev",
        "DipDeg": 90.0,
        "Rake": 180.0,
        "LowDepth": 11.100000381469727,
        "UpDepth": 0.0,
        "AseismicSlipFactor": 0.10000000149011612,
        "CouplingCoeff": 1.0,
        "SlipRate": 20.0,
        "SlipRateStdDev": 0.0
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -116.24629,
            33.78825
          ],
          [
            -115.71192,
            33.35009000000001
          ]
        ]
      }
    },
...
    {
      "type": "Feature",
      "id": 32,
      "properties": {
        "FaultID": 32,
        "FaultName": "San Andreas (Parkfield)",
        "DipDeg": 90.0,
        "Rake": 180.0,
        "LowDepth": 10.199999809265137,
        "UpDepth": 0.0,
        "DipDir": 49.939537,
        "AseismicSlipFactor": 0.7900000214576721,
        "CouplingCoeff": 1.0,
        "SlipRate": 35.0,
        "SlipRateStdDev": 0.0
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -120.300046,
            35.751982
          ],
          [
            -120.56089000000001,
            36.002647
          ]
        ]
      }
    }
  ]
}
```

We can divide that into subsections with the following command:

```
fst_sub_sect_builder.sh --input-file /path/to/opensha-fault-sys-tools/data/u3_ssaf_sects.geojson --output-file u3_ssaf_sub_sects.geojson
```

That command will generate [this output file](data/u3_ssaf_sub_sects.geojson) with 88 subsections. Here is the (abridged) output format:

```json

  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 0,
      "properties": {
        "DipDeg": 90.0,
        "Rake": 180.0,
        "LowDepth": 11.100000381469727,
        "UpDepth": 0.0,
        "AseismicSlipFactor": 0.10000000149011612,
        "CouplingCoeff": 1.0,
        "SlipRate": 20.0,
        "SlipRateStdDev": 0.0,
        "DipDir": 224.39233,
        "FaultName": "San Andreas (Coachella) rev, Subsection 0",
        "FaultID": 0,
        "ParentID": 295,
        "ParentName": "San Andreas (Coachella) rev"
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -116.24629,
            33.78825
          ],
          [
            -116.20499146741484,
            33.75462721314246
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "id": 1,
      "properties": {
        "DipDeg": 90.0,
        "Rake": 180.0,
        "LowDepth": 11.100000381469727,
        "UpDepth": 0.0,
        "AseismicSlipFactor": 0.10000000149011612,
        "CouplingCoeff": 1.0,
        "SlipRate": 20.0,
        "SlipRateStdDev": 0.0,
        "DipDir": 224.39233,
        "FaultName": "San Andreas (Coachella) rev, Subsection 1",
        "FaultID": 1,
        "ParentID": 295,
        "ParentName": "San Andreas (Coachella) rev"
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -116.20499146741484,
            33.75462721314246
          ],
          [
            -116.16372532122625,
            33.7209906852224
          ]
        ]
      }
    },
...
  }
}
```
