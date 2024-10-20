#' Checks whether provided data frame is NHANES data
#' ´r lifecycle::badge('stable')´
#'
#' @description
#' Based on the column names, if SEQN, PAXHOUR, PACMINUT, and PAXINTEN are 
#' column names in the data frame provided. Then, the data is assumed to be
#' NHANES data. 
#'
#' @param df Data frame with, at least, ID, timestamp, and acceleration metric.
#'
#' @return Logical indicating whether the data frame provided corresponds with
#' NHANES data.
#' @export
#'
isNHANES = function(df) {
  out = FALSE
  expectedCols = c("SEQN","PAXHOUR", "PAXMINUT", "PAXINTEN")
  if (all(expectedCols %in% colnames(df))) out = TRUE
  return(out)
}
