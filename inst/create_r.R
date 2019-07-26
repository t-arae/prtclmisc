
# install.packages("units")

library(units)
library(tidyverse)

g_family <- c("kg", "g", "mg", "ug", "ng")

template <- read_lines("inst/template.txt")
g_functions <-
  map(g_family, ~ str_replace_all(template, "unit_is_here", .x)) %>%
  unlist
write_lines(g_functions, path = "R/g.R")

mol_family <- c("mol", "mmol", "umol", "nmol")
mol_functions <-
  map(mol_family, ~ str_replace_all(template, "unit_is_here", .x)) %>%
  unlist
write_lines(mol_functions, path = "R/mol.R")

mw <- c("mw")
mw_function <-
  template %>%
  str_replace("unit_is_here", "mw") %>%
  str_replace("unit_is_here", "g/mol")
write_lines(mw_function, path = "R/mw.R")

L_family <- c("L", "mL", "uL")
L_functions <-
  map(L_family, ~ str_replace_all(template, "unit_is_here", .x)) %>%
  unlist
write_lines(L_functions, path = "R/L.R")

g_conc_family2 <- c("g/L", "mg/L", "ug/L", "g/mL", "mg/mL", "ug/mL")
g_conc_family1 <- g_conc_family2 %>% str_remove("/")
g_conc_functions <-
  map(g_conc_family1, ~ str_replace(template, "unit_is_here", .x)) %>%
  map2(g_conc_family2, ~ str_replace(.x, "unit_is_here", .y)) %>%
  unlist()
write_lines(g_conc_functions, path = "R/g_conc.R")

M_family1 <- c("M", "mM", "uM", "nM")
M_family2 <- c("mol/L", "mmol/L", "umol/L", "nmol/L")
M_functions <-
  map(M_family1, ~ str_replace(template, "unit_is_here", .x)) %>%
  map2(M_family2, ~ str_replace(.x, "unit_is_here", .y)) %>%
  unlist()
write_lines(M_functions, path = "R/M.R")

percent_family1 <- c("ww_percent", "wv_percent", "vv_percent")
percent_family2 <- c("g/100g", "g/100mL", "mL/100mL")
percent_functions <-
  map(percent_family1, ~ str_replace(template, "unit_is_here", .x)) %>%
  map2(percent_family2, ~ str_replace(.x, "unit_is_here", .y)) %>%
  unlist()
write_lines(percent_functions, path = "R/percent.R")

# kg <- function(x) units::set_units(x, "kg")
# g <- function(x) units::set_units(x, "g")
# mg <- function(x) units::set_units(x, "mg")
# ug <- function(x) units::set_units(x, "ug")
# ng <- function(x) units::set_units(x, "ng")

# mol <- function(x) units::set_units(x, "mol")
# mmol <- function(x) units::set_units(x, "mmol")
# umol <- function(x) units::set_units(x, "umol")
# nmol <- function(x) units::set_units(x, "nmol")

# mw <- function(x) units::set_units(x, "g/mol")

# L <- function(x) units::set_units(x, "L")
# mL <- function(x) units::set_units(x, "mL")
# uL <- function(x) units::set_units(x, "uL")
# nL <- function(x) units::set_units(x, "nL")

# gL <- function(x) units::set_units(x, "g/L")
# mgL <- function(x) units::set_units(x, "mg/L")
# ugL <- function(x) units::set_units(x, "ug/L")
# gmL <- function(x) units::set_units(x, "g/mL")
# mgmL <- function(x) units::set_units(x, "mg/mL")
# ugmL <- function(x) units::set_units(x, "ug/mL")

# M <- function(x) units::set_units(x, "mol/L")
# mM <- function(x) units::set_units(x, "mmol/L")
# uM <- function(x) units::set_units(x, "umol/L")
# nM <- function(x) units::set_units(x, "nmol/L")

# ww_percent <- function(x) units::set_units(x, "g/100g")
# wv_percent <- function(x) units::set_units(x, "g/100mL")
# vv_percent <- function(x) units::set_units(x, "mL/100mL")


# Na <- 123 %>% mw
# Na %>% units::deparse_unit()
# (mM(200) * mL(0.2) * Na) %>% convert_to("mg")
# (mM(200) * mL(0.2) * Na) %>% units::set_units("mg")
# (mM(200) * mL(0.2) * Na) %>% cat_units()
# (mM(200) * mL(0.2) * Na) %>% convert_to("mg") %>% cat_units()

