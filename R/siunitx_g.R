
#' Replace all "kg" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_kg("20.0 kg")
#'
replace_all_kg <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] kg([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "kg", "\\si{\\kg}")
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
      pattern = "[\\d`] g([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "g", "\\si{\\g}")
    )
  }


#' Replace all "mg" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_mg("20.0 mg")
#'
replace_all_mg <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] mg([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "mg", "\\si{\\mg}")
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
      pattern = "[\\d`] ug([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "ug", "\\si{\\ug}")
    )
  }


#' Replace all "ng" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_ng("20.0 ng")
#'
replace_all_ng <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] ng([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "ng", "\\si{\\ng}")
    )
  }


#' Replace all "pg" to tex siunitx command
#' @param string text
#' @export
#' @examples
#' replace_all_pg("20.0 pg")
#'
replace_all_pg <-
  function(string){
    stringr::str_replace_all(
      string = string,
      pattern = "[\\d`] pg([^/]|$)",
      replacement = function(x)
        stringi::stri_replace_all_fixed(x, "pg", "\\si{\\pg}")
    )
  }

