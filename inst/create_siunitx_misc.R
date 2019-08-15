
### unitsパッケージのヘルパー関数を定義するRファイルを作成。

library(tidyverse)

### gram functions

g_unit <- c("kg", "g", "mg", "ug", "ng", "pg")
g_pattern <- paste0("[\\\\d`] ", g_unit, "([^/]|$)")
g_sicmd <- paste0("\\\\si{\\\\", g_unit, "}")

template <- read_lines("inst/template_replace_all_siunit.txt")
g_functions <-
  map(g_unit, ~ str_replace_all(template, "UNIT_IS_HERE", .x)) %>%
  map2(g_pattern, ~ stringi::stri_replace_all_fixed(.x, "PATTERN_IS_HERE", .y)) %>%
  map2(g_sicmd, ~ stringi::stri_replace_all_fixed(.x, "SICMD_IS_HERE", .y)) %>%
  unlist

#cat(g_functions, sep = "\n")
write_lines(g_functions, path = "R/siunitx_g.R")

### L functions

L_unit <- c("L", "mL", "uL", "nL", "pL")
# L_pattern <- paste0("[\\\\d`] ", L_unit, "([^/]|$)")
L_pattern <- paste0("[\\\\d`] ", L_unit)
L_sicmd <- paste0("\\\\si{\\\\", L_unit, "}")

template <- read_lines("inst/template_replace_all_siunit.txt")
L_functions <-
  map(L_unit, ~ str_replace_all(template, "UNIT_IS_HERE", .x)) %>%
  map2(L_pattern, ~ stringi::stri_replace_all_fixed(.x, "PATTERN_IS_HERE", .y)) %>%
  map2(L_sicmd, ~ stringi::stri_replace_all_fixed(.x, "SICMD_IS_HERE", .y)) %>%
  unlist

#cat(L_functions, sep = "\n")
write_lines(L_functions, path = "R/siunitx_L.R")
