
units_conv <-
  tibble::tribble(
    ~deparsed, ~print_units,
    "g 100mL-1", "w/v%",
    "g 100g-1", "w/w%",
    "mL 100mL-1", "v/v%",

    "g L-1", " g/L",
    "g mL-1", " g/mL",
    "mg L-1", " mg/L",
    "mg mL-1", " mg/mL",
    "mg mL-1", " mg/mL",
    "ug L-1", " ug/L",
    "ug mL-1", " ug/mL",
    "ug uL-1", " ug/uL",
    "ng mL-1", " ng/mL",
    "ng uL-1", " ng/uL",
    "pg uL-1", " pg/uL",

    "mol L-1", " M",
    "mmol L-1", " mM",
    "umol L-1", " uM",
    "nmol L-1", " nM",
    "pmol L-1", " pM",

    "g mol-1", " g/mol"
  ) %>%
  {setNames(.[[2]], .[[1]])}

#' print value with units
#' @param x x
#' @param digits integer
#' @export
p <- function(x, digits = 6) {
  if(class(x) == "units") {
    u <- units::deparse_unit(x)
    if(u %in% names(units_conv)) {
      u <- units_conv[u]
    } else {
      u <- paste0(" ", u)
    }
    return(paste0(signif(x, digits), u))
  } else {
    return(x)
  }
}

