# Rupture Set Report: segmented_rup_set

| **Num Ruptures** | 154 |
|-----|-----|
| **Num Single-Stranded Ruptures** | 154 (100.00%) |
| **Deformation Model Total Moment Rate** | 1.13042508E18 N-m/yr |
| **Magnitude Range** | [5.91,7.21] |
| **Length Range** | [5.26,65.77] km |
| **Rupture Section Count Range** | [1,8] |

## Table Of Contents
* [Plausibility Configuration](#plausibility-configuration)
  * [Connection Strategy](#connection-strategy)
  * [Splays](#splays)
  * [Plausibility Filters](#plausibility-filters)
* [Rupture Scalar Histograms](#rupture-scalar-histograms)
  * [Rupture Length](#rupture-length)
  * [Rupture Magnitude](#rupture-magnitude)
  * [Subsection Count](#subsection-count)
  * [Cluster Count](#cluster-count)
  * [Area](#area)
  * [Maximum Jump Dist](#maximum-jump-dist)
  * [Cumulative Jump Dist](#cumulative-jump-dist)
  * [Ideal Length Ratio](#ideal-length-ratio)
  * [Ideal Length Difference](#ideal-length-difference)
  * [Rake](#rake)
  * [Cumulative Rake Change](#cumulative-rake-change)
  * [Mechanism Change](#mechanism-change)
  * [Cumulative Azimuth Change](#cumulative-azimuth-change)
  * [Biasi & Wesnousky (2016,2017) Prob](#biasi--wesnousky-20162017-prob)
  * [Max Slip Rate Difference](#max-slip-rate-difference)
* [Fault Section Connections](#fault-section-connections)
* [Jump Counts Over Distance](#jump-counts-over-distance)
  * [Supra-seismogenic Jump Counts](#supra-seismogenic-jump-counts)
  * [M&ge;7 Jump Counts](#m7-jump-counts)
* [Subsection Maximum Values](#subsection-maximum-values)
  * [Subsection Maximum Rupture Length](#subsection-maximum-rupture-length)
  * [Subsection Maximum Rupture Magnitude](#subsection-maximum-rupture-magnitude)
  * [Subsection Maximum Cumulative Jump Dist](#subsection-maximum-cumulative-jump-dist)
  * [Subsection Maximum Cumulative Rake Change](#subsection-maximum-cumulative-rake-change)
  * [Subsection Maximum Cumulative Azimuth Change](#subsection-maximum-cumulative-azimuth-change)
## Plausibility Configuration
_[(top)](#table-of-contents)_

### Connection Strategy
_[(top)](#table-of-contents)_

|   | segmented_rup_set |
|-----|-----|
| **Name** | No Connectivity |
| **Max Jump Dist** | 0 km |
| **Possible parent-section connections** | Total: 0, Avg: 0.00, Range: [0,0] |
| **Actual connections (after applying filters)** | Total: 0, Avg: NaN, Range: [2147483647,-2147483648] |

### Splays
_[(top)](#table-of-contents)_

|   | segmented_rup_set |
|-----|-----|
| **Max Allowed Splays** | 0 |

### Plausibility Filters
_[(top)](#table-of-contents)_

| segmented_rup_set |
|-----|
| No Jumps |

## Rupture Scalar Histograms
_[(top)](#table-of-contents)_

### Rupture Length
_[(top)](#table-of-contents)_

Total length (km) of the rupture, not including jumps or gaps.

| ![hist](resources/hist_LENGTH.png) |
|-----|
| ![hist](resources/hist_LENGTH_cumulative.png) |

#### Rupture Length Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Rupture Length

| **Minimum: 5.26** | **p50: 16.44** | **p90: 36.77** | **p95: 42.9** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_82.png" />](resources/../hist_rup_pages/hist_rup_82.html) | [<img src="resources/hist_rup_96.png" />](resources/../hist_rup_pages/hist_rup_96.html) | [<img src="resources/hist_rup_90.png" />](resources/../hist_rup_pages/hist_rup_90.html) |
| **p97.5: 49.33** | **p99: 57.55** | **p99.9: 65.77** | **Maximum: 65.77** |
| [<img src="resources/hist_rup_61.png" />](resources/../hist_rup_pages/hist_rup_61.html) | [<img src="resources/hist_rup_54.png" />](resources/../hist_rup_pages/hist_rup_54.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) |

### Rupture Magnitude
_[(top)](#table-of-contents)_

Magnitude of the rupture.

| ![hist](resources/hist_MAG.png) |
|-----|
| ![hist](resources/hist_MAG_cumulative.png) |

#### Rupture Magnitude Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Rupture Magnitude

| **Minimum: 5.91** | **p50: 6.47** | **p90: 6.85** | **p95: 6.97** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_86.png" />](resources/../hist_rup_pages/hist_rup_86.html) | [<img src="resources/hist_rup_72.png" />](resources/../hist_rup_pages/hist_rup_72.html) | [<img src="resources/hist_rup_67.png" />](resources/../hist_rup_pages/hist_rup_67.html) |
| **p97.5: 7.06** | **p99: 7.14** | **p99.9: 7.21** | **Maximum: 7.21** |
| [<img src="resources/hist_rup_61.png" />](resources/../hist_rup_pages/hist_rup_61.html) | [<img src="resources/hist_rup_54.png" />](resources/../hist_rup_pages/hist_rup_54.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) |

### Subsection Count
_[(top)](#table-of-contents)_

Total number of subsections involved in a rupture.

| ![hist](resources/hist_SECT_COUNT.png) |
|-----|
| ![hist](resources/hist_SECT_COUNT_cumulative.png) |

#### Subsection Count Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Subsection Count

| **Minimum: 1** | **p50: 2** | **p90: 5** | **p95: 6** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_134.png" />](resources/../hist_rup_pages/hist_rup_134.html) | [<img src="resources/hist_rup_88.png" />](resources/../hist_rup_pages/hist_rup_88.html) | [<img src="resources/hist_rup_61.png" />](resources/../hist_rup_pages/hist_rup_61.html) |
| **p97.5: 7** | **p99: 7** | **p99.9: 8** | **Maximum: 8** |
| [<img src="resources/hist_rup_54.png" />](resources/../hist_rup_pages/hist_rup_54.html) | [<img src="resources/hist_rup_90.png" />](resources/../hist_rup_pages/hist_rup_90.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) |

### Cluster Count
_[(top)](#table-of-contents)_

Total number of clusters (of contiguous subsections on the same parent fault section) a rupture.

| ![hist](resources/hist_CLUSTER_COUNT.png) |
|-----|
| ![hist](resources/hist_CLUSTER_COUNT_cumulative.png) |

#### Cluster Count Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cluster Count

| **Minimum: 1** | **p50: 1** | **p90: 1** | **p95: 1** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_146.png" />](resources/../hist_rup_pages/hist_rup_146.html) |
| **p97.5: 1** | **p99: 1** | **p99.9: 1** | **Maximum: 1** |
| [<img src="resources/hist_rup_150.png" />](resources/../hist_rup_pages/hist_rup_150.html) | [<img src="resources/hist_rup_152.png" />](resources/../hist_rup_pages/hist_rup_152.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) |

### Area
_[(top)](#table-of-contents)_

Total area of the rupture (km^2).

| ![hist](resources/hist_AREA.png) |
|-----|
| ![hist](resources/hist_AREA_cumulative.png) |

#### Area Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Area

| **Minimum: 68.9** | **p50: 240.83** | **p90: 552.5** | **p95: 690.62** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_86.png" />](resources/../hist_rup_pages/hist_rup_86.html) | [<img src="resources/hist_rup_72.png" />](resources/../hist_rup_pages/hist_rup_72.html) | [<img src="resources/hist_rup_67.png" />](resources/../hist_rup_pages/hist_rup_67.html) |
| **p97.5: 828.75** | **p99: 966.87** | **p99.9: 1105** | **Maximum: 1105** |
| [<img src="resources/hist_rup_61.png" />](resources/../hist_rup_pages/hist_rup_61.html) | [<img src="resources/hist_rup_54.png" />](resources/../hist_rup_pages/hist_rup_54.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) |

### Maximum Jump Dist
_[(top)](#table-of-contents)_

The maximum jump distance in the rupture.

### Cumulative Jump Dist
_[(top)](#table-of-contents)_

The total cumulative jump distance summed over all jumps in the rupture.

| ![hist](resources/hist_CUM_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_CUM_JUMP_DIST_cumulative.png) |

#### Cumulative Jump Dist Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cumulative Jump Dist

| **Minimum: 0.0** | **p50: 0.0** | **p90: 0.0** | **p95: 0.0** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_146.png" />](resources/../hist_rup_pages/hist_rup_146.html) |
| **p97.5: 0.0** | **p99: 0.0** | **p99.9: 0.0** | **Maximum: 0.0** |
| [<img src="resources/hist_rup_150.png" />](resources/../hist_rup_pages/hist_rup_150.html) | [<img src="resources/hist_rup_152.png" />](resources/../hist_rup_pages/hist_rup_152.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) |

### Ideal Length Ratio
_[(top)](#table-of-contents)_

The ratio between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_RATIO.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_RATIO_cumulative.png) |

#### Ideal Length Ratio Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Ideal Length Ratio

| **Minimum: 1** | **p50: 1** | **p90: 1.01** | **p95: 1.02** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_150.png" />](resources/../hist_rup_pages/hist_rup_150.html) | [<img src="resources/hist_rup_112.png" />](resources/../hist_rup_pages/hist_rup_112.html) | [<img src="resources/hist_rup_65.png" />](resources/../hist_rup_pages/hist_rup_65.html) | [<img src="resources/hist_rup_43.png" />](resources/../hist_rup_pages/hist_rup_43.html) |
| **p97.5: 1.03** | **p99: 1.04** | **p99.9: 1.04** | **Maximum: 1.04** |
| [<img src="resources/hist_rup_41.png" />](resources/../hist_rup_pages/hist_rup_41.html) | [<img src="resources/hist_rup_44.png" />](resources/../hist_rup_pages/hist_rup_44.html) | [<img src="resources/hist_rup_46.png" />](resources/../hist_rup_pages/hist_rup_46.html) | [<img src="resources/hist_rup_46.png" />](resources/../hist_rup_pages/hist_rup_46.html) |

### Ideal Length Difference
_[(top)](#table-of-contents)_

The difference between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_DIFF.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_DIFF_cumulative.png) |

#### Ideal Length Difference Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Ideal Length Difference

| **Minimum: -9.944996E-6** | **p50: 0.016373262** | **p90: 0.4** | **p95: 0.54** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_150.png" />](resources/../hist_rup_pages/hist_rup_150.html) | [<img src="resources/hist_rup_101.png" />](resources/../hist_rup_pages/hist_rup_101.html) | [<img src="resources/hist_rup_40.png" />](resources/../hist_rup_pages/hist_rup_40.html) | [<img src="resources/hist_rup_31.png" />](resources/../hist_rup_pages/hist_rup_31.html) |
| **p97.5: 0.7** | **p99: 0.76** | **p99.9: 0.82** | **Maximum: 0.82** |
| [<img src="resources/hist_rup_62.png" />](resources/../hist_rup_pages/hist_rup_62.html) | [<img src="resources/hist_rup_37.png" />](resources/../hist_rup_pages/hist_rup_37.html) | [<img src="resources/hist_rup_32.png" />](resources/../hist_rup_pages/hist_rup_32.html) | [<img src="resources/hist_rup_32.png" />](resources/../hist_rup_pages/hist_rup_32.html) |

### Rake
_[(top)](#table-of-contents)_

The area-averaged rake for this rupture.

| ![hist](resources/hist_RAKE.png) |
|-----|
| ![hist](resources/hist_RAKE_cumulative.png) |

### Cumulative Rake Change
_[(top)](#table-of-contents)_

Cumulative rake change for this rupture.

### Mechanism Change
_[(top)](#table-of-contents)_

The number of times a rupture changed mechanisms, e.g., from right-lateral SS to left-lateral or SS to reverse.

| ![hist](resources/hist_MECH_CHANGE.png) |
|-----|
| ![hist](resources/hist_MECH_CHANGE_cumulative.png) |

#### Mechanism Change Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Mechanism Change

| **Minimum: 0.0** | **p50: 0.0** | **p90: 0.0** | **p95: 0.0** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_146.png" />](resources/../hist_rup_pages/hist_rup_146.html) |
| **p97.5: 0.0** | **p99: 0.0** | **p99.9: 0.0** | **Maximum: 0.0** |
| [<img src="resources/hist_rup_150.png" />](resources/../hist_rup_pages/hist_rup_150.html) | [<img src="resources/hist_rup_152.png" />](resources/../hist_rup_pages/hist_rup_152.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) |

### Cumulative Azimuth Change
_[(top)](#table-of-contents)_

Cumulative azimuth change for this rupture.

| ![hist](resources/hist_CUM_AZ_CHANGE.png) |
|-----|
| ![hist](resources/hist_CUM_AZ_CHANGE_cumulative.png) |

#### Cumulative Azimuth Change Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cumulative Azimuth Change

| **Minimum: 0.0** | **p50: 0.0** | **p90: 20.6** | **p95: 28.45** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_147.png" />](resources/../hist_rup_pages/hist_rup_147.html) | [<img src="resources/hist_rup_73.png" />](resources/../hist_rup_pages/hist_rup_73.html) | [<img src="resources/hist_rup_116.png" />](resources/../hist_rup_pages/hist_rup_116.html) |
| **p97.5: 41.1** | **p99: 45.52** | **p99.9: 48.73** | **Maximum: 48.73** |
| [<img src="resources/hist_rup_41.png" />](resources/../hist_rup_pages/hist_rup_41.html) | [<img src="resources/hist_rup_55.png" />](resources/../hist_rup_pages/hist_rup_55.html) | [<img src="resources/hist_rup_32.png" />](resources/../hist_rup_pages/hist_rup_32.html) | [<img src="resources/hist_rup_32.png" />](resources/../hist_rup_pages/hist_rup_32.html) |

### Biasi & Wesnousky (2016,2017) Prob
_[(top)](#table-of-contents)_

Biasi & Wesnousky (2016,2017) conditional probability of passing through each jump.

| ![hist](resources/hist_BW_PROB.png) |
|-----|
| ![hist](resources/hist_BW_PROB_cumulative.png) |

#### Biasi & Wesnousky (2016,2017) Prob Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Biasi & Wesnousky (2016,2017) Prob

| **Maximum: 1** | **p50: 1** | **p10: 1** | **p5: 1** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) | [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_15.png" />](resources/../hist_rup_pages/hist_rup_15.html) | [<img src="resources/hist_rup_7.png" />](resources/../hist_rup_pages/hist_rup_7.html) |
| **p2.5: 1** | **p1: 1** | **p0.1: 1** | **Minimum: 1** |
| [<img src="resources/hist_rup_3.png" />](resources/../hist_rup_pages/hist_rup_3.html) | [<img src="resources/hist_rup_1.png" />](resources/../hist_rup_pages/hist_rup_1.html) | [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) |

### Max Slip Rate Difference
_[(top)](#table-of-contents)_

The difference between the slip rate with the highest and lowest slip rate in the rupture.

| ![hist](resources/hist_MAX_SLIP_DIFF.png) |
|-----|
| ![hist](resources/hist_MAX_SLIP_DIFF_cumulative.png) |

#### Max Slip Rate Difference Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Max Slip Rate Difference

| **Minimum: 0.0** | **p50: 0.0** | **p90: 0.0** | **p95: 0.0** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_138.png" />](resources/../hist_rup_pages/hist_rup_138.html) | [<img src="resources/hist_rup_146.png" />](resources/../hist_rup_pages/hist_rup_146.html) |
| **p97.5: 0.0** | **p99: 0.0** | **p99.9: 0.0** | **Maximum: 0.0** |
| [<img src="resources/hist_rup_150.png" />](resources/../hist_rup_pages/hist_rup_150.html) | [<img src="resources/hist_rup_152.png" />](resources/../hist_rup_pages/hist_rup_152.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) | [<img src="resources/hist_rup_153.png" />](resources/../hist_rup_pages/hist_rup_153.html) |


## Fault Section Connections
_[(top)](#table-of-contents)_

| ![plot](resources/sect_connectivity.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_connectivity.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_connectivity.geojson) | *N/A* |
| ![plot](resources/sect_connectivity_hist.png) |


## Jump Counts Over Distance
_[(top)](#table-of-contents)_

### Supra-seismogenic Jump Counts
_[(top)](#table-of-contents)_

| ![Plausibility Filter](resources/jumps_0.1km_counts.png) |
|-----|
| ![Plausibility Filter](resources/jumps_1.0km_counts.png) |
| ![Plausibility Filter](resources/jumps_3.0km_counts.png) |

### M&ge;7 Jump Counts
_[(top)](#table-of-contents)_

| ![Plausibility Filter](resources/jumps_0.1km_m7_counts.png) |
|-----|
| ![Plausibility Filter](resources/jumps_1.0km_m7_counts.png) |
| ![Plausibility Filter](resources/jumps_3.0km_m7_counts.png) |


## Subsection Maximum Values
_[(top)](#table-of-contents)_

These plots show the maximum value of various quantities across all ruptures for which each individual subsection participates. This is useful, for example, to find sections with low maximum magnitudes (due to low or no connectivity).

### Subsection Maximum Rupture Length
_[(top)](#table-of-contents)_

| ![map](resources/sect_max_LENGTH.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_max_LENGTH.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_max_LENGTH.geojson) |
| ![map](resources/sect_max_LENGTH_hist.png) |

### Subsection Maximum Rupture Magnitude
_[(top)](#table-of-contents)_

| ![map](resources/sect_max_MAG.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_max_MAG.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_max_MAG.geojson) |
| ![map](resources/sect_max_MAG_hist.png) |

### Subsection Maximum Cumulative Jump Dist
_[(top)](#table-of-contents)_

| ![map](resources/sect_max_CUM_JUMP_DIST.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_max_CUM_JUMP_DIST.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_max_CUM_JUMP_DIST.geojson) |
| ![map](resources/sect_max_CUM_JUMP_DIST_hist.png) |

### Subsection Maximum Cumulative Rake Change
_[(top)](#table-of-contents)_

### Subsection Maximum Cumulative Azimuth Change
_[(top)](#table-of-contents)_

| ![map](resources/sect_max_CUM_AZ_CHANGE.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_max_CUM_AZ_CHANGE.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_max_CUM_AZ_CHANGE.geojson) |
| ![map](resources/sect_max_CUM_AZ_CHANGE_hist.png) |


