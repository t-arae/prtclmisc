
<!-- README.md is generated from README.Rmd. Please edit that file -->

# prtclmisc

<!-- badges: start -->

<!-- badges: end -->

The goal of prtclmisc is to …

## Installation

You can install the development version of prtclmisc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("t-arae/prtclmisc")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(prtclmisc)
## basic example code

"
20.0 uL, 20 mL
10%
10℃
" %>% replace_all_siunit() %>% cat()
#> 
#> 20.0 \si{\uL}, 20 mL
#> 10\si{\percent}
#> 10\si{\degreeCelsius}
```
