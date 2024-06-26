% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zz-rapid.R
\name{as_rapid}
\alias{as_rapid}
\title{Coerce lists and urls to rapid objects}
\usage{
as_rapid(x, ...)
}
\arguments{
\item{x}{The object to coerce. Must be empty or have names "info", "servers",
"components", "paths", and/or "security", or names that can be coerced to
those names via \code{\link[snakecase:caseconverter]{snakecase::to_snake_case()}}. Extra names are ignored.
\code{\link[=url]{url()}} objects are read with \code{\link[jsonlite:fromJSON]{jsonlite::fromJSON()}} or \code{\link[yaml:read_yaml]{yaml::read_yaml()}}
before conversion.}

\item{...}{These dots are for future extensions and must be empty.}
}
\value{
A \code{rapid} object as returned by \code{\link[=class_rapid]{class_rapid()}}.
}
\description{
\code{as_rapid()} turns an existing object into a \code{rapid} object. This is in
contrast with \code{\link[=class_rapid]{class_rapid()}}, which builds a \code{rapid} object from individual
properties.
}
\examples{
as_rapid()
}
\seealso{
rapid object
\code{\link{as_api_object}()},
\code{\link{class_rapid}()},
\code{\link{expand_servers}()}
}
\concept{rapid}
