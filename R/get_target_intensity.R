#' Title
#'
#' @param data 
#' @param metric_name 
#' @param factors_split 
#' @param factor_fit 
#' @param percentile 
#'
#' @return
#' @export
#'
#' @examples
get_target_intensity = function(data = NULL, metric_name = "MaxMax5min",
                                factor_split = c("sex"), factor_fit = "age",
                                percentile = 80) {
  # 1 - estimate distributions for each factor_split
  # interaction factors
  # distributions for each subgroup across factor_fit
  
  # 2 - Identify percentile
  # organize in matrix
  # return target intensities
} 
