# Rupture Set Report: azimuthal_rup_set

| **Num Ruptures** | 592 |
|-----|-----|
| **Num Single-Stranded Ruptures** | 592 (100.00%) |
| **Deformation Model Total Moment Rate** | 1.13042508E18 N-m/yr |
| **Magnitude Range** | [6.21,7.77] |
| **Length Range** | [10.52,229.93] km |
| **Rupture Section Count Range** | [2,35] |

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

|   | azimuthal_rup_set |
|-----|-----|
| **Name** | ClosestSectPair: maxDist=5 km |
| **Max Jump Dist** | 5 km |
| **Possible parent-section connections** | Total: 18, Avg: 2.00, Range: [1,3] |
| **Actual connections (after applying filters)** | Total: 8, Avg: 1.78, Range: [1,3] |

### Splays
_[(top)](#table-of-contents)_

|   | azimuthal_rup_set |
|-----|-----|
| **Max Allowed Splays** | 0 |

### Plausibility Filters
_[(top)](#table-of-contents)_

| azimuthal_rup_set |
|-----|
| Cumulative Azimuth ≤560 |
| Cumulative Rake Change ≤180 |
| Jump Azimuth Change Filter |
| Min Sections Per Parent |
| Total Azimuth Change Filter |

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

| **Minimum: 10.52** | **p50: 87.34** | **p90: 176.17** | **p95: 192.84** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_577.png" />](resources/../hist_rup_pages/hist_rup_577.html) | [<img src="resources/hist_rup_133.png" />](resources/../hist_rup_pages/hist_rup_133.html) | [<img src="resources/hist_rup_295.png" />](resources/../hist_rup_pages/hist_rup_295.html) | [<img src="resources/hist_rup_563.png" />](resources/../hist_rup_pages/hist_rup_563.html) |
| **p97.5: 210.38** | **p99: 220.9** | **p99.9: 229.93** | **Maximum: 229.93** |
| [<img src="resources/hist_rup_534.png" />](resources/../hist_rup_pages/hist_rup_534.html) | [<img src="resources/hist_rup_536.png" />](resources/../hist_rup_pages/hist_rup_536.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Rupture Magnitude
_[(top)](#table-of-contents)_

Magnitude of the rupture.

| ![hist](resources/hist_MAG.png) |
|-----|
| ![hist](resources/hist_MAG_cumulative.png) |

#### Rupture Magnitude Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Rupture Magnitude

| **Minimum: 6.21** | **p50: 7.32** | **p90: 7.67** | **p95: 7.71** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_577.png" />](resources/../hist_rup_pages/hist_rup_577.html) | [<img src="resources/hist_rup_39.png" />](resources/../hist_rup_pages/hist_rup_39.html) | [<img src="resources/hist_rup_254.png" />](resources/../hist_rup_pages/hist_rup_254.html) | [<img src="resources/hist_rup_29.png" />](resources/../hist_rup_pages/hist_rup_29.html) |
| **p97.5: 7.73** | **p99: 7.75** | **p99.9: 7.77** | **Maximum: 7.77** |
| [<img src="resources/hist_rup_546.png" />](resources/../hist_rup_pages/hist_rup_546.html) | [<img src="resources/hist_rup_524.png" />](resources/../hist_rup_pages/hist_rup_524.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Subsection Count
_[(top)](#table-of-contents)_

Total number of subsections involved in a rupture.

| ![hist](resources/hist_SECT_COUNT.png) |
|-----|
| ![hist](resources/hist_SECT_COUNT_cumulative.png) |

#### Subsection Count Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Subsection Count

| **Minimum: 2** | **p50: 13** | **p90: 25** | **p95: 29** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_581.png" />](resources/../hist_rup_pages/hist_rup_581.html) | [<img src="resources/hist_rup_335.png" />](resources/../hist_rup_pages/hist_rup_335.html) |
| **p97.5: 32** | **p99: 34** | **p99.9: 35** | **Maximum: 35** |
| [<img src="resources/hist_rup_522.png" />](resources/../hist_rup_pages/hist_rup_522.html) | [<img src="resources/hist_rup_33.png" />](resources/../hist_rup_pages/hist_rup_33.html) | [<img src="resources/hist_rup_525.png" />](resources/../hist_rup_pages/hist_rup_525.html) | [<img src="resources/hist_rup_525.png" />](resources/../hist_rup_pages/hist_rup_525.html) |

### Cluster Count
_[(top)](#table-of-contents)_

Total number of clusters (of contiguous subsections on the same parent fault section) a rupture.

| ![hist](resources/hist_CLUSTER_COUNT.png) |
|-----|
| ![hist](resources/hist_CLUSTER_COUNT_cumulative.png) |

#### Cluster Count Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cluster Count

| **Minimum: 1** | **p50: 3** | **p90: 6** | **p95: 7** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_404.png" />](resources/../hist_rup_pages/hist_rup_404.html) | [<img src="resources/hist_rup_253.png" />](resources/../hist_rup_pages/hist_rup_253.html) | [<img src="resources/hist_rup_29.png" />](resources/../hist_rup_pages/hist_rup_29.html) |
| **p97.5: 7** | **p99: 8** | **p99.9: 8** | **Maximum: 8** |
| [<img src="resources/hist_rup_544.png" />](resources/../hist_rup_pages/hist_rup_544.html) | [<img src="resources/hist_rup_32.png" />](resources/../hist_rup_pages/hist_rup_32.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Area
_[(top)](#table-of-contents)_

Total area of the rupture (km^2).

| ![hist](resources/hist_AREA.png) |
|-----|
| ![hist](resources/hist_AREA_cumulative.png) |

#### Area Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Area

| **Minimum: 137.79** | **p50: 1346.02** | **p90: 2765** | **p95: 3008.08** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_577.png" />](resources/../hist_rup_pages/hist_rup_577.html) | [<img src="resources/hist_rup_143.png" />](resources/../hist_rup_pages/hist_rup_143.html) | [<img src="resources/hist_rup_254.png" />](resources/../hist_rup_pages/hist_rup_254.html) | [<img src="resources/hist_rup_29.png" />](resources/../hist_rup_pages/hist_rup_29.html) |
| **p97.5: 3182.84** | **p99: 3339.79** | **p99.9: 3493.89** | **Maximum: 3493.89** |
| [<img src="resources/hist_rup_546.png" />](resources/../hist_rup_pages/hist_rup_546.html) | [<img src="resources/hist_rup_524.png" />](resources/../hist_rup_pages/hist_rup_524.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Maximum Jump Dist
_[(top)](#table-of-contents)_

The maximum jump distance in the rupture.

| ![hist](resources/hist_MAX_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_MAX_JUMP_DIST_cumulative.png) |

#### Maximum Jump Dist Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Maximum Jump Dist

| **Minimum: 0.0** | **p50: 2.4760012E-12** | **p90: 3.49** | **p95: 3.49** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_262.png" />](resources/../hist_rup_pages/hist_rup_262.html) | [<img src="resources/hist_rup_468.png" />](resources/../hist_rup_pages/hist_rup_468.html) | [<img src="resources/hist_rup_524.png" />](resources/../hist_rup_pages/hist_rup_524.html) |
| **p97.5: 3.49** | **p99: 3.49** | **p99.9: 3.49** | **Maximum: 3.49** |
| [<img src="resources/hist_rup_561.png" />](resources/../hist_rup_pages/hist_rup_561.html) | [<img src="resources/hist_rup_580.png" />](resources/../hist_rup_pages/hist_rup_580.html) | [<img src="resources/hist_rup_588.png" />](resources/../hist_rup_pages/hist_rup_588.html) | [<img src="resources/hist_rup_588.png" />](resources/../hist_rup_pages/hist_rup_588.html) |

### Cumulative Jump Dist
_[(top)](#table-of-contents)_

The total cumulative jump distance summed over all jumps in the rupture.

| ![hist](resources/hist_CUM_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_CUM_JUMP_DIST_cumulative.png) |

#### Cumulative Jump Dist Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cumulative Jump Dist

| **Minimum: 0.0** | **p50: 2.8292956E-12** | **p90: 3.49** | **p95: 3.61** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_397.png" />](resources/../hist_rup_pages/hist_rup_397.html) | [<img src="resources/hist_rup_562.png" />](resources/../hist_rup_pages/hist_rup_562.html) | [<img src="resources/hist_rup_19.png" />](resources/../hist_rup_pages/hist_rup_19.html) |
| **p97.5: 3.61** | **p99: 3.61** | **p99.9: 3.61** | **Maximum: 3.61** |
| [<img src="resources/hist_rup_56.png" />](resources/../hist_rup_pages/hist_rup_56.html) | [<img src="resources/hist_rup_32.png" />](resources/../hist_rup_pages/hist_rup_32.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Ideal Length Ratio
_[(top)](#table-of-contents)_

The ratio between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_RATIO.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_RATIO_cumulative.png) |

#### Ideal Length Ratio Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Ideal Length Ratio

| **Minimum: 1** | **p50: 1.01** | **p90: 1.02** | **p95: 1.02** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_590.png" />](resources/../hist_rup_pages/hist_rup_590.html) | [<img src="resources/hist_rup_313.png" />](resources/../hist_rup_pages/hist_rup_313.html) | [<img src="resources/hist_rup_235.png" />](resources/../hist_rup_pages/hist_rup_235.html) | [<img src="resources/hist_rup_282.png" />](resources/../hist_rup_pages/hist_rup_282.html) |
| **p97.5: 1.03** | **p99: 1.04** | **p99.9: 1.06** | **Maximum: 1.06** |
| [<img src="resources/hist_rup_259.png" />](resources/../hist_rup_pages/hist_rup_259.html) | [<img src="resources/hist_rup_36.png" />](resources/../hist_rup_pages/hist_rup_36.html) | [<img src="resources/hist_rup_2.png" />](resources/../hist_rup_pages/hist_rup_2.html) | [<img src="resources/hist_rup_2.png" />](resources/../hist_rup_pages/hist_rup_2.html) |

### Ideal Length Difference
_[(top)](#table-of-contents)_

The difference between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_DIFF.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_DIFF_cumulative.png) |

#### Ideal Length Difference Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Ideal Length Difference

| **Minimum: -9.944996E-6** | **p50: 0.92** | **p90: 2.43** | **p95: 2.86** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_590.png" />](resources/../hist_rup_pages/hist_rup_590.html) | [<img src="resources/hist_rup_86.png" />](resources/../hist_rup_pages/hist_rup_86.html) | [<img src="resources/hist_rup_588.png" />](resources/../hist_rup_pages/hist_rup_588.html) | [<img src="resources/hist_rup_524.png" />](resources/../hist_rup_pages/hist_rup_524.html) |
| **p97.5: 3.19** | **p99: 4** | **p99.9: 4.4** | **Maximum: 4.4** |
| [<img src="resources/hist_rup_49.png" />](resources/../hist_rup_pages/hist_rup_49.html) | [<img src="resources/hist_rup_31.png" />](resources/../hist_rup_pages/hist_rup_31.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

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

| **Minimum: 0.0** | **p50: 0.0** | **p90: 1** | **p95: 1** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_360.png" />](resources/../hist_rup_pages/hist_rup_360.html) | [<img src="resources/hist_rup_6.png" />](resources/../hist_rup_pages/hist_rup_6.html) | [<img src="resources/hist_rup_37.png" />](resources/../hist_rup_pages/hist_rup_37.html) |
| **p97.5: 1** | **p99: 1** | **p99.9: 1** | **Maximum: 1** |
| [<img src="resources/hist_rup_52.png" />](resources/../hist_rup_pages/hist_rup_52.html) | [<img src="resources/hist_rup_61.png" />](resources/../hist_rup_pages/hist_rup_61.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Cumulative Azimuth Change
_[(top)](#table-of-contents)_

Cumulative azimuth change for this rupture.

| ![hist](resources/hist_CUM_AZ_CHANGE.png) |
|-----|
| ![hist](resources/hist_CUM_AZ_CHANGE_cumulative.png) |

#### Cumulative Azimuth Change Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cumulative Azimuth Change

| **Minimum: 0.0** | **p50: 59.78** | **p90: 155.45** | **p95: 187.55** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_149.png" />](resources/../hist_rup_pages/hist_rup_149.html) | [<img src="resources/hist_rup_317.png" />](resources/../hist_rup_pages/hist_rup_317.html) | [<img src="resources/hist_rup_23.png" />](resources/../hist_rup_pages/hist_rup_23.html) |
| **p97.5: 213.1** | **p99: 261.83** | **p99.9: 271.84** | **Maximum: 271.84** |
| [<img src="resources/hist_rup_58.png" />](resources/../hist_rup_pages/hist_rup_58.html) | [<img src="resources/hist_rup_62.png" />](resources/../hist_rup_pages/hist_rup_62.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |

### Biasi & Wesnousky (2016,2017) Prob
_[(top)](#table-of-contents)_

Biasi & Wesnousky (2016,2017) conditional probability of passing through each jump.

| ![hist](resources/hist_BW_PROB.png) |
|-----|
| ![hist](resources/hist_BW_PROB_cumulative.png) |

#### Biasi & Wesnousky (2016,2017) Prob Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Biasi & Wesnousky (2016,2017) Prob

| **Maximum: 1** | **p50: 0.33** | **p10: 0.03891892** | **p5: 0.0053239716** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_591.png" />](resources/../hist_rup_pages/hist_rup_591.html) | [<img src="resources/hist_rup_84.png" />](resources/../hist_rup_pages/hist_rup_84.html) | [<img src="resources/hist_rup_4.png" />](resources/../hist_rup_pages/hist_rup_4.html) | [<img src="resources/hist_rup_57.png" />](resources/../hist_rup_pages/hist_rup_57.html) |
| **p2.5: 0.0038850603** | **p1: 0.002835044** | **p0.1: 0.002835044** | **Minimum: 0.002835044** |
| [<img src="resources/hist_rup_59.png" />](resources/../hist_rup_pages/hist_rup_59.html) | [<img src="resources/hist_rup_64.png" />](resources/../hist_rup_pages/hist_rup_64.html) | [<img src="resources/hist_rup_30.png" />](resources/../hist_rup_pages/hist_rup_30.html) | [<img src="resources/hist_rup_30.png" />](resources/../hist_rup_pages/hist_rup_30.html) |

### Max Slip Rate Difference
_[(top)](#table-of-contents)_

The difference between the slip rate with the highest and lowest slip rate in the rupture.

| ![hist](resources/hist_MAX_SLIP_DIFF.png) |
|-----|
| ![hist](resources/hist_MAX_SLIP_DIFF_cumulative.png) |

#### Max Slip Rate Difference Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Max Slip Rate Difference

| **Minimum: 0.0** | **p50: 9** | **p90: 10.9** | **p95: 11.5** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_372.png" />](resources/../hist_rup_pages/hist_rup_372.html) | [<img src="resources/hist_rup_5.png" />](resources/../hist_rup_pages/hist_rup_5.html) | [<img src="resources/hist_rup_31.png" />](resources/../hist_rup_pages/hist_rup_31.html) |
| **p97.5: 11.5** | **p99: 11.5** | **p99.9: 11.5** | **Maximum: 11.5** |
| [<img src="resources/hist_rup_52.png" />](resources/../hist_rup_pages/hist_rup_52.html) | [<img src="resources/hist_rup_61.png" />](resources/../hist_rup_pages/hist_rup_61.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |


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


