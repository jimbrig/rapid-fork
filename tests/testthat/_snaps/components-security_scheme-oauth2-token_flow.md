# oauth2_token_flow() requires compatible lengths

    Code
      oauth2_token_flow(refresh_url = "a")
    Condition
      Error:
      ! <rapid::oauth2_token_flow> object is invalid:
      - When `token_url` is not defined, `refresh_url` must be empty.
      - `refresh_url` has 1 value.

---

    Code
      oauth2_token_flow(scopes = c(a = "a"))
    Condition
      Error:
      ! <rapid::oauth2_token_flow> object is invalid:
      - When `token_url` is not defined, `scopes` must be empty.
      - `scopes` has 1 value.

# oauth2_token_flow() returns an empty oauth2_token_flow

    Code
      oauth2_token_flow()
    Output
      <rapid::oauth2_token_flow>
       @ refresh_url: chr(0) 
       @ scopes     : <rapid::scopes>
       .. @ name       : chr(0) 
       .. @ description: chr(0) 
       @ token_url  : chr(0) 

# oauth2_token_flow() requires names for optionals

    Code
      oauth2_token_flow("a", "b", "c")
    Condition
      Error in `oauth2_token_flow()`:
      ! `...` must be empty.
      x Problematic arguments:
      * ..1 = "b"
      * ..2 = "c"
      i Did you forget to name an argument?

---

    Code
      oauth2_token_flow("a", refresh_url = "c", c(d = "d"))
    Condition
      Error in `oauth2_token_flow()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = c(d = "d")
      i Did you forget to name an argument?

# oauth2_token_flow() errors informatively for bad classes

    Code
      oauth2_token_flow(mean)
    Condition
      Error:
      ! <rapid::oauth2_token_flow> object properties are invalid:
      - @token_url must be <character>, not <closure>

---

    Code
      oauth2_token_flow("a", refresh_url = mean)
    Condition
      Error in `oauth2_token_flow()`:
      ! Can't coerce `refresh_url` <function> to <character>.

---

    Code
      oauth2_token_flow("a", refresh_url = "c", scopes = "d")
    Condition
      Error:
      ! `scopes` must be a named character vector.

# oauth2_token_flow() returns expected objects

    Code
      test_result <- oauth2_token_flow(token_url = "https://auth.ebay.com/oauth2/token",
        scopes = c(sell.account = "View and manage your account settings",
          sell.account.readonly = "View your account settings"), refresh_url = "https://api.ebay.com/identity/v1/oauth2/refresh")
      test_result
    Output
      <rapid::oauth2_token_flow>
       @ refresh_url: chr "https://api.ebay.com/identity/v1/oauth2/refresh"
       @ scopes     : <rapid::scopes>
       .. @ name       : chr [1:2] "sell.account" "sell.account.readonly"
       .. @ description: chr [1:2] "View and manage your account settings" ...
       @ token_url  : chr "https://auth.ebay.com/oauth2/token"

# as_oauth2_token_flow() errors for unnamed input

    Code
      as_oauth2_token_flow(list("Jon", "jonthegeek@gmail.com"))
    Condition
      Error:
      ! `x` must have names "refresh_url", "scopes", or "token_url".
      * Any other names are ignored.

# as_oauth2_token_flow() errors informatively for bad classes

    Code
      as_oauth2_token_flow(1:2)
    Condition
      Error:
      ! Can't coerce `1:2` <integer> to <oauth2_token_flow>.

---

    Code
      as_oauth2_token_flow(mean)
    Condition
      Error:
      ! Can't coerce `mean` <function> to <oauth2_token_flow>.

---

    Code
      as_oauth2_token_flow(TRUE)
    Condition
      Error:
      ! Can't coerce `TRUE` <logical> to <oauth2_token_flow>.

