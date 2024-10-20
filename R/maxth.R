#' Maximum X Minutes
#'
#' @param x Numeric vector with acceleration values per epoch.
#' @param k Number indicating the kth maximum minute in the day.
#' @param consecutive Logical indicating whether k minutes should be consecutive or not. 
#' @param epoch Number indicating the epoch length in seconds.
#'
#' @return Max th minute in the day
#' @export
maxth = function(x, k, epoch, consecutive = FALSE){
  k = k / (epoch/60)
  if (isFALSE(consecutive)) return(sort(x, decreasing = T)[k])
  if (isTRUE(consecutive)) {
    cut = length(x) %% k
    if (cut > 0) {
      x = x[1:(length(x) - cut)]
    }
    x2 = matrix(x, ncol = k, byrow = T)
    xrollmin = apply(x2, MARGIN = 1, FUN = min, na.rm = T)
    return(max(xrollmin, na.rm = T))
  } 
}
