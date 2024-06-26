% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/components-security_scheme-api_key.R
\name{class_api_key_security_scheme}
\alias{class_api_key_security_scheme}
\title{API key security schemes}
\usage{
class_api_key_security_scheme(
  parameter_name = character(),
  location = c("query", "header", "cookie")
)
}
\arguments{
\item{parameter_name}{Character vector (required). The names of the header,
query or cookie parameters to be used.}

\item{location}{Character vector (required). The location of the API key.
Valid values are "query", "header" or "cookie".}
}
\value{
An \code{api_key_security_scheme} S7 object, with fields \code{parameter_name}
and \code{location}.
}
\description{
Defines an API key security scheme that can be used by the operations.
}
\examples{
class_api_key_security_scheme(
  parameter_name = "Authorization",
  location = "header"
)
}
\seealso{
security scheme objects
\code{\link{as_api_key_security_scheme}()},
\code{\link{as_oauth2_authorization_code_flow}()},
\code{\link{as_oauth2_implicit_flow}()},
\code{\link{as_oauth2_security_scheme}()},
\code{\link{as_oauth2_token_flow}()},
\code{\link{as_scopes}()},
\code{\link{as_security_scheme}()},
\code{\link{as_security_scheme_details}()},
\code{\link{as_security_schemes}()},
\code{\link{class_oauth2_authorization_code_flow}()},
\code{\link{class_oauth2_implicit_flow}()},
\code{\link{class_oauth2_security_scheme}()},
\code{\link{class_oauth2_token_flow}()},
\code{\link{class_scopes}()},
\code{\link{class_security_scheme_details}()},
\code{\link{class_security_schemes}()}

components object
\code{\link{as_api_key_security_scheme}()},
\code{\link{as_components}()},
\code{\link{as_oauth2_authorization_code_flow}()},
\code{\link{as_oauth2_implicit_flow}()},
\code{\link{as_oauth2_security_scheme}()},
\code{\link{as_oauth2_token_flow}()},
\code{\link{as_reference}()},
\code{\link{as_schema}()},
\code{\link{as_scopes}()},
\code{\link{as_security_scheme}()},
\code{\link{as_security_scheme_details}()},
\code{\link{as_security_schemes}()},
\code{\link{class_components}()},
\code{\link{class_oauth2_authorization_code_flow}()},
\code{\link{class_oauth2_implicit_flow}()},
\code{\link{class_oauth2_security_scheme}()},
\code{\link{class_oauth2_token_flow}()},
\code{\link{class_reference}()},
\code{\link{class_schema}()},
\code{\link{class_scopes}()},
\code{\link{class_security_scheme_details}()},
\code{\link{class_security_schemes}()}
}
\concept{components}
\concept{components_security_schemes}
