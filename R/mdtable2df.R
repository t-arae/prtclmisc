
#' Convert markdown table to data.frame
#' @param string text
#' @export
#'
mdtable2df <-
  function(string){
    . <-  NULL
    mat <-
      string %>%
      stringr::str_split("\\|", simplify = T) %>%
      {.[-2,2:(ncol(.) - 1)]}

    nm <-
      mat %>% .[1,] %>%
      as.character() %>%
      stringr::str_trim("both")

    df <-
      as.data.frame(mat) %>%
      .[-1,] %>%
      purrr::modify(stringr::str_trim, "both")
    colnames(df) <- nm
    return(df)
  }
