#' Day-level Summary of Wear Time (Minutes)
#'
#' Data frame containing the day-level estimates of wear time (min) for the
#' NHANES 2003-2004, and 2004-2005 recordings.
#'
#' @format ## `day_wear`
#' A data frame with 94178 rows and 5 columns:
#' \describe{
#'   \item{SEQN}{Respondent sequence number.}
#'   \item{PAXDAY}{Body site to which accelerometers were attached.}
#'   \item{PAXCAL}{Was the Monitor in Calibration? (1=yes; 2=no; 9=don't know).}
#'   \item{PAXSTAT}{Data Reliability Status Flag (1=reliable; 2=not reliable).}
#'   \item{PAXWEARMINUT}{Wear time in minutes.}
#' }
#' @source https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/PAXRAW_C.htm. 
"day_wear"
