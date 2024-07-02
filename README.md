# popmetrics

<!-- badges: start -->

<!-- badges: end -->

The R package `popmetrics` facilitates the calculation of age- and
sex-specific cut-points for physical activity intensity classification
based on the free-living accelerometer data recordings of your study
sample. This methodology has been tested for first time using the NHANES
data, specifically the first wave of accelerometer data, including the
2003-2004, and 2005-2006 cohorts (1).

## Methodology 

The methodology for calculating the age- and sex-specific cut-points for
moderate-to-vigorous physical activity are detailed in the study by
Migueles et al. (1), with a deeper explanation in the Supplemental file.

In brief, the methodology consists of the following steps:

1.  Calculation of the maximum 5-min intensity for each day of the
    free-living recording, inspired in the methods proposed by Rowlands
    et al. (2).

2.  Extraction of the maximum value of the daily maximum 5-min intensity
    for each participant.

3.  Fitting of the maximum 5-min intensity for each participant across
    the sexes and ages using GAMLSS modelling.

4.  Definition of the target intensity as the percentile 80 of the
    maximum 5-min intensity for each age and sex.

5.  Definition of the cut-point for moderate-to-vigorous physical
    activity as the 40% of the target intensity for each age and sex.

Additionally, this package allows expanding this functionality to
include other factors in the calculation of the specific cut-points,
such as weight status, socioeconomic status, or the presence of any
pathology or condition.

## Applications

This methodology was specifically developed for physical activity surveillance...

This package is built to facilitate further development:

- other acceleration metrics
- other factors
- other populations

Preferably, the acceleration aggregation measure would be calculated
following any of the methodologies proposed in the physical activity
literature. Examples include (but are not limited to) ENMO (2), MAD (3),
MIMS (4), AI0 (5), or activity counts (6).

# References

1.  First popmetrics paper, when ready.
2.  Rowlands' paper on MX metrics.
3.  Vincent's paper on metrics
4.  Vaha-Ypya's paper on MAD
5.  Dinesh John's paper on MIMS
6.  Bai paper on AI0
7.  Neishabouri's paper on activity counts
