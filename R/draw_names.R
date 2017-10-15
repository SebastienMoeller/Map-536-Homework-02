#' Plotting multiple French name frquencies since 1900
#'
#' @param name_vector vector of names to be drawn
#'
#' @import prenoms
#' @import dplyr
#' @import ggplot2
#' @import ggthemes
#' @import assertthat
#'
#' @return ggplot of names
#' @export
#'
#' @examples
#' draw_names(c("Diane","Vincent"))

draw_names <- function(name_vector){
  assert_that(is.character(name_vector))

  the_plot <- prenoms::prenoms %>%
    filter(name %in% name_vector) %>%
    group_by(year, name) %>%
    summarize(n = sum(n)) %>%
    ggplot(aes(x = year, y = n, color = name)) +
    geom_line() +
    theme_gdocs()

  return(the_plot)
}
