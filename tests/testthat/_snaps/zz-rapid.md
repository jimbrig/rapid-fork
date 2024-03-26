# class_rapid() requires info objects for info

    Code
      class_rapid(info = mean)
    Condition
      Error in `class_rapid()`:
      ! Can't coerce `info` <function> to <rapid::info>.

# class_rapid() requires info when anything is defined

    Code
      class_rapid(servers = class_servers(url = c(
        "https://development.gigantic-server.com/v1",
        "https://staging.gigantic-server.com/v1",
        "https://api.gigantic-server.com/v1"), description = c("Development server",
        "Staging server", "Production server")))
    Condition
      Error:
      ! <rapid::rapid> object is invalid:
      - When `info` is not defined, `servers` must be empty.
      - `servers` has 3 values.

# security must reference components@security_schemes

    Code
      class_rapid(info = class_info(title = "A", version = "1"), components = class_components(
        security_schemes = class_security_schemes(name = "the_defined_one", details = class_security_scheme_details(
          class_api_key_security_scheme("this_one", location = "header")))),
      security = class_security(name = "an_undefined_one"))
    Condition
      Error:
      ! <rapid::rapid> object is invalid:
      - `security` must be one of the `security_schemes` defined in `components`.
      - "an_undefined_one" is not in "the_defined_one".

# class_rapid() returns an empty rapid

    Code
      test_result <- class_rapid()
      test_result
    Output
      <rapid::rapid>
       @ info      : <rapid::info>
       .. @ title           : chr(0) 
       .. @ version         : chr(0) 
       .. @ contact         : <rapid::contact>
       .. .. @ name : chr(0) 
       .. .. @ email: chr(0) 
       .. .. @ url  : chr(0) 
       .. @ description     : chr(0) 
       .. @ license         : <rapid::license>
       .. .. @ name      : chr(0) 
       .. .. @ identifier: chr(0) 
       .. .. @ url       : chr(0) 
       .. @ summary         : chr(0) 
       .. @ terms_of_service: chr(0) 
       .. @ origin          : <rapid::origin>
       .. .. @ url    : chr(0) 
       .. .. @ format : chr(0) 
       .. .. @ version: chr(0) 
       @ servers   : <rapid::servers>
       .. @ url        : chr(0) 
       .. @ description: chr(0) 
       .. @ variables  : <rapid::server_variables>  list()
       @ components: <rapid::components>
       .. @ security_schemes: <rapid::security_schemes>
       .. .. @ name       : chr(0) 
       .. .. @ details    : <rapid::security_scheme_details>  list()
       .. .. @ description: chr(0) 
       @ paths     :Classes 'rapid::paths', 'S7_object' and 'data.frame':	0 obs. of  0 variables
       <rapid::paths>  Named list()
       @ security  : <rapid::security>
       .. @ name                   : chr(0) 
       .. @ required_scopes        : list()
       .. @ rapid_class_requirement: chr "security_scheme"

# as_rapid() errors informatively for bad classes

    Code
      as_rapid(1:2)
    Condition
      Error in `as_rapid()`:
      ! Can't coerce `1:2` <integer> to <rapid::rapid>.

---

    Code
      as_rapid(mean)
    Condition
      Error in `as_rapid()`:
      ! Can't coerce `mean` <function> to <rapid::rapid>.

---

    Code
      as_rapid(TRUE)
    Condition
      Error in `as_rapid()`:
      ! Can't coerce `TRUE` <logical> to <rapid::rapid>.

# as_rapid() errors informatively for unnamed input

    Code
      as_rapid(list(letters))
    Condition
      Error:
      ! `x` must be comprised of properly formed, supported elements.
      Caused by error in `as_rapid()`:
      ! `<named list>` must have names "info", "servers", "components", "paths", or "security".
      * Any other names are ignored.

---

    Code
      as_rapid(list(list("https://example.com", "A cool server.")))
    Condition
      Error:
      ! `x` must be comprised of properly formed, supported elements.
      Caused by error in `as_rapid()`:
      ! `<named list>` must have names "info", "servers", "components", "paths", or "security".
      * Any other names are ignored.

# as_rapid() works for yaml urls

    Code
      test_result
    Output
      <rapid::rapid>
       @ info      : <rapid::info>
       .. @ title           : chr "OpenFEC"
       .. @ version         : chr "1.0"
       .. @ contact         : <rapid::contact>
       .. .. @ name : chr(0) 
       .. .. @ email: chr(0) 
       .. .. @ url  : chr(0) 
       .. @ description     : chr "This application programming interface (API) allows you to explore the way candidates and committees fund their"| __truncated__
       .. @ license         : <rapid::license>
       .. .. @ name      : chr(0) 
       .. .. @ identifier: chr(0) 
       .. .. @ url       : chr(0) 
       .. @ summary         : chr(0) 
       .. @ terms_of_service: chr(0) 
       .. @ origin          : <rapid::origin>
       .. .. @ url    : chr "https://api.open.fec.gov/swagger/"
       .. .. @ format : chr "openapi"
       .. .. @ version: chr "3.0"
       @ servers   : <rapid::servers>
       .. @ url        : chr "https://api.open.fec.gov/v1"
       .. @ description: chr(0) 
       .. @ variables  : <rapid::server_variables>  list()
       @ components: <rapid::components>
       .. @ security_schemes: <rapid::security_schemes>
       .. .. @ name       : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. .. @ details    : <rapid::security_scheme_details> List of 3
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "X-Api-Key"
       .. .. ..  ..@ location      : chr "header"
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "api_key"
       .. .. ..  ..@ location      : chr "query"
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "api_key"
       .. .. ..  ..@ location      : chr "query"
       .. .. @ description: chr(0) 
       @ paths     :Classes 'rapid::paths', 'S7_object' and 'data.frame':	3 obs. of  2 variables:
       <rapid::paths> List of 2
       .. $ endpoint  : chr [1:3] "a" "b" "c"
       .. $ operations:List of 3
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       @ security  : <rapid::security>
       .. @ name                   : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. @ required_scopes        :List of 3
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. @ rapid_class_requirement: chr "security_scheme"

# as_rapid() works for json urls

    Code
      test_result
    Output
      <rapid::rapid>
       @ info      : <rapid::info>
       .. @ title           : chr "OpenFEC"
       .. @ version         : chr "1.0"
       .. @ contact         : <rapid::contact>
       .. .. @ name : chr(0) 
       .. .. @ email: chr(0) 
       .. .. @ url  : chr(0) 
       .. @ description     : chr "This application programming interface (API) allows you to explore the way candidates and committees fund their"| __truncated__
       .. @ license         : <rapid::license>
       .. .. @ name      : chr(0) 
       .. .. @ identifier: chr(0) 
       .. .. @ url       : chr(0) 
       .. @ summary         : chr(0) 
       .. @ terms_of_service: chr(0) 
       .. @ origin          : <rapid::origin>
       .. .. @ url    : chr "https://api.open.fec.gov/swagger/"
       .. .. @ format : chr "openapi"
       .. .. @ version: chr "3.0"
       @ servers   : <rapid::servers>
       .. @ url        : chr "https://api.open.fec.gov/v1"
       .. @ description: chr(0) 
       .. @ variables  : <rapid::server_variables>  list()
       @ components: <rapid::components>
       .. @ security_schemes: <rapid::security_schemes>
       .. .. @ name       : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. .. @ details    : <rapid::security_scheme_details> List of 3
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "X-Api-Key"
       .. .. ..  ..@ location      : chr "header"
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "api_key"
       .. .. ..  ..@ location      : chr "query"
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "api_key"
       .. .. ..  ..@ location      : chr "query"
       .. .. @ description: chr(0) 
       @ paths     :Classes 'rapid::paths', 'S7_object' and 'data.frame':	3 obs. of  2 variables:
       <rapid::paths> List of 2
       .. $ endpoint  : chr [1:3] "a" "b" "c"
       .. $ operations:List of 3
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       @ security  : <rapid::security>
       .. @ name                   : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. @ required_scopes        :List of 3
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. @ rapid_class_requirement: chr "security_scheme"

# as_rapid() stores origin info for urls

    Code
      test_result
    Output
      <rapid::rapid>
       @ info      : <rapid::info>
       .. @ title           : chr "OpenFEC"
       .. @ version         : chr "1.0"
       .. @ contact         : <rapid::contact>
       .. .. @ name : chr(0) 
       .. .. @ email: chr(0) 
       .. .. @ url  : chr(0) 
       .. @ description     : chr "This application programming interface (API) allows you to explore the way candidates and committees fund their"| __truncated__
       .. @ license         : <rapid::license>
       .. .. @ name      : chr(0) 
       .. .. @ identifier: chr(0) 
       .. .. @ url       : chr(0) 
       .. @ summary         : chr(0) 
       .. @ terms_of_service: chr(0) 
       .. @ origin          : <rapid::origin>
       .. .. @ url    : chr "https://api.open.fec.gov/swagger/"
       .. .. @ format : chr(0) 
       .. .. @ version: chr(0) 
       @ servers   : <rapid::servers>
       .. @ url        : chr(0) 
       .. @ description: chr(0) 
       .. @ variables  : <rapid::server_variables>  list()
       @ components: <rapid::components>
       .. @ security_schemes: <rapid::security_schemes>
       .. .. @ name       : chr(0) 
       .. .. @ details    : <rapid::security_scheme_details>  list()
       .. .. @ description: chr(0) 
       @ paths     :Classes 'rapid::paths', 'S7_object' and 'data.frame':	0 obs. of  0 variables
       <rapid::paths>  Named list()
       @ security  : <rapid::security>
       .. @ name                   : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. @ required_scopes        :List of 3
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. @ rapid_class_requirement: chr "security_scheme"

# as_rapid() works for empty optional fields

    Code
      test_result
    Output
      <rapid::rapid>
       @ info      : <rapid::info>
       .. @ title           : chr "OpenFEC"
       .. @ version         : chr "1.0"
       .. @ contact         : <rapid::contact>
       .. .. @ name : chr(0) 
       .. .. @ email: chr(0) 
       .. .. @ url  : chr(0) 
       .. @ description     : chr "This application programming interface (API) allows you to explore the way candidates and committees fund their"| __truncated__
       .. @ license         : <rapid::license>
       .. .. @ name      : chr(0) 
       .. .. @ identifier: chr(0) 
       .. .. @ url       : chr(0) 
       .. @ summary         : chr(0) 
       .. @ terms_of_service: chr(0) 
       .. @ origin          : <rapid::origin>
       .. .. @ url    : chr "https://api.open.fec.gov/swagger/"
       .. .. @ format : chr "openapi"
       .. .. @ version: chr "3.0"
       @ servers   : <rapid::servers>
       .. @ url        : chr "https://api.open.fec.gov/v1"
       .. @ description: chr(0) 
       .. @ variables  : <rapid::server_variables>  list()
       @ components: <rapid::components>
       .. @ security_schemes: <rapid::security_schemes>
       .. .. @ name       : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. .. @ details    : <rapid::security_scheme_details> List of 3
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "X-Api-Key"
       .. .. ..  ..@ location      : chr "header"
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "api_key"
       .. .. ..  ..@ location      : chr "query"
       .. .. .. $ : <rapid::api_key_security_scheme>
       .. .. ..  ..@ parameter_name: chr "api_key"
       .. .. ..  ..@ location      : chr "query"
       .. .. @ description: chr(0) 
       @ paths     :Classes 'rapid::paths', 'S7_object' and 'data.frame':	3 obs. of  2 variables:
       <rapid::paths> List of 2
       .. $ endpoint  : chr [1:3] "a" "b" "c"
       .. $ operations:List of 3
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       ..  ..$ : tibble [0 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
       @ security  : <rapid::security>
       .. @ name                   : chr [1:3] "ApiKeyHeaderAuth" "ApiKeyQueryAuth" "apiKey"
       .. @ required_scopes        :List of 3
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. .. $ : chr(0) 
       .. @ rapid_class_requirement: chr "security_scheme"

