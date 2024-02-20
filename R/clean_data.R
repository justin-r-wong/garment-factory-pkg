#' From a given data frame drops selected columns and creates a new data frame
#' @importFrom dplyr select
#' @import dplyr
#'
#' @param data A data frame or tibble
#' @param columns Names of columns to be dropped from the data frame
#'
#' @return A new data frame from the old data frame with selected columns dropped
#'
#' @export
#'
#' @examples
#' clean_data(mtcars, c("mpg","cyl"))

clean_data <- function(data, columns) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame. Please try again.")
  }

  col_names <- names(data)

  for (c in columns) {
    if ({c} %in% col_names) {
      data <- data |> dplyr::select(-{c})
    } else {
      stop("column names incorrect. Please try again")
    }
  }
  return(data)
}
