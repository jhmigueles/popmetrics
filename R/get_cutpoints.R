#' Title
#'
#' @param df 
#' @param datadir 
#' @param timeCols 
#' @param accCol 
#' @param acc_metric 
#'
#' @return
#' @export
#'
#' @examples
get_cutpoints = function(acc_df = NULL, acc_folder = NULL, 
                         descriptives_df = NULL,
                         factor_split = "RIAGENDR", factor_along = "RIDAGEYR",
                         timeCols = "timestamp", accCol = "acc", 
                         acc_metric = "") {
  
  # INITIAL CHECKS ----------------------------------------------------------
  # check if data frame or directory to files is provided
  check = check_input(acc_df, acc_folder, descriptives_df,
                      timeCols = "timestamp", accCol = "acc", 
                      factor_split, factor_along)
  isNhanes = check$isNhanes; isDir = check$isDir
  # define acc metric and detect epoch
  if (isNhanes) acc_metric = "CPM"
  
  # GET MAXIMUM INTENSITY PER PERSON ----------------------------------------
  if (isNhanes) {
    # extract maximum intensity per day
    maxDay = aggregate(PAXINTEN ~ SEQN + PAXDAY, data = acc_df, FUN = maxth,
                       k = 5, epoch = 60, consecutive = FALSE)
    # now keep maximum of the recording
    maxWeek = aggregate(PAXINTEN ~ SEQN, data = maxDay, FUN = max)
    # standardize column names for next steps
    colnames(maxWeek) = c("ID", "MAXINTEN") 
  } else {
    # to do.
  }
  # check there are no zeroes in maximum intensity
  nZeroes = length(which(maxWeek$MAXINTEN == 0))
  if (nZeroes > 0) {
    stop(paste0("\nThe maximum 5-min intensity was 0 for ", nZeroes, 
                " participants. This is not to be expected, please clean ",
                "the accelerometer data set before running popmetrics ",
                "(e.g., remove participants without valid data from the data set)."))
  }
  
  # GAMLSS FIT OF MAXIMUM INTENSITY -----------------------------------------
  descriptives_df[, factor_split] = as.factor(descriptives_df[, factor_split])
  splits = levels(descriptives_df[, factor_split])
  maxWeek = merge(maxWeek, descriptives_df[, c("SEQN", factor_split, factor_along)],
                   by.x = "ID", by.y = "SEQN", all = FALSE)
  for (si in 1:length(splits)) {
    g = which(maxWeek[, factor_split] == splits[si])
    acc = maxWeek$MAXINTEN[g]
    f = maxWeek[g, factor_along]
    gamfit =  gamlss::gamlss(acc ~ cs(f, df = 2), sigma.formula = ~cs(f, df = 2),
                             nu.formula = ~cs(f, df = 2), family = BCCG)
  }
  
  gam.5max.max.m=gamlss::gamlss()
  gam.5max.max.f=gamlss(max5_1000.max ~ cs(RIDAGEYR,df=2),sigma.formula=~cs(RIDAGEYR,df=2),
                        nu.formula=~cs(RIDAGEYR,df=2),family=BCCG,
                        data=subset(final_id[,c('id','max5_1000.max','RIDAGEYR','RIAGENDR')],final_id$RIAGENDR==2))
  
}
