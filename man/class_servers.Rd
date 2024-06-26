% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/servers.R
\name{class_servers}
\alias{class_servers}
\title{An object representing a collection of servers}
\usage{
class_servers(
  url = character(),
  description = character(),
  variables = class_server_variables()
)
}
\arguments{
\item{url}{Character vector (required). The urls of the target hosts. These
urls support \code{\link[=class_string_replacements]{class_string_replacements()}}. Variable substitutions will be
made when a variable is named in \{brackets\}.}

\item{description}{Character vector (optional). Strings describing the hosts
designated by \code{url}. \href{https://spec.commonmark.org/}{CommonMark syntax} may
be used for rich text representation.}

\item{variables}{A \code{\link[=class_server_variables]{class_server_variables()}} object.}
}
\value{
A \code{servers} S7 object, with properties \code{url}, \code{description}, and
\code{variables}.
}
\description{
The object provides connectivity information for the API. The described
servers are intended to be used as the base urls for calls to the API.
}
\examples{
class_servers(
  url = c(
    "https://development.gigantic-server.com/v1",
    "https://staging.gigantic-server.com/v1",
    "https://api.gigantic-server.com/v1"
  ),
  description = c(
    "Development server",
    "Staging server",
    "Production server"
  )
)
class_servers(
  url = "https://{username}.gigantic-server.com:{port}/{basePath}",
  description = "The production API server",
  variables = class_server_variables(class_string_replacements(
    name = c("username", "port", "basePath"),
    default = c("demo", "8443", "v2"),
    description = c(
      "The active user's folder.",
      NA, NA
    ),
    enum = list(
      NULL,
      c("8443", "443"),
      NULL
    )
  ))
)
}
\seealso{
servers object
\code{\link{as_server_variables}()},
\code{\link{as_servers}()},
\code{\link{as_string_replacements}()},
\code{\link{class_server_variables}()},
\code{\link{class_string_replacements}()}
}
\concept{servers}
