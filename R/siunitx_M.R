
#' Replace all "M" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_M("20.0 M")
#'
replace_all_M <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] M",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "M", "\\si{\\Molar}")
    )
  }


#' Replace all "mM" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_mM("20.0 mM")
#'
replace_all_mM <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] mM",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "mM", "\\si{\\milli\\Molar}")
    )
  }


#' Replace all "uM" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_uM("20.0 uM")
#'
replace_all_uM <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] uM",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "uM", "\\si{\\micro\\Molar}")
    )
  }


#' Replace all "nM" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_nM("20.0 nM")
#'
replace_all_nM <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] nM",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "nM", "\\si{\\nano\\Molar}")
    )
  }


#' Replace all "pM" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_pM("20.0 pM")
#'
replace_all_pM <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] pM",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "pM", "\\si{\\pico\\Molar}")
    )
  }

