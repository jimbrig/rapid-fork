#' @include servers-string_replacements.R
#' @include servers-server_variables.R
NULL

#' An object representing a collection of servers
#'
#' The object provides connectivity information for the API. The described
#' servers are intended to be used as the base urls for calls to the API.
#'
#' @param url Character vector (required). The urls of the target hosts. These
#'   urls support [class_string_replacements()]. Variable substitutions will be
#'   made when a variable is named in \{brackets\}.
#' @param description Character vector (optional). Strings describing the hosts
#'   designated by `url`. [CommonMark syntax](https://spec.commonmark.org/) may
#'   be used for rich text representation.
#' @param variables A [class_server_variables()] object.
#'
#' @return A `servers` S7 object, with properties `url`, `description`, and
#'   `variables`.
#' @export
#' @family servers
#'
#' @examples
#' class_servers(
#'   url = c(
#'     "https://development.gigantic-server.com/v1",
#'     "https://staging.gigantic-server.com/v1",
#'     "https://api.gigantic-server.com/v1"
#'   ),
#'   description = c(
#'     "Development server",
#'     "Staging server",
#'     "Production server"
#'   )
#' )
#' class_servers(
#'   url = "https://{username}.gigantic-server.com:{port}/{basePath}",
#'   description = "The production API server",
#'   variables = class_server_variables(class_string_replacements(
#'     name = c("username", "port", "basePath"),
#'     default = c("demo", "8443", "v2"),
#'     description = c(
#'       "The active user's folder.",
#'       NA, NA
#'     ),
#'     enum = list(
#'       NULL,
#'       c("8443", "443"),
#'       NULL
#'     )
#'   ))
#' )
class_servers <- S7::new_class(
  "servers",
  package = "rapid",
  properties = list(
    url = class_character,
    description = class_character,
    variables = class_server_variables
  ),
  constructor = function(url = character(),
                         description = character(),
                         variables = class_server_variables()) {
    S7::new_object(
      S7::S7_object(),
      url = url %||% character(),
      description = description %||% character(),
      variables = as_server_variables(variables)
    )
  },
  validator = function(self) {
    validate_parallel(
      self,
      "url",
      optional = c("description", "variables")
    )
  }
)

S7::method(length, class_servers) <- function(x) {
  length(x@url)
}

#' Coerce lists and character vectors to servers
#'
#' `as_servers()` turns an existing object into a `servers` object. This is in
#' contrast with [class_servers()], which builds a `servers` object from
#' individual properties.
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#' @param x The object to coerce. Must be empty or have names "name", "email",
#'   and/or "url", or names that can be coerced to those names via
#'   [snakecase::to_snake_case()]. Extra names are ignored.
#'
#' @return A `servers` object as returned by [class_servers()].
#' @export
#' @family servers
#'
#' @examples
#' as_servers()
#' as_servers(
#'   list(
#'     list(
#'       url = "https://development.gigantic-server.com/v1",
#'       description = "Development server"
#'     ),
#'     list(
#'       url = "https://staging.gigantic-server.com/v1",
#'       description = "Staging server"
#'     ),
#'     list(
#'       url = "https://api.gigantic-server.com/v1",
#'       description = "Production server"
#'     )
#'   )
#' )
as_servers <- S7::new_generic("as_servers", "x")

S7::method(as_servers, class_list) <- function(x, ..., call = caller_env()) {
  x <- purrr::map(
    x,
    function(x) {
      .validate_for_as_class(
        x,
        class_servers,
        x_arg = "x[[i]]",
        call = call
      )
    }
  )
  if (!any(lengths(x))) {
    x <- NULL
  }

  class_servers(
    url = purrr::map_chr(x, "url"),
    description = .extract_along_chr(x, "description"),
    variables = as_server_variables(purrr::map(x, "variables"))
  )
}

S7::method(as_servers, class_any) <- function(x,
                                              ...,
                                              arg = caller_arg(x),
                                              call = caller_env()) {
  as_api_object(x, class_servers, ..., arg = arg, call = call)
}
