#' Read csv files in a directory into a list
#'
#' @param dir_path directoy where the csv files are read
#'
#' @import assertthat
#'
#' @return a list of dataframes made up of csv
#' @export
#'
#' @examples
#' \dontrun{
#' my_csv_reader("..")
#' }

my_csv_reader <- function(dir_path = getwd()){
  assert_that(is.dir(dirname(dir_path)))
  assert_that(is.readable(dirname(dir_path)))

  csvs <- list.files(path = dir_path, pattern = "*\\.csv$",full.names = TRUE)
  csv_list <- lapply(csvs, read.csv)
  return(csv_list)
}
