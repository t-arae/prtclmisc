
#' Replace all SI unit to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_uL("20.0 uL")
#'
replace_all_siunit <-
  function(string){
    string %>%
      # L functions
      replace_all_L() %>%
      replace_all_mL() %>%
      replace_all_uL() %>%
      replace_all_nL() %>%
      replace_all_pL() %>%
      # gram functions
      replace_all_kg() %>%
      replace_all_g() %>%
      replace_all_mg() %>%
      replace_all_ug() %>%
      replace_all_ng() %>%
      replace_all_pg() %>%
      # molar functions
      replace_all_M() %>%
      replace_all_mM() %>%
      replace_all_uM() %>%
      replace_all_nM() %>%
      replace_all_pM() %>%
      #
      replace_all_ugmL() %>%
      replace_all_celcius() %>%
      replace_all_percent()
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
      pattern = "[\\d`] ug/mL",
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

