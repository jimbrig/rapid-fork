# servers() returns an empty server

    Code
      test_result <- servers()
      test_result
    Output
      <rapid::servers>
       @ url        : chr(0) 
       @ description: chr(0) 
       @ variables  : <rapid::server_variables>  list()

# as_servers() errors informatively for unnamed or misnamed input

    Code
      as_servers(list(letters))
    Condition <purrr_error_indexed>
      Error in `purrr::map()`:
      i In index: 1.
      Caused by error in `as_servers()`:
      ! `x[[i]]` must have names "url", "description", or "variables".
      * Any other names are ignored.

---

    Code
      as_servers(list(list(a = "https://example.com", b = "A cool server.")))
    Condition <purrr_error_indexed>
      Error in `purrr::map()`:
      i In index: 1.
      Caused by error in `as_servers()`:
      ! `x[[i]]` must have names "url", "description", or "variables".
      * Any other names are ignored.

# as_servers() errors informatively for bad classes

    Code
      as_servers(1:2)
    Condition <rlang_error>
      Error:
      ! Can't coerce `x` <integer> to <servers>.

---

    Code
      as_servers(mean)
    Condition <rlang_error>
      Error:
      ! Can't coerce `x` <function> to <servers>.

---

    Code
      as_servers(TRUE)
    Condition <rlang_error>
      Error:
      ! Can't coerce `x` <logical> to <servers>.

