#' Age- and Sex-Specific Cut-Points from NHANES 2003-2006
#'
#' Data frame containing the target intensity and moderate-to-vigorous
#' phyisical activity cut-points specific for ages and sexes as presented
#' by Migueles et al. (1). Calculation procedures are detailed in the 
#' publication (1).
#'
#' @format ## `nhanes20032006`
#' A data frame with 132 rows and 7 columns:
#' \describe{
#'   \item{device_model}{Accelerometer device and model used in the NHANES 2003-2004,
#'   and 2005-2006 surveys.}
#'   \item{body_attachment_site}{Body site to which accelerometers were attached.}
#'   \item{acc_metric}{Acceleration metric used in the calculation of the cut-points.}
#'   \item{sex}{Sex}
#'   \item{age}{Age}
#'   \item{target_intensity_cpm}{Target intensity (cpm) for each age and sex (1).}
#'   \item{MVPA_threshold_cpm}{Moderate-to-vigorous physical activity cut-point (cpm) 
#'   for each age and sex (1).}
#' }
#' @references Migueles et al. JSHS publication, include when available. 
"nhanes20032006"
