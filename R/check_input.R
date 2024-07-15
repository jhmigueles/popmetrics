#' Title
#'
#' @param df 
#' @param datadir 
#' @param epoch 
#' @param timeCols 
#' @param accCol 
#' @param acc_metric 
#'
#' @return
#' @export
#'
#' @examples
check_input = function(acc_df, acc_folder, descriptives_df,
                       timeCols = "timestamp", accCol = "acc", 
                       factor_split, factor_along) {
  # DUMMY VARIABLES -----
  isNhanes = isDir = FALSE
  # CHECK ACC INPUT ---------
  if (is.null(acc_df) & is.null(acc_folder)) {
    stop(paste0("\nEither a data frame (acc_df) or a path to a folder containing ",
                "the input files (acc_folder) should be provided."))
  } else if (is.null(acc_df)) {
    # to do: directory with files
    isDir = TRUE
  } else {
    # then, single data frame is provided
    isNhanes = isNHANES(acc_df)
  }
  
  # -------------------------------------------------------------------------
  
  # to do: extra checks if data is not nhanes
  # check that timeCols and accCol are in acc_df
  
  # -------------------------------------------------------------------------
  # CHECK DESCRIPTIVES INPUT ------
  
  # RETURN
  return(list(isNhanes = isNhanes, isDir = isDir))
}
