
#' Replace all SI unit to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_uL("20.0 uL")
#'
replace_all_siunit <-
  function(string){
    string %>%
      replace_all_uL() %>%
      replace_all_mL() %>%
      replace_all_g() %>%
      replace_all_ug() %>%
      replace_all_ugmL() %>%
      replace_all_celcius() %>%
      replace_all_percent()
  }

#' Replace all "uL" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_uL("20.0 uL")
#'
replace_all_uL <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "\\d+ uL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "uL", "\\si{\\uL}")
    )
  }

#' Replace all "mL" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_mL("20.0 mL")
#'
replace_all_mL <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "\\d+ mL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "mL", "\\si{\\mL}")
    )
  }

#' Replace all "g" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_g("20.0 g")
#'
replace_all_g <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "\\d+ g([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "g", "\\si{\\g}")
    )
  }

#' Replace all "ug" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_ug("20.0 ug")
#'
replace_all_ug <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "\\d+ ug([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "ug", "\\si{\\ug}")
    )
  }

#' Replace all "ug/mL" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_ugmL("20.0 ug/mL")
#'
replace_all_ugmL <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "\\d+ ug/mL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "ug/mL", "\\si{\\ug}/\\si{\\mL}")
    )
  }

# stringi::stri_escape_unicode("℃")

#' Replace all "℃" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_celcius("20℃")
#'
replace_all_celcius <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "\u2103",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "\u2103", "\\si{\\degreeCelsius}")
    )
  }

#' Replace all "\%" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_percent("20%")
#'
replace_all_percent <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`]%",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "%", "\\si{\\percent}")
    )
  }

