
#' Replace all "L" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_L("20.0 L")
#'
replace_all_L <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] L",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "L", "\\si{\\L}")
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
      pattern = "[\\d`] mL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "mL", "\\si{\\mL}")
    )
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
      pattern = "[\\d`] uL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "uL", "\\si{\\uL}")
    )
  }


#' Replace all "nL" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_nL("20.0 nL")
#'
replace_all_nL <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] nL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "nL", "\\si{\\nL}")
    )
  }


#' Replace all "pL" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_pL("20.0 pL")
#'
replace_all_pL <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] pL",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "pL", "\\si{\\pL}")
    )
  }

