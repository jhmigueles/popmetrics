#' Title
#'
#' @param data 
#' @param factor_fit 
#' @param percentile 
#' @param acc_metric 
#' @param factor_split 
#'
#' @return
#' @export
#'
#' @examples
get_target_intensity = function(data = NULL, acc_metric = "MaxMax5min",
                                factor_split = c("sex"), factor_fit = "age",
                                percentile = 80) {
  # 1 - estimate distributions for each factor_split
  # distributions for each subgroup along factor_fit
  
  # 2 - Identify percentile
  # organize in matrix
  # return target intensities per subgroup
} 
