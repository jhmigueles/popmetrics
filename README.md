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

## Getting ready for using popmetrics

No criterion measure is needed to extract the age- and sex-specific
cut-points as they are based on the population (or study sample)
descriptives and their recorded free-living physical activity.

### Input

The expected input for `popmetrics` to work consists of two main pieces.
First, data frame(s) with epoch-level aggregation of acceleration
values, and second, the descriptive values to be considered when fitting
the cut-points to the population.

Preferably, the acceleration aggregation measure would be calculated
following any of the methodologies proposed in the physical activity
literature. Examples include (but are not limited to) ENMO (2), MAD (3),
MIMS (4), AI0 (5), or activity counts (6).

#### Acceleration values

There are two possibilities, either providing a single data frame
containing the information for all the participants in the study sample,
or providing data frames for each individual.

-   In the first case, the user should provide the data frame as an R
    object of class data.frame or data.table containing three columns:
    ID, time stamp, and acceleration metric.

-   In the second scenario, the user can provide the path to a folder
    containing csv or RData files for each individual. In this case,
    `popmetrics` would derive the ID from the file names by eliminating
    the file extension (e.g., `id001.csv` would result in `id001`).
    Thus, the data frames should only contain two columns with the time
    stamp and the acceleration metric.

The format of the columns is expected to be as follows:

-   **ID column:** it can contain either character or numeric
    specification of the participants' IDs.

-   **Time stamp column:** it should contain the beginning of each epoch
    either as a `POSIX`, `ISO8601`, or a `character` with format
    specified by the user (following the standards explained in the
    documentation of `base::strptime`.

-   **Acceleration values:** it should contain the acceleration metric
    that would be used in the calculation of the cut-points.

#### Descriptive values

A second data frame is expected from the user containing the descriptive
values of the study sample. This data frame should contain a column with
the ID, and as many columns as factors should be used in the calculation
(e.g., ID, sex, age). It is imperative that the ID in this data frame
exactly matches the ID extracted or specified in the acceleration
values.

A specific terminology is used for the specification of the factors in
the `popmetrics` functions:

-   `factor_split` refers to any factor that would be used to split the
    sample before fitting the distribution of the accelerations.
    Usually, this would be a factor with not many levels (e.g., sex or
    weight status).

-   `factor_fit` refers to the factor over which the GAMLSS model would
    estimate the distribution of the acceleration metric. Usually, this
    includes a finer gradient of levels (e.g., age).

## Output

The output of `popmetrics` would be a data frame with the cut-points to
classify moderate-to-vigorous physical activity specifically for the
subgroups of the population that result from the application of the
factors (`factor_split` and `factor_fit`).

# References

1.  First popmetrics paper, when ready.
2.  Rowlands' paper on MX metrics.
3.  Vincent's paper on metrics
4.  Vaha-Ypya's paper on MAD
5.  Dinesh John's paper on MIMS
6.  Bai paper on AI0
7.  Neishabouri's paper on activity counts
