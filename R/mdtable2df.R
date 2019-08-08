
#' Convert markdown table to data.frame
#' @param string text
#' @export
#' @examples
#' md_table <- c(
#' "|hoge|hage|",
#' "|:-:|--:|",
#' "|1.0|a|",
#' "|2|abc|"
#' )
#' mdtbl2df(md_table)
#'
#' \dontrun{
#' |hoge|hage|hige|
#' |:-:|--:|:-:|
#' |1.0|a  |1L|
#' |2| abc |foo|
#'
#' clipr::read_clip() %>%
#'   mdtbl2df() %>%
#'   knitr::kable(align = "lrc") %>%
#'   clipr::write_clip()
#' }
#'
mdtbl2df <-
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
      as.data.frame(mat, row.names = NULL, make.names = F) %>%
      tibble::as_tibble() %>%
      .[-1,] %>%
      purrr::modify(stringr::str_trim, "both")
    colnames(df) <- nm
   return(df)
  }


#' Convert markdown table to markdown table
#' @param string text
#' @param ... ...
#' @export
#' @examples
#' md_table <- c(
#' "|hoge|hage|",
#' "|:-:|--:|",
#' "|1.0|a|",
#' "|2|abc|"
#' )
#' mdtbl2mdtbl(md_table, align = "lrc")
mdtbl2mdtbl <-
  function(string, ...){
    mdtbl2df(string) %>%
      knitr::kable(...)
  }

