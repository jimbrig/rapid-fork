#' Details of API security schemes
#'
#' The object provides a list of details of security schemes for the API. Each
#' element within the list is an [abstract_security_scheme()] object.
#'
#' @param ... One or more [abstract_security_scheme()] objects or a list of such
#'   objects. These objects must be generated by
#'   [class_api_key_security_scheme()] or [class_oauth2_security_scheme()]
#'   (`http_security_scheme()` and `open_id_connect_security_scheme()` coming
#'   soon).
#'
#' @return A `security_scheme_details` object, which is a validated list of
#'   [abstract_security_scheme()] objects.
#' @export
#' @family components_security_schemes
#' @family components
#'
#' @examples
#' class_security_scheme_details(
#'   class_oauth2_security_scheme(
#'     password_flow = class_oauth2_token_flow(
#'       token_url = "/account/authorization",
#'       scopes = class_scopes(
#'         name = c("Catalog", "Commerce", "Playback", "Settings"),
#'         description = c(
#'           "Access all read-only content",
#'           "Perform account-level transactions",
#'           "Allow playback of restricted content",
#'           "Modify account settings"
#'         )
#'       )
#'     )
#'   ),
#'   class_oauth2_security_scheme(
#'     password_flow = class_oauth2_token_flow(
#'       token_url = "/account/profile/authorization",
#'       scopes = class_scopes(
#'         name = "Catalog",
#'         description = "Modify profile preferences and activity"
#'       )
#'     )
#'   ),
#'   class_api_key_security_scheme(
#'     parameter_name = "authorization",
#'     location = "header"
#'   ),
#'   class_api_key_security_scheme(
#'     parameter_name = "authorization",
#'     location = "header"
#'   )
#' )
class_security_scheme_details <- S7::new_class(
  "security_scheme_details",
  package = "rapid",
  parent = class_list,
  constructor = function(...) {
    if (...length() == 1 && is.list(..1)) {
      return(S7::new_object(..1))
    }
    S7::new_object(list(...))
  },
  validator = function(self) {
    bad_security_schemes <- !purrr::map_lgl(
      S7::S7_data(self),
      ~ S7_inherits(.x, abstract_security_scheme) || is.null(.x)
    )
    if (any(bad_security_schemes)) {
      bad_locations <- which(bad_security_schemes)
      c(
        cli::format_inline(
          "All values must be {.cls security_scheme} objects."
        ),
        cli::format_inline("Bad values at {bad_locations}.")
      )
    }
  }
)

#' Coerce lists to security_scheme_details objects
#'
#' `as_security_scheme_details()` turns an existing object into a
#' `security_scheme_details` object. This is in contrast with
#' [class_security_scheme_details()], which builds a `security_scheme_details`
#' from individual properties.
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#' @param x The object to coerce. Must be empty or be a named list, where each
#'   element describes a security scheme object. This object should describe the
#'   security schemes for a single API.
#'
#' @return A `security_scheme_details` object as returned by
#'   [class_security_scheme_details()].
#' @export
#' @family components_security_schemes
#' @family components
#'
#' @examples
#' as_security_scheme_details()
#' as_security_scheme_details(
#'   list(
#'     accountAuth = list(
#'       description = "Account JWT token",
#'       flows = list(
#'         password = list(
#'           scopes = list(
#'             Catalog = "Access all read-only content",
#'             Commerce = "Perform account-level transactions",
#'             Playback = "Allow playback of restricted content",
#'             Settings = "Modify account settings"
#'           ),
#'           tokenUrl = "/account/authorization"
#'         )
#'       ),
#'       type = "oauth2"
#'     ),
#'     profileAuth = list(
#'       description = "Profile JWT token",
#'       flows = list(
#'         password = list(
#'           scopes = list(
#'             Catalog = "Modify profile preferences and activity"
#'           ),
#'           tokenUrl = "/account/profile/authorization"
#'         )
#'       ),
#'       type = "oauth2"
#'     ),
#'     resetPasswordAuth = list(
#'       `in` = "header",
#'       name = "authorization",
#'       type = "apiKey"
#'     ),
#'     verifyEmailAuth = list(
#'       `in` = "header",
#'       name = "authorization",
#'       type = "apiKey"
#'     )
#'   )
#' )
as_security_scheme_details <- S7::new_generic("as_security_scheme_details", "x")

S7::method(
  as_security_scheme_details,
  class_list
) <- function(x, ..., arg = caller_arg(x), call = caller_env()) {
  if (!length(x) || !any(lengths(x))) {
    return(class_security_scheme_details())
  }
  class_security_scheme_details(
    purrr::map(
      unname(x),
      function(x) {
        as_security_scheme(x, ..., arg = arg, call = call)
      }
    )
  )
}

S7::method(
  as_security_scheme_details,
  class_any
) <- function(x, ..., arg = caller_arg(x), call = caller_env()) {
  as_api_object(x, class_security_scheme_details, ..., arg = arg, call = call)
}
