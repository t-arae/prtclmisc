
### unitsパッケージのヘルパー関数を定義するRファイルを作成。
### 濃度計算を楽に行うため。

# install.packages("units")

library(units)
library(tidyverse)

g_family <- c("kg", "g", "mg", "ug", "ng", "pg")

template <- read_lines("inst/template.txt")
g_functions <-
  map(g_family, ~ str_replace_all(template, "unit_is_here", .x)) %>%
  map2(g_family, ~ str_replace_all(.x, "unit_is__here", .y)) %>%
  unlist
write_lines(g_functions, path = "R/g.R")

mol_family <- c("mol", "mmol", "umol", "nmol", "pmol")
mol_functions <-
  map(mol_family, ~ str_replace_all(template, "unit_is_here", .x)) %>%
  map2(mol_family, ~ str_replace_all(.x, "unit_is__here", .y)) %>%
  unlist
write_lines(mol_functions, path = "R/mol.R")

mw <- c("mw")
mw_function <-
  template %>%
  str_replace("unit_is_here", "mw") %>%
  str_replace("unit_is__here", "g/mol")
write_lines(mw_function, path = "R/mw.R")

L_family <- c("L", "mL", "uL")
L_functions <-
  map(L_family, ~ str_replace_all(template, "unit_is_here", .x)) %>%
  map2(L_family, ~ str_replace_all(.x, "unit_is__here", .y)) %>%
  unlist
write_lines(L_functions, path = "R/L.R")

g_conc_family2 <- c("g/L", "mg/L", "ug/L", "g/mL", "mg/mL", "ug/mL", "ng/mL", "ug/uL", "ng/uL", "pg/uL")
g_conc_family1 <- g_conc_family2 %>% str_remove("/")
g_conc_functions <-
  map(g_conc_family1, ~ str_replace(template, "unit_is_here", .x)) %>%
  map2(g_conc_family2, ~ str_replace(.x, "unit_is__here", .y)) %>%
  unlist()
write_lines(g_conc_functions, path = "R/g_conc.R")

M_family1 <- c("M", "mM", "uM", "nM", "pM")
M_family2 <- c("mol/L", "mmol/L", "umol/L", "nmol/L", "pmol/L")
M_functions <-
  map(M_family1, ~ str_replace(template, "unit_is_here", .x)) %>%
  map2(M_family2, ~ str_replace(.x, "unit_is__here", .y)) %>%
  unlist()
write_lines(M_functions, path = "R/M.R")

percent_family1 <- c("ww_percent", "wv_percent", "vv_percent")
percent_family2 <- c("g/100g", "g/100mL", "mL/100mL")
percent_functions <-
  map(percent_family1, ~ str_replace(template, "unit_is_here", .x)) %>%
  map2(percent_family2, ~ str_replace(.x, "unit_is__here", .y)) %>%
  unlist()
write_lines(percent_functions, path = "R/percent.R")

