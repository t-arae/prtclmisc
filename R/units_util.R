
#' convert unit to another
#' @param x units object
#' @param u unit string
#' @export
units_to <- function(x, u){
  units(x) <- u
  x
}

# cat_units <- function(x){
#   cat(units::drop_units(x), " ", units::deparse_unit(x), "\n", sep = "")
# }
