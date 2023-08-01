

#' Get information on how many times a pattern occurred in a text
#'
#' @param text A corpus or tokens object suitable for quantedas kwic function
#' @param pattern A dictionary or a character vector
#'
#' @return A dataframe with the columns pattern and match_count
#' @export
#'
#' @examples
get_pattern_stats <- function(text, pattern){
  kwic <- kwic(toksBT17_20_clean, gruendl_patterns_to_compound(), "regex", window = 1)
  kwic$match_count <- 1
  df <- as.data.frame(kwic)

  result <- df%>%
    select(pattern, match_count)%>%
    group_by(pattern)%>%
    summarise(
      match_count = sum(match_count)
    )

  return(result)
}







