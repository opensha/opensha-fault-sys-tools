# Solution Report: slip_rate_inferred_gr_solution

| **Num Ruptures** | 592 |
|-----|-----|
| **Num Single-Stranded Ruptures** | 592 (100.00%) |
| **Total Supra-Seis Rupture Rate** | 0.046279725 |
| **Total Supra-Seis Recurrence Interval** | 21.61 yrs |
| **Total Moment Rate** | 1.14992891E18 N-m/yr |
| **Deformation Model Total Moment Rate** | 1.13042508E18 N-m/yr |
| **Magnitude Range** | [6.21,7.77] |
| **Length Range** | [10.52,229.93] km |
| **Rupture Section Count Range** | [2,35] |

## Table Of Contents
* [Solution MFDs](#solution-mfds)
* [Simulated Annealing Energy](#simulated-annealing-energy)
  * [Final Energies](#final-energies)
  * [Energy Progress](#energy-progress)
  * [Rate Distribution](#rate-distribution)
* [Participation Rates](#participation-rates)
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
* [Slip Rates](#slip-rates)
  * [Linear Slip Rate Plots](#linear-slip-rate-plots)
  * [Log10 Slip Rate Plots](#log10-slip-rate-plots)
* [Jump Counts Over Distance](#jump-counts-over-distance)
  * [Supra-seismogenic Jump Counts](#supra-seismogenic-jump-counts)
  * [M&ge;7 Jump Counts](#m7-jump-counts)
* [Fault Segmentation](#fault-segmentation)
  * [Supra-Seismogenic Fault Segmentation](#supra-seismogenic-fault-segmentation)
  * [M&ge;6.5 Fault Segmentation](#m65-fault-segmentation)
  * [M&ge;7.0 Fault Segmentation](#m70-fault-segmentation)
  * [M&ge;7.5 Fault Segmentation](#m75-fault-segmentation)
  * [Magnitude Connection Rate Comparisons](#magnitude-connection-rate-comparisons)
* [Parent Section Detail Pages](#parent-section-detail-pages)
## Solution MFDs
_[(top)](#table-of-contents)_

| Incremental MFDs | Cumulative MFDs |
|-----|-----|
| ![Incremental Plot](resources/mfd_plot_Total_Target_MFDs.png) | ![Cumulative Plot](resources/mfd_plot_Total_Target_MFDs_cumulative.png) |

## Simulated Annealing Energy
_[(top)](#table-of-contents)_

* Iterations: 263,155,273 (4,380,300 /sec)
* Time: 1 min 0.1 secs
* Perturbations: 33,637,399
* Total energy: 2.6077128E-5
### Final Energies
_[(top)](#table-of-contents)_

| Energy Type | Final Energy (1 min 0.1 secs) | % of Total |
|-----|-----|-----|
| **Total Energy** | **2.6077128E-5** |  |
| **Equality Energy** | 2.6077128E-5 | 100.00% |
| **Entropy Energy** | 0.0 | 0.00% |
| **Inequality Energy** | 0.0 | 0.00% |
| **Slip Rate** | 2.60673E-5 | 99.96% |
| **MFD Equality** | 9.828281E-9 | 0.04% |

### Energy Progress
_[(top)](#table-of-contents)_

![Energy vs Time](resources/sa_progress_energy_vs_time.png)

![Energy vs Iterations](resources/sa_progress_energy_vs_iters.png)

![Perturbations](resources/sa_progress_perturb_vs_iters.png)

### Rate Distribution
_[(top)](#table-of-contents)_

* Non-zero ruptures: 362 (61.15%)
* Avg. # perturbations per rupture: 56819.93
* Avg. # perturbations per perturbed rupture: 92920.99
![Rate Distribution](resources/sa_progress_rate_dist.png)

![Cumulative Rate Distribution](resources/sa_progress_rate_dist_cumulative.png)

## Participation Rates
_[(top)](#table-of-contents)_

| <p align="center">**Supra-Seismogenic**</p> | <p align="center">**Range: M&le;7**</p> |
|-----|-----|
| ![Map](resources/sol_partic_supra_seis.png) | ![Map](resources/sol_partic_supra_seis_to_m7.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_supra_seis.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_supra_seis.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_supra_seis_to_m7.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_supra_seis_to_m7.geojson) |
| <p align="center">**M&ge;7**</p> |  |
| ![Map](resources/sol_partic_m7.png) |  |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/sol_partic_m7.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/sol_partic_m7.geojson) |  |

## Plausibility Configuration
_[(top)](#table-of-contents)_

### Connection Strategy
_[(top)](#table-of-contents)_

|   | slip_rate_inferred_gr_solution |
|-----|-----|
| **Name** | ClosestSectPair: maxDist=5 km |
| **Max Jump Dist** | 5 km |
| **Possible parent-section connections** | Total: 18, Avg: 2.00, Range: [1,3] |
| **Actual connections (after applying filters)** | Total: 8, Avg: 1.78, Range: [1,3] |

### Splays
_[(top)](#table-of-contents)_

|   | slip_rate_inferred_gr_solution |
|-----|-----|
| **Max Allowed Splays** | 0 |

### Plausibility Filters
_[(top)](#table-of-contents)_

| slip_rate_inferred_gr_solution |
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

### Linear Slip Rate Plots
_[(top)](#table-of-contents)_

| ![Map](resources/slip_rates_orig.png) | ![Map](resources/slip_rates_reduced.png) |
|-----|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_orig.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_orig.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_reduced.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_reduced.geojson) |
| ![Map](resources/slip_rates_target.png) | ![Map](resources/slip_rates_sol.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_target.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_target.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_sol.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_sol.geojson) |
| ![Map](resources/slip_rates_sol_diff.png) | ![Map](resources/slip_rates_sol_ratio.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_sol_diff.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_sol_diff.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_sol_ratio.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_sol_ratio.geojson) |
| ![Diff hist](resources/slip_rates_sol_diff_hist.png) | ![Diff hist](resources/slip_rates_sol_scatter.png) |

### Log10 Slip Rate Plots
_[(top)](#table-of-contents)_

| ![Map](resources/slip_rates_log_orig.png) | ![Map](resources/slip_rates_log_reduced.png) |
|-----|-----|
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_log_orig.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_log_orig.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_log_reduced.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_log_reduced.geojson) |
| ![Map](resources/slip_rates_log_target.png) | ![Map](resources/slip_rates_log_sol.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_log_target.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_log_target.geojson) | <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_log_sol.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_log_sol.geojson) |
| ![Map](resources/slip_rates_log_sol_ratio.png) | ![Diff hist](resources/slip_rates_log_sol_scatter.png) |
| <script>var a = document.createElement('a'); a.appendChild(document.createTextNode('View GeoJSON'));a.href = 'http://geojson.io/#data=data:text/x-url,'+encodeURIComponent(new URL('resources/slip_rates_log_sol_ratio.geojson', document.baseURI).href); document.scripts[ document.scripts.length - 1 ].parentNode.appendChild( a );</script> [Download GeoJSON](resources/slip_rates_log_sol_ratio.geojson) |  |

## Jump Counts Over Distance
_[(top)](#table-of-contents)_

### Supra-seismogenic Jump Counts
_[(top)](#table-of-contents)_

| As Discretized | Rate Weighted |
|-----|-----|
| ![Plausibility Filter](resources/jumps_0.1km_counts.png) | ![Plausibility Filter](resources/jumps_0.1km_rates.png) |
| ![Plausibility Filter](resources/jumps_1.0km_counts.png) | ![Plausibility Filter](resources/jumps_1.0km_rates.png) |
| ![Plausibility Filter](resources/jumps_3.0km_counts.png) | ![Plausibility Filter](resources/jumps_3.0km_rates.png) |

### M&ge;7 Jump Counts
_[(top)](#table-of-contents)_

| As Discretized | Rate Weighted |
|-----|-----|
| ![Plausibility Filter](resources/jumps_0.1km_m7_counts.png) | ![Plausibility Filter](resources/jumps_0.1km_m7_rates.png) |
| ![Plausibility Filter](resources/jumps_1.0km_m7_counts.png) | ![Plausibility Filter](resources/jumps_1.0km_m7_rates.png) |
| ![Plausibility Filter](resources/jumps_3.0km_m7_counts.png) | ![Plausibility Filter](resources/jumps_3.0km_m7_rates.png) |


## Fault Segmentation
_[(top)](#table-of-contents)_

The following plots show implied segmentation from the rates of this fault system solution.

### Supra-Seismogenic Fault Segmentation
_[(top)](#table-of-contents)_

**Connection Rates**

This shows the rate at which each connection is taken.

![Rates](resources/conn_rates_supra_seis.png)

**Connection Passthrough Rates**

_[(top)](#table-of-contents)_

Passthrough rates refer to the ratio of the jumping rate to the rates on either side of the jump. The denominator of that ratio can be either the minimum, maximum, or average of the subsection rates on either side of the jump. Each choice of denomiator is plotted separately.

| ![Rates](resources/conn_passthrough_MIN_supra_seis.png) |
|-----|

**Connection Passthrough Rates vs Scalars**

_[(top)](#table-of-contents)_

This plots passthrough rates versus various scalar values (for each rate combiniation type).

| Jump Distance (km) | Jump Distance (km) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_JUMP_DIST_supra_seis.png) | ![Rates](resources/conn_passthrough_JUMP_DIST_log_supra_seis.png) |

| \|Slip Rate Change\| (mm/yr) | \|Slip Rate Change\| (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_supra_seis.png) | ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_log_supra_seis.png) |

| Slip Rate Ratio (mm/yr) | Slip Rate Ratio (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_supra_seis.png) | ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_log_supra_seis.png) |

| \|Dip Change\| (degrees) | \|Dip Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_DIP_CHANGE_supra_seis.png) | ![Rates](resources/conn_passthrough_DIP_CHANGE_log_supra_seis.png) |

| \|Rake Change\| (degrees) | \|Rake Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_RAKE_CHANGE_supra_seis.png) | ![Rates](resources/conn_passthrough_RAKE_CHANGE_log_supra_seis.png) |

| \|Azimuth Change\| (degrees) | \|Azimuth Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_supra_seis.png) | ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_log_supra_seis.png) |

| Best Directional Fract ΔCFF>0 | Best Directional Fract ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_supra_seis.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_log_supra_seis.png) |

| Best Directional Fract RPatch ΔCFF>0 | Best Directional Fract RPatch ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_supra_seis.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_log_supra_seis.png) |

| Best Directional Sum ΔCFF (MPa) | Best Directional Sum ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_SUM_supra_seis.png) | ![Rates](resources/conn_passthrough_CFF_SUM_log_supra_seis.png) |

| Max ΔCFF (MPa) | Max ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_MAX_supra_seis.png) | ![Rates](resources/conn_passthrough_CFF_MAX_log_supra_seis.png) |

### M&ge;6.5 Fault Segmentation
_[(top)](#table-of-contents)_

**Connection Rates**

This shows the rate at which each connection is taken.

![Rates](resources/conn_rates_m6.5.png)

**Connection Passthrough Rates**

_[(top)](#table-of-contents)_

Passthrough rates refer to the ratio of the jumping rate to the rates on either side of the jump. The denominator of that ratio can be either the minimum, maximum, or average of the subsection rates on either side of the jump. Each choice of denomiator is plotted separately.

| ![Rates](resources/conn_passthrough_MIN_m6.5.png) |
|-----|

**Connection Passthrough Rates vs Scalars**

_[(top)](#table-of-contents)_

This plots passthrough rates versus various scalar values (for each rate combiniation type).

| Jump Distance (km) | Jump Distance (km) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_JUMP_DIST_m6.5.png) | ![Rates](resources/conn_passthrough_JUMP_DIST_log_m6.5.png) |

| \|Slip Rate Change\| (mm/yr) | \|Slip Rate Change\| (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_m6.5.png) | ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_log_m6.5.png) |

| Slip Rate Ratio (mm/yr) | Slip Rate Ratio (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_m6.5.png) | ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_log_m6.5.png) |

| \|Dip Change\| (degrees) | \|Dip Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_DIP_CHANGE_m6.5.png) | ![Rates](resources/conn_passthrough_DIP_CHANGE_log_m6.5.png) |

| \|Rake Change\| (degrees) | \|Rake Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_RAKE_CHANGE_m6.5.png) | ![Rates](resources/conn_passthrough_RAKE_CHANGE_log_m6.5.png) |

| \|Azimuth Change\| (degrees) | \|Azimuth Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_m6.5.png) | ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_log_m6.5.png) |

| Best Directional Fract ΔCFF>0 | Best Directional Fract ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_m6.5.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_log_m6.5.png) |

| Best Directional Fract RPatch ΔCFF>0 | Best Directional Fract RPatch ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_m6.5.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_log_m6.5.png) |

| Best Directional Sum ΔCFF (MPa) | Best Directional Sum ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_SUM_m6.5.png) | ![Rates](resources/conn_passthrough_CFF_SUM_log_m6.5.png) |

| Max ΔCFF (MPa) | Max ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_MAX_m6.5.png) | ![Rates](resources/conn_passthrough_CFF_MAX_log_m6.5.png) |

### M&ge;7.0 Fault Segmentation
_[(top)](#table-of-contents)_

**Connection Rates**

This shows the rate at which each connection is taken.

![Rates](resources/conn_rates_m7.0.png)

**Connection Passthrough Rates**

_[(top)](#table-of-contents)_

Passthrough rates refer to the ratio of the jumping rate to the rates on either side of the jump. The denominator of that ratio can be either the minimum, maximum, or average of the subsection rates on either side of the jump. Each choice of denomiator is plotted separately.

| ![Rates](resources/conn_passthrough_MIN_m7.0.png) |
|-----|

**Connection Passthrough Rates vs Scalars**

_[(top)](#table-of-contents)_

This plots passthrough rates versus various scalar values (for each rate combiniation type).

| Jump Distance (km) | Jump Distance (km) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_JUMP_DIST_m7.0.png) | ![Rates](resources/conn_passthrough_JUMP_DIST_log_m7.0.png) |

| \|Slip Rate Change\| (mm/yr) | \|Slip Rate Change\| (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_m7.0.png) | ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_log_m7.0.png) |

| Slip Rate Ratio (mm/yr) | Slip Rate Ratio (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_m7.0.png) | ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_log_m7.0.png) |

| \|Dip Change\| (degrees) | \|Dip Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_DIP_CHANGE_m7.0.png) | ![Rates](resources/conn_passthrough_DIP_CHANGE_log_m7.0.png) |

| \|Rake Change\| (degrees) | \|Rake Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_RAKE_CHANGE_m7.0.png) | ![Rates](resources/conn_passthrough_RAKE_CHANGE_log_m7.0.png) |

| \|Azimuth Change\| (degrees) | \|Azimuth Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_m7.0.png) | ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_log_m7.0.png) |

| Best Directional Fract ΔCFF>0 | Best Directional Fract ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_m7.0.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_log_m7.0.png) |

| Best Directional Fract RPatch ΔCFF>0 | Best Directional Fract RPatch ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_m7.0.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_log_m7.0.png) |

| Best Directional Sum ΔCFF (MPa) | Best Directional Sum ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_SUM_m7.0.png) | ![Rates](resources/conn_passthrough_CFF_SUM_log_m7.0.png) |

| Max ΔCFF (MPa) | Max ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_MAX_m7.0.png) | ![Rates](resources/conn_passthrough_CFF_MAX_log_m7.0.png) |

### M&ge;7.5 Fault Segmentation
_[(top)](#table-of-contents)_

**Connection Rates**

This shows the rate at which each connection is taken.

![Rates](resources/conn_rates_m7.5.png)

**Connection Passthrough Rates**

_[(top)](#table-of-contents)_

Passthrough rates refer to the ratio of the jumping rate to the rates on either side of the jump. The denominator of that ratio can be either the minimum, maximum, or average of the subsection rates on either side of the jump. Each choice of denomiator is plotted separately.

| ![Rates](resources/conn_passthrough_MIN_m7.5.png) |
|-----|

**Connection Passthrough Rates vs Scalars**

_[(top)](#table-of-contents)_

This plots passthrough rates versus various scalar values (for each rate combiniation type).

| Jump Distance (km) | Jump Distance (km) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_JUMP_DIST_m7.5.png) | ![Rates](resources/conn_passthrough_JUMP_DIST_log_m7.5.png) |

| \|Slip Rate Change\| (mm/yr) | \|Slip Rate Change\| (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_m7.5.png) | ![Rates](resources/conn_passthrough_SLIP_RATE_CHANGE_log_m7.5.png) |

| Slip Rate Ratio (mm/yr) | Slip Rate Ratio (mm/yr) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_m7.5.png) | ![Rates](resources/conn_passthrough_MIN_SLIP_RATE_log_m7.5.png) |

| \|Dip Change\| (degrees) | \|Dip Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_DIP_CHANGE_m7.5.png) | ![Rates](resources/conn_passthrough_DIP_CHANGE_log_m7.5.png) |

| \|Rake Change\| (degrees) | \|Rake Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_RAKE_CHANGE_m7.5.png) | ![Rates](resources/conn_passthrough_RAKE_CHANGE_log_m7.5.png) |

| \|Azimuth Change\| (degrees) | \|Azimuth Change\| (degrees) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_m7.5.png) | ![Rates](resources/conn_passthrough_AZIMUTH_CHANGE_log_m7.5.png) |

| Best Directional Fract ΔCFF>0 | Best Directional Fract ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_m7.5.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_POSITIVE_log_m7.5.png) |

| Best Directional Fract RPatch ΔCFF>0 | Best Directional Fract RPatch ΔCFF>0 (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_m7.5.png) | ![Rates](resources/conn_passthrough_CFF_FRACT_RPATCH_POSITIVE_log_m7.5.png) |

| Best Directional Sum ΔCFF (MPa) | Best Directional Sum ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_SUM_m7.5.png) | ![Rates](resources/conn_passthrough_CFF_SUM_log_m7.5.png) |

| Max ΔCFF (MPa) | Max ΔCFF (MPa) (Log10 Rates) |
|-----|-----|
| ![Rates](resources/conn_passthrough_CFF_MAX_m7.5.png) | ![Rates](resources/conn_passthrough_CFF_MAX_log_m7.5.png) |

### Magnitude Connection Rate Comparisons
_[(top)](#table-of-contents)_

This comapres slip_rate_inferred_gr_solution passthrough rates across magniutdes (and also for each rate combiniation type). Linear on the left, log10 on the right.

| Linear Passthrough Rates | Log10 Passthrough Rates |
|-----|-----|
| ![Scatter](resources/conn_rates_supra_seis_vs_m6.5.png) | ![Scatter](resources/conn_rates_supra_seis_vs_m6.5_log.png) |
| ![Scatter](resources/conn_rates_supra_seis_vs_m7.0.png) | ![Scatter](resources/conn_rates_supra_seis_vs_m7.0_log.png) |
| ![Scatter](resources/conn_rates_supra_seis_vs_m7.5.png) | ![Scatter](resources/conn_rates_supra_seis_vs_m7.5_log.png) |
| ![Scatter](resources/conn_rates_m6.5_vs_m7.0.png) | ![Scatter](resources/conn_rates_m6.5_vs_m7.0_log.png) |
| ![Scatter](resources/conn_rates_m6.5_vs_m7.5.png) | ![Scatter](resources/conn_rates_m6.5_vs_m7.5_log.png) |
| ![Scatter](resources/conn_rates_m7.0_vs_m7.5.png) | ![Scatter](resources/conn_rates_m7.0_vs_m7.5_log.png) |


## Parent Section Detail Pages
_[(top)](#table-of-contents)_

| Fault Section |
|-----|
| [Lytle Creek (San Jacinto, connector)](resources/../parent_sect_pages/Lytle_Creek_San_Jacinto_connector) |
| [San Jacinto (Anza)](resources/../parent_sect_pages/San_Jacinto_Anza) |
| [San Jacinto (Borrego)](resources/../parent_sect_pages/San_Jacinto_Borrego) |
| [San Jacinto (Clark)](resources/../parent_sect_pages/San_Jacinto_Clark) |
| [San Jacinto (Coyote Creek)](resources/../parent_sect_pages/San_Jacinto_Coyote_Creek) |
| [San Jacinto (San Bernardino)](resources/../parent_sect_pages/San_Jacinto_San_Bernardino) |
| [San Jacinto (San Jacinto Valley)](resources/../parent_sect_pages/San_Jacinto_San_Jacinto_Valley) |
| [San Jacinto (Superstition Mountain)](resources/../parent_sect_pages/San_Jacinto_Superstition_Mountain) |
| [San Jacinto (stepover)](resources/../parent_sect_pages/San_Jacinto_stepover) |

