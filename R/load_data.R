#' loads the data from the Internet and returns a data frame
#'
#' @importFrom readr read_csv
#' @importFrom utils download.file
#'
#' @param url the path to the input file (a string of a URL)
#'
#' @return a data frame with the data from the given URL
#'
#' @export

load_data <- function(url) {

  # Check if url is a string
  if (!is.character(url)) {
    stop("url must be a string. Please try again.")
  }

  # Create tempfile and download file
  temp <- tempfile()
  url <- url
  suppressMessages(download.file(url, temp, mode = "wb"))

  # Read csv and unlink tempfile
  data <- read_csv(temp)
  unlink(temp)
  return(data)

}
