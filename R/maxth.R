#' Maximum X Minutes
#'
#' @param x Numeric vector with acceleration values per epoch.
#' @param k Number indicating the kth maximum minute in the day.
#' @param consecutive Logical indicating whether k minutes should be consecutive or not. 
#' @param epoch Number indicating the epoch length in seconds.
#'
#' @return Max th minute in the day
#' @export
#' @importFrom zoo rollmean
maxth = function(x, k, epoch, consecutive = FALSE){
  k = k / (epoch/60)
  if (isFALSE(consecutive)) return(sort(x, decreasing = T)[k])
  if (isTRUE(consecutive)) {
    x_rollmean = zoo::rollmean(x, k = k, na.rm = T)
    return(max(x_rollmean, na.rm = T))
  } 
}
