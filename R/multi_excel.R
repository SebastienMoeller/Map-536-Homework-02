#' Read an excel file with multiple sheet into multiple lists
#'
#' @param file_name full path including file name
#'
#' @import readxl
#' @import assertthat
#'
#' @return list of dataframes of excel sheets of a single xlsx file
#' @export
#'
#' @examples
#' \dontrun{
#'  multi_excel("..")
#' }

multi_excel <- function(file_name){
  assert_that(is.dir(dirname(file_name)))
  assert_that(is.readable(file_name))
  assert_that(has_extension(file_name,"xlsx"))

  sheets <- lapply(excel_sheets(file_name), read_excel, path = file_name)
  return(sheets)
}
