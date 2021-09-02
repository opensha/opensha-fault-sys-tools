# Rupture Set Report: u3_ssaf_simple_rup_set

| **Num Ruptures** | 3,081 |
|-----|-----|
| **Num Single-Stranded Ruptures** | 3,081 (100.00%) |
| **Magnitude Range** | [5.36,8.06] |
| **Length Range** | [9.11,546.57] km |
| **Rupture Section Count Range** | [2,88] |

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

|   | u3_ssaf_simple_rup_set |
|-----|-----|
| **Name** | ClosestSectPair: maxDist=5 km |
| **Max Jump Dist** | 5 km |
| **Possible parent-section connections** | Total: 18, Avg: 1.80, Range: [1,2] |
| **Actual connections (after applying filters)** | Total: 9, Avg: 1.80, Range: [1,2] |

### Splays
_[(top)](#table-of-contents)_

|   | u3_ssaf_simple_rup_set |
|-----|-----|
| **Max Allowed Splays** | 0 |

### Plausibility Filters
_[(top)](#table-of-contents)_

| u3_ssaf_simple_rup_set |
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

| **Minimum: 9.11** | **p50: 179.59** | **p90: 405.83** | **p95: 455.64** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_3066.png" />](resources/../hist_rup_pages/hist_rup_3066.html) | [<img src="resources/hist_rup_2354.png" />](resources/../hist_rup_pages/hist_rup_2354.html) | [<img src="resources/hist_rup_62.png" />](resources/../hist_rup_pages/hist_rup_62.html) | [<img src="resources/hist_rup_369.png" />](resources/../hist_rup_pages/hist_rup_369.html) |
| **p97.5: 487.36** | **p99: 512.31** | **p99.9: 537.45** | **Maximum: 546.57** |
| [<img src="resources/hist_rup_858.png" />](resources/../hist_rup_pages/hist_rup_858.html) | [<img src="resources/hist_rup_661.png" />](resources/../hist_rup_pages/hist_rup_661.html) | [<img src="resources/hist_rup_867.png" />](resources/../hist_rup_pages/hist_rup_867.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

### Rupture Magnitude
_[(top)](#table-of-contents)_

Magnitude of the rupture.

| ![hist](resources/hist_MAG.png) |
|-----|
| ![hist](resources/hist_MAG_cumulative.png) |

#### Rupture Magnitude Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Rupture Magnitude

| **Minimum: 5.36** | **p50: 7.61** | **p90: 7.97** | **p95: 8.01** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_3066.png" />](resources/../hist_rup_pages/hist_rup_3066.html) | [<img src="resources/hist_rup_333.png" />](resources/../hist_rup_pages/hist_rup_333.html) | [<img src="resources/hist_rup_1310.png" />](resources/../hist_rup_pages/hist_rup_1310.html) | [<img src="resources/hist_rup_368.png" />](resources/../hist_rup_pages/hist_rup_368.html) |
| **p97.5: 8.03** | **p99: 8.05** | **p99.9: 8.06** | **Maximum: 8.06** |
| [<img src="resources/hist_rup_374.png" />](resources/../hist_rup_pages/hist_rup_374.html) | [<img src="resources/hist_rup_661.png" />](resources/../hist_rup_pages/hist_rup_661.html) | [<img src="resources/hist_rup_866.png" />](resources/../hist_rup_pages/hist_rup_866.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

### Subsection Count
_[(top)](#table-of-contents)_

Total number of subsections involved in a rupture.

| ![hist](resources/hist_SECT_COUNT.png) |
|-----|
| ![hist](resources/hist_SECT_COUNT_cumulative.png) |

#### Subsection Count Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Subsection Count

| **Minimum: 2** | **p50: 28** | **p90: 62** | **p95: 70** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_184.png" />](resources/../hist_rup_pages/hist_rup_184.html) | [<img src="resources/hist_rup_1482.png" />](resources/../hist_rup_pages/hist_rup_1482.html) | [<img src="resources/hist_rup_1250.png" />](resources/../hist_rup_pages/hist_rup_1250.html) |
| **p97.5: 76** | **p99: 81** | **p99.9: 86** | **Maximum: 88** |
| [<img src="resources/hist_rup_588.png" />](resources/../hist_rup_pages/hist_rup_588.html) | [<img src="resources/hist_rup_661.png" />](resources/../hist_rup_pages/hist_rup_661.html) | [<img src="resources/hist_rup_867.png" />](resources/../hist_rup_pages/hist_rup_867.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

### Cluster Count
_[(top)](#table-of-contents)_

Total number of clusters (of contiguous subsections on the same parent fault section) a rupture.

| ![hist](resources/hist_CLUSTER_COUNT.png) |
|-----|
| ![hist](resources/hist_CLUSTER_COUNT_cumulative.png) |

#### Cluster Count Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cluster Count

| **Minimum: 1** | **p50: 4** | **p90: 8** | **p95: 9** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_2027.png" />](resources/../hist_rup_pages/hist_rup_2027.html) | [<img src="resources/hist_rup_1240.png" />](resources/../hist_rup_pages/hist_rup_1240.html) | [<img src="resources/hist_rup_726.png" />](resources/../hist_rup_pages/hist_rup_726.html) |
| **p97.5: 10** | **p99: 10** | **p99.9: 10** | **Maximum: 10** |
| [<img src="resources/hist_rup_77.png" />](resources/../hist_rup_pages/hist_rup_77.html) | [<img src="resources/hist_rup_593.png" />](resources/../hist_rup_pages/hist_rup_593.html) | [<img src="resources/hist_rup_866.png" />](resources/../hist_rup_pages/hist_rup_866.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

### Area
_[(top)](#table-of-contents)_

Total area of the rupture (km^2).

| ![hist](resources/hist_AREA.png) |
|-----|
| ![hist](resources/hist_AREA_cumulative.png) |

#### Area Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Area

| **Minimum: 19.52** | **p50: 2417.76** | **p90: 5508.74** | **p95: 6131.71** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_3066.png" />](resources/../hist_rup_pages/hist_rup_3066.html) | [<img src="resources/hist_rup_2390.png" />](resources/../hist_rup_pages/hist_rup_2390.html) | [<img src="resources/hist_rup_1308.png" />](resources/../hist_rup_pages/hist_rup_1308.html) | [<img src="resources/hist_rup_932.png" />](resources/../hist_rup_pages/hist_rup_932.html) |
| **p97.5: 6432.46** | **p99: 6655.19** | **p99.9: 6825.63** | **Maximum: 6854.91** |
| [<img src="resources/hist_rup_374.png" />](resources/../hist_rup_pages/hist_rup_374.html) | [<img src="resources/hist_rup_794.png" />](resources/../hist_rup_pages/hist_rup_794.html) | [<img src="resources/hist_rup_866.png" />](resources/../hist_rup_pages/hist_rup_866.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

### Maximum Jump Dist
_[(top)](#table-of-contents)_

The maximum jump distance in the rupture.

| ![hist](resources/hist_MAX_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_MAX_JUMP_DIST_cumulative.png) |

#### Maximum Jump Dist Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Maximum Jump Dist

| **Minimum: 0.0** | **p50: 0.006117107** | **p90: 1.82** | **p95: 1.82** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_2208.png" />](resources/../hist_rup_pages/hist_rup_2208.html) | [<img src="resources/hist_rup_987.png" />](resources/../hist_rup_pages/hist_rup_987.html) | [<img src="resources/hist_rup_1153.png" />](resources/../hist_rup_pages/hist_rup_1153.html) |
| **p97.5: 1.82** | **p99: 1.82** | **p99.9: 1.82** | **Maximum: 1.82** |
| [<img src="resources/hist_rup_1232.png" />](resources/../hist_rup_pages/hist_rup_1232.html) | [<img src="resources/hist_rup_1280.png" />](resources/../hist_rup_pages/hist_rup_1280.html) | [<img src="resources/hist_rup_1307.png" />](resources/../hist_rup_pages/hist_rup_1307.html) | [<img src="resources/hist_rup_1310.png" />](resources/../hist_rup_pages/hist_rup_1310.html) |

### Cumulative Jump Dist
_[(top)](#table-of-contents)_

The total cumulative jump distance summed over all jumps in the rupture.

| ![hist](resources/hist_CUM_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_CUM_JUMP_DIST_cumulative.png) |

#### Cumulative Jump Dist Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cumulative Jump Dist

| **Minimum: 0.0** | **p50: 0.011590694** | **p90: 1.83** | **p95: 1.83** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_1893.png" />](resources/../hist_rup_pages/hist_rup_1893.html) | [<img src="resources/hist_rup_75.png" />](resources/../hist_rup_pages/hist_rup_75.html) | [<img src="resources/hist_rup_733.png" />](resources/../hist_rup_pages/hist_rup_733.html) |
| **p97.5: 1.83** | **p99: 1.83** | **p99.9: 1.83** | **Maximum: 1.83** |
| [<img src="resources/hist_rup_1055.png" />](resources/../hist_rup_pages/hist_rup_1055.html) | [<img src="resources/hist_rup_1237.png" />](resources/../hist_rup_pages/hist_rup_1237.html) | [<img src="resources/hist_rup_1307.png" />](resources/../hist_rup_pages/hist_rup_1307.html) | [<img src="resources/hist_rup_1310.png" />](resources/../hist_rup_pages/hist_rup_1310.html) |

### Ideal Length Ratio
_[(top)](#table-of-contents)_

The ratio between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_RATIO.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_RATIO_cumulative.png) |

#### Ideal Length Ratio Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Ideal Length Ratio

| **Minimum: 1** | **p50: 1.01** | **p90: 1.03** | **p95: 1.03** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_2788.png" />](resources/../hist_rup_pages/hist_rup_2788.html) | [<img src="resources/hist_rup_260.png" />](resources/../hist_rup_pages/hist_rup_260.html) | [<img src="resources/hist_rup_2120.png" />](resources/../hist_rup_pages/hist_rup_2120.html) | [<img src="resources/hist_rup_2216.png" />](resources/../hist_rup_pages/hist_rup_2216.html) |
| **p97.5: 1.04** | **p99: 1.04** | **p99.9: 1.04** | **Maximum: 1.06** |
| [<img src="resources/hist_rup_2042.png" />](resources/../hist_rup_pages/hist_rup_2042.html) | [<img src="resources/hist_rup_1945.png" />](resources/../hist_rup_pages/hist_rup_1945.html) | [<img src="resources/hist_rup_246.png" />](resources/../hist_rup_pages/hist_rup_246.html) | [<img src="resources/hist_rup_1251.png" />](resources/../hist_rup_pages/hist_rup_1251.html) |

### Ideal Length Difference
_[(top)](#table-of-contents)_

The difference between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_DIFF.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_DIFF_cumulative.png) |

#### Ideal Length Difference Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Ideal Length Difference

| **Minimum: -2.3869882E-4** | **p50: 2.07** | **p90: 9.75** | **p95: 11.06** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_11.png" />](resources/../hist_rup_pages/hist_rup_11.html) | [<img src="resources/hist_rup_2671.png" />](resources/../hist_rup_pages/hist_rup_2671.html) | [<img src="resources/hist_rup_294.png" />](resources/../hist_rup_pages/hist_rup_294.html) | [<img src="resources/hist_rup_586.png" />](resources/../hist_rup_pages/hist_rup_586.html) |
| **p97.5: 12.32** | **p99: 13.12** | **p99.9: 13.81** | **Maximum: 14.02** |
| [<img src="resources/hist_rup_589.png" />](resources/../hist_rup_pages/hist_rup_589.html) | [<img src="resources/hist_rup_662.png" />](resources/../hist_rup_pages/hist_rup_662.html) | [<img src="resources/hist_rup_868.png" />](resources/../hist_rup_pages/hist_rup_868.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

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
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_1540.png" />](resources/../hist_rup_pages/hist_rup_1540.html) | [<img src="resources/hist_rup_2772.png" />](resources/../hist_rup_pages/hist_rup_2772.html) | [<img src="resources/hist_rup_2926.png" />](resources/../hist_rup_pages/hist_rup_2926.html) |
| **p97.5: 0.0** | **p99: 0.0** | **p99.9: 0.0** | **Maximum: 0.0** |
| [<img src="resources/hist_rup_3003.png" />](resources/../hist_rup_pages/hist_rup_3003.html) | [<img src="resources/hist_rup_3050.png" />](resources/../hist_rup_pages/hist_rup_3050.html) | [<img src="resources/hist_rup_3077.png" />](resources/../hist_rup_pages/hist_rup_3077.html) | [<img src="resources/hist_rup_3080.png" />](resources/../hist_rup_pages/hist_rup_3080.html) |

### Cumulative Azimuth Change
_[(top)](#table-of-contents)_

Cumulative azimuth change for this rupture.

| ![hist](resources/hist_CUM_AZ_CHANGE.png) |
|-----|
| ![hist](resources/hist_CUM_AZ_CHANGE_cumulative.png) |

#### Cumulative Azimuth Change Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Cumulative Azimuth Change

| **Minimum: 0.0** | **p50: 59.09** | **p90: 235.02** | **p95: 265.91** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_2366.png" />](resources/../hist_rup_pages/hist_rup_2366.html) | [<img src="resources/hist_rup_280.png" />](resources/../hist_rup_pages/hist_rup_280.html) | [<img src="resources/hist_rup_66.png" />](resources/../hist_rup_pages/hist_rup_66.html) |
| **p97.5: 267.69** | **p99: 267.85** | **p99.9: 267.96** | **Maximum: 268** |
| [<img src="resources/hist_rup_74.png" />](resources/../hist_rup_pages/hist_rup_74.html) | [<img src="resources/hist_rup_661.png" />](resources/../hist_rup_pages/hist_rup_661.html) | [<img src="resources/hist_rup_867.png" />](resources/../hist_rup_pages/hist_rup_867.html) | [<img src="resources/hist_rup_869.png" />](resources/../hist_rup_pages/hist_rup_869.html) |

### Biasi & Wesnousky (2016,2017) Prob
_[(top)](#table-of-contents)_

Biasi & Wesnousky (2016,2017) conditional probability of passing through each jump.

| ![hist](resources/hist_BW_PROB.png) |
|-----|
| ![hist](resources/hist_BW_PROB_cumulative.png) |

#### Biasi & Wesnousky (2016,2017) Prob Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Biasi & Wesnousky (2016,2017) Prob

| **Maximum: 1** | **p50: 0.22** | **p10: 0.0039505213** | **p5: 0.0028828129** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_3080.png" />](resources/../hist_rup_pages/hist_rup_3080.html) | [<img src="resources/hist_rup_2168.png" />](resources/../hist_rup_pages/hist_rup_2168.html) | [<img src="resources/hist_rup_578.png" />](resources/../hist_rup_pages/hist_rup_578.html) | [<img src="resources/hist_rup_579.png" />](resources/../hist_rup_pages/hist_rup_579.html) |
| **p2.5: 0.0021036742** | **p1: 0.0021036742** | **p0.1: 0.0021036742** | **Minimum: 0.0021036742** |
| [<img src="resources/hist_rup_863.png" />](resources/../hist_rup_pages/hist_rup_863.html) | [<img src="resources/hist_rup_375.png" />](resources/../hist_rup_pages/hist_rup_375.html) | [<img src="resources/hist_rup_74.png" />](resources/../hist_rup_pages/hist_rup_74.html) | [<img src="resources/hist_rup_71.png" />](resources/../hist_rup_pages/hist_rup_71.html) |

### Max Slip Rate Difference
_[(top)](#table-of-contents)_

The difference between the slip rate with the highest and lowest slip rate in the rupture.

| ![hist](resources/hist_MAX_SLIP_DIFF.png) |
|-----|
| ![hist](resources/hist_MAX_SLIP_DIFF_cumulative.png) |

#### Max Slip Rate Difference Extremes & Examples
_[(top)](#table-of-contents)_

Example ruptures at various percentiles of Max Slip Rate Difference

| **Minimum: 0.0** | **p50: 10** | **p90: 24** | **p95: 24** |
|-----|-----|-----|-----|
| [<img src="resources/hist_rup_0.png" />](resources/../hist_rup_pages/hist_rup_0.html) | [<img src="resources/hist_rup_466.png" />](resources/../hist_rup_pages/hist_rup_466.html) | [<img src="resources/hist_rup_848.png" />](resources/../hist_rup_pages/hist_rup_848.html) | [<img src="resources/hist_rup_1282.png" />](resources/../hist_rup_pages/hist_rup_1282.html) |
| **p97.5: 25** | **p99: 25** | **p99.9: 25** | **Maximum: 25** |
| [<img src="resources/hist_rup_595.png" />](resources/../hist_rup_pages/hist_rup_595.html) | [<img src="resources/hist_rup_1062.png" />](resources/../hist_rup_pages/hist_rup_1062.html) | [<img src="resources/hist_rup_1307.png" />](resources/../hist_rup_pages/hist_rup_1307.html) | [<img src="resources/hist_rup_1310.png" />](resources/../hist_rup_pages/hist_rup_1310.html) |


## Fault Section Connections
_[(top)](#table-of-contents)_

| ![plot](resources/sect_connectivity.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_connectivity.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_connectivity.geojson) | *N/A* |
| ![plot](resources/sect_connectivity_hist.png) |


## Jump Counts Over Distance
_[(top)](#table-of-contents)_




| ![Plausibility Filter](resources/jumps_0.1km_counts.png) |
|-----|
| ![Plausibility Filter](resources/jumps_1.0km_counts.png) |


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


