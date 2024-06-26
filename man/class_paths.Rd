% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/paths.R
\name{class_paths}
\alias{class_paths}
\title{The available paths and operations for the API}
\usage{
class_paths(...)
}
\arguments{
\item{...}{A data.frame, or arguments to pass to \code{\link[tibble:tibble]{tibble::tibble()}}.}
}
\value{
A \code{paths} S7 object with details about API endpoints.
}
\description{
Holds the relative paths to the individual endpoints and their operations.
The path is appended to the URL from the \code{\link[=class_servers]{class_servers()}} object in order to
construct the full URL. The paths may be empty.
}
\examples{
class_paths()
class_paths(
  tibble::tibble(
    endpoint = c("/endpoint1", "/endpoint2"),
    operations = list(
      tibble::tibble(operation_properties = 1:2),
      tibble::tibble(operation_properties = 3:5)
    )
  )
)
}
\seealso{
paths object
\code{\link{as_paths}()}
}
\concept{paths}
