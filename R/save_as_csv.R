#' Saving dataframe as csv in specified directory
#'
#' @param file_name name of the saved file
#' @param df dataframe
#'
#' @import assertthat
#'
#' @return NULL
#' @export
#'
#' @examples
#' save_as_csv(iris, "iris_data")

save_as_csv <- function(df, file_name){
  assert_that(is.dir(dirname(file_name)))
  assert_that(is.writeable(dirname(file_name)))
  assert_that(is.data.frame(df))

  if(!grepl("*\\.csv$",file_name)) file_name <- paste(file_name,".csv",sep="")
  write.csv(df, file=file_name, row.names = F)
  return()
}
