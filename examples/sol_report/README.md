# Solution Report: u3_ssaf_simple_sol

| **Num Ruptures** | 3,081 |
|-----|-----|
| **Num Single-Stranded Ruptures** | 3,081 (100.00%) |
| **Total Supra-Seis Rupture Rate** | 0.34351426 |
| **Total Supra-Seis Recurrence Interval** | 2.91 yrs |
| **Total Moment Rate** | 5.7408218E18 N-m/yr |
| **Deformation Model Total Moment Rate** | 5.4376452E18 N-m/yr |
| **Magnitude Range** | [5.36,8.06] |
| **Length Range** | [9.11,546.57] km |
| **Rupture Section Count Range** | [2,88] |

## Table Of Contents
* [Solution MFDs](#solution-mfds)
* [Simulated Annealing Energy](#simulated-annealing-energy)
  * [Final Energies](#final-energies)
  * [Energy Progress](#energy-progress)
  * [Rate Distribution](#rate-distribution)
* [Participation Rates](#participation-rates)
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
* [Slip Rates](#slip-rates)
* [Jump Counts Over Distance](#jump-counts-over-distance)
## Solution MFDs
_[(top)](#table-of-contents)_

| Incremental MFDs | Cumulative MFDs |
|-----|-----|
| ![Incremental Plot](resources/mfd_plot_Total_MFD.png) | ![Cumulative Plot](resources/mfd_plot_Total_MFD_cumulative.png) |

## Simulated Annealing Energy
_[(top)](#table-of-contents)_

* Iterations: 468,187,480 (3,898,249 /sec)
* Time: 2 mins 0.1 secs
* Perturbations: 261,418,626
* Total energy: 1.0825959E-7
### Final Energies
_[(top)](#table-of-contents)_

| Energy Type | Final Energy (2 mins 0.1 secs) | % of Total |
|-----|-----|-----|
| **Total Energy** | **1.0825959E-7** |  |
| **Equality Energy** | 1.0825959E-7 | 100.00% |
| **Entropy Energy** | 0.0 | 0.00% |
| **Inequality Energy** | 0.0 | 0.00% |
| **Slip Rate** | 1.0825959E-7 | 100.00% |

### Energy Progress
_[(top)](#table-of-contents)_

![Energy vs Time](resources/sa_progress_energy_vs_time.png)

![Energy vs Iterations](resources/sa_progress_energy_vs_iters.png)

![Perturbations](resources/sa_progress_perturb_vs_iters.png)

### Rate Distribution
_[(top)](#table-of-contents)_

* Non-zero ruptures: 2,300 (74.65%)
* Avg. # perturbations per rupture: 84848.63
* Avg. # perturbations per perturbed rupture: 113660.27
![Rate Distribution](resources/sa_progress_rate_dist.png)

![Cumulative Rate Distribution](resources/sa_progress_rate_dist_cumulative.png)

## Participation Rates
_[(top)](#table-of-contents)_

| <p align="center">**Supra-Seismogenic**</p> | <p align="center">**Supra-Seismogenic -> M6**</p> |
|-----|-----|
| ![Map](resources/sol_partic_supra_seis.png) | ![Map](resources/sol_partic_supra_seis_to_m6.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_supra_seis.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_supra_seis.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_supra_seis_to_m6.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_supra_seis_to_m6.geojson) |
| <p align="center">**M&ge;6**</p> | <p align="center">**M6 -> 7**</p> |
| ![Map](resources/sol_partic_m6.png) | ![Map](resources/sol_partic_m6_to_m7.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_m6.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_m6.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_m6_to_m7.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_m6_to_m7.geojson) |
| <p align="center">**M&ge;7**</p> | <p align="center">**M7 -> 8**</p> |
| ![Map](resources/sol_partic_m7.png) | ![Map](resources/sol_partic_m7_to_m8.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_m7.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_m7.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_m7_to_m8.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_m7_to_m8.geojson) |
| <p align="center">**M&ge;8**</p> |  |
| ![Map](resources/sol_partic_m8.png) |  |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_m8.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_m8.geojson) |  |

## Rupture Scalar Histograms
_[(top)](#table-of-contents)_

### Rupture Length
_[(top)](#table-of-contents)_

Total length (km) of the rupture, not including jumps or gaps.

| ![hist](resources/hist_LENGTH.png) |
|-----|
| ![hist](resources/hist_LENGTH_rates.png) | *N/A* |
| ![hist](resources/hist_LENGTH_rates_log.png) | *N/A* |
| ![hist](resources/hist_LENGTH_cumulative.png) |

#### Rupture Length vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_LENGTH_vs_rate.png) | ![rate hist](resources/hist_LENGTH_vs_rate_hist2D.png) |
|-----|-----|
### Rupture Magnitude
_[(top)](#table-of-contents)_

Magnitude of the rupture.

| ![hist](resources/hist_MAG.png) |
|-----|
| ![hist](resources/hist_MAG_rates.png) | *N/A* |
| ![hist](resources/hist_MAG_rates_log.png) | *N/A* |
| ![hist](resources/hist_MAG_cumulative.png) |

#### Rupture Magnitude vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_MAG_vs_rate.png) | ![rate hist](resources/hist_MAG_vs_rate_hist2D.png) |
|-----|-----|
### Subsection Count
_[(top)](#table-of-contents)_

Total number of subsections involved in a rupture.

| ![hist](resources/hist_SECT_COUNT.png) |
|-----|
| ![hist](resources/hist_SECT_COUNT_rates.png) | *N/A* |
| ![hist](resources/hist_SECT_COUNT_rates_log.png) | *N/A* |
| ![hist](resources/hist_SECT_COUNT_cumulative.png) |

#### Subsection Count vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_SECT_COUNT_vs_rate.png) | ![rate hist](resources/hist_SECT_COUNT_vs_rate_hist2D.png) |
|-----|-----|
### Cluster Count
_[(top)](#table-of-contents)_

Total number of clusters (of contiguous subsections on the same parent fault section) a rupture.

| ![hist](resources/hist_CLUSTER_COUNT.png) |
|-----|
| ![hist](resources/hist_CLUSTER_COUNT_rates.png) | *N/A* |
| ![hist](resources/hist_CLUSTER_COUNT_rates_log.png) | *N/A* |
| ![hist](resources/hist_CLUSTER_COUNT_cumulative.png) |

#### Cluster Count vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_CLUSTER_COUNT_vs_rate.png) | ![rate hist](resources/hist_CLUSTER_COUNT_vs_rate_hist2D.png) |
|-----|-----|
### Area
_[(top)](#table-of-contents)_

Total area of the rupture (km^2).

| ![hist](resources/hist_AREA.png) |
|-----|
| ![hist](resources/hist_AREA_rates.png) | *N/A* |
| ![hist](resources/hist_AREA_rates_log.png) | *N/A* |
| ![hist](resources/hist_AREA_cumulative.png) |

#### Area vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_AREA_vs_rate.png) | ![rate hist](resources/hist_AREA_vs_rate_hist2D.png) |
|-----|-----|
### Maximum Jump Dist
_[(top)](#table-of-contents)_

The maximum jump distance in the rupture.

| ![hist](resources/hist_MAX_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_MAX_JUMP_DIST_rates.png) | *N/A* |
| ![hist](resources/hist_MAX_JUMP_DIST_rates_log.png) | *N/A* |
| ![hist](resources/hist_MAX_JUMP_DIST_cumulative.png) |

#### Maximum Jump Dist vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_MAX_JUMP_DIST_vs_rate.png) | ![rate hist](resources/hist_MAX_JUMP_DIST_vs_rate_hist2D.png) |
|-----|-----|
### Cumulative Jump Dist
_[(top)](#table-of-contents)_

The total cumulative jump distance summed over all jumps in the rupture.

| ![hist](resources/hist_CUM_JUMP_DIST.png) |
|-----|
| ![hist](resources/hist_CUM_JUMP_DIST_rates.png) | *N/A* |
| ![hist](resources/hist_CUM_JUMP_DIST_rates_log.png) | *N/A* |
| ![hist](resources/hist_CUM_JUMP_DIST_cumulative.png) |

#### Cumulative Jump Dist vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_CUM_JUMP_DIST_vs_rate.png) | ![rate hist](resources/hist_CUM_JUMP_DIST_vs_rate_hist2D.png) |
|-----|-----|
### Ideal Length Ratio
_[(top)](#table-of-contents)_

The ratio between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_RATIO.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_RATIO_rates.png) | *N/A* |
| ![hist](resources/hist_IDEAL_LEN_RATIO_rates_log.png) | *N/A* |
| ![hist](resources/hist_IDEAL_LEN_RATIO_cumulative.png) |

#### Ideal Length Ratio vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_IDEAL_LEN_RATIO_vs_rate.png) | ![rate hist](resources/hist_IDEAL_LEN_RATIO_vs_rate_hist2D.png) |
|-----|-----|
### Ideal Length Difference
_[(top)](#table-of-contents)_

The difference between the total length of this rupture and the 'idealized length,' which we define as the straight line distance between the furthest two subsections.

| ![hist](resources/hist_IDEAL_LEN_DIFF.png) |
|-----|
| ![hist](resources/hist_IDEAL_LEN_DIFF_rates.png) | *N/A* |
| ![hist](resources/hist_IDEAL_LEN_DIFF_rates_log.png) | *N/A* |
| ![hist](resources/hist_IDEAL_LEN_DIFF_cumulative.png) |

#### Ideal Length Difference vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_IDEAL_LEN_DIFF_vs_rate.png) | ![rate hist](resources/hist_IDEAL_LEN_DIFF_vs_rate_hist2D.png) |
|-----|-----|
### Rake
_[(top)](#table-of-contents)_

The area-averaged rake for this rupture.

| ![hist](resources/hist_RAKE.png) |
|-----|
| ![hist](resources/hist_RAKE_rates.png) | *N/A* |
| ![hist](resources/hist_RAKE_rates_log.png) | *N/A* |
| ![hist](resources/hist_RAKE_cumulative.png) |

#### Rake vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_RAKE_vs_rate.png) | ![rate hist](resources/hist_RAKE_vs_rate_hist2D.png) |
|-----|-----|
### Cumulative Rake Change
_[(top)](#table-of-contents)_

Cumulative rake change for this rupture.

### Mechanism Change
_[(top)](#table-of-contents)_

The number of times a rupture changed mechanisms, e.g., from right-lateral SS to left-lateral or SS to reverse.

| ![hist](resources/hist_MECH_CHANGE.png) |
|-----|
| ![hist](resources/hist_MECH_CHANGE_rates.png) | *N/A* |
| ![hist](resources/hist_MECH_CHANGE_rates_log.png) | *N/A* |
| ![hist](resources/hist_MECH_CHANGE_cumulative.png) |

#### Mechanism Change vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_MECH_CHANGE_vs_rate.png) | ![rate hist](resources/hist_MECH_CHANGE_vs_rate_hist2D.png) |
|-----|-----|
### Cumulative Azimuth Change
_[(top)](#table-of-contents)_

Cumulative azimuth change for this rupture.

| ![hist](resources/hist_CUM_AZ_CHANGE.png) |
|-----|
| ![hist](resources/hist_CUM_AZ_CHANGE_rates.png) | *N/A* |
| ![hist](resources/hist_CUM_AZ_CHANGE_rates_log.png) | *N/A* |
| ![hist](resources/hist_CUM_AZ_CHANGE_cumulative.png) |

#### Cumulative Azimuth Change vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_CUM_AZ_CHANGE_vs_rate.png) | ![rate hist](resources/hist_CUM_AZ_CHANGE_vs_rate_hist2D.png) |
|-----|-----|
### Biasi & Wesnousky (2016,2017) Prob
_[(top)](#table-of-contents)_

Biasi & Wesnousky (2016,2017) conditional probability of passing through each jump.

| ![hist](resources/hist_BW_PROB.png) |
|-----|
| ![hist](resources/hist_BW_PROB_rates.png) | *N/A* |
| ![hist](resources/hist_BW_PROB_rates_log.png) | *N/A* |
| ![hist](resources/hist_BW_PROB_cumulative.png) |

#### Biasi & Wesnousky (2016,2017) Prob vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_BW_PROB_vs_rate.png) | ![rate hist](resources/hist_BW_PROB_vs_rate_hist2D.png) |
|-----|-----|
### Max Slip Rate Difference
_[(top)](#table-of-contents)_

The difference between the slip rate with the highest and lowest slip rate in the rupture.

| ![hist](resources/hist_MAX_SLIP_DIFF.png) |
|-----|
| ![hist](resources/hist_MAX_SLIP_DIFF_rates.png) | *N/A* |
| ![hist](resources/hist_MAX_SLIP_DIFF_rates_log.png) | *N/A* |
| ![hist](resources/hist_MAX_SLIP_DIFF_cumulative.png) |

#### Max Slip Rate Difference vs Rupture Rate
_[(top)](#table-of-contents)_


| ![rate comparison](resources/hist_MAX_SLIP_DIFF_vs_rate.png) | ![rate hist](resources/hist_MAX_SLIP_DIFF_vs_rate_hist2D.png) |
|-----|-----|

## Fault Section Connections
_[(top)](#table-of-contents)_

| ![plot](resources/sect_connectivity.png) |
|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sect_connectivity.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sect_connectivity.geojson) | *N/A* |
| ![plot](resources/sect_connectivity_hist.png) |
| ![plot](resources/sect_connectivity_hist_rates.png) |
| ![plot](resources/sect_connectivity_hist_rates_log.png) |


## Slip Rates
_[(top)](#table-of-contents)_

| ![Map](resources/slip_rates_orig.png) | ![Map](resources/slip_rates_reduced.png) |
|-----|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_orig.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_orig.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_reduced.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_reduced.geojson) |
| ![Map](resources/slip_rates_target.png) | ![Map](resources/slip_rates_sol.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_target.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_target.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_sol.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_sol.geojson) |
| ![Map](resources/slip_rates_sol_diff.png) | ![Map](resources/slip_rates_sol_ratio.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_sol_diff.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_sol_diff.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_sol_ratio.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_sol_ratio.geojson) |
| ![Diff hist](resources/slip_rates_sol_diff_hist.png) | ![Diff hist](resources/slip_rates_sol_scatter.png) |

## Jump Counts Over Distance
_[(top)](#table-of-contents)_




| As Discretized | Rate Weighted |
|-----|-----|
| ![Plausibility Filter](resources/jumps_0.1km_counts.png) | ![Plausibility Filter](resources/jumps_0.1km_rates.png) |
| ![Plausibility Filter](resources/jumps_1.0km_counts.png) | ![Plausibility Filter](resources/jumps_1.0km_rates.png) |


