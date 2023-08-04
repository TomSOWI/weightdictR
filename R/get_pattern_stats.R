

#' Get information on how many times a pattern occurred in a text
#'
#' @param text A corpus or tokens object suitable for quantedas kwic function
#' @param pattern A dictionary or a character vector
#' @param regex Do the patterns contain regex? TRUE | FALSE
#'
#' @return A dataframe with the columns pattern and match_count
#' @export
#'
#' @examples get_pattern_stats(text = toksBT17_20_clean, pattern = klotz_clara$pattern, regex = TRUE)
get_pattern_stats <- function(text, pattern, regex = TRUE){

  if (regex == TRUE){
    kwic <- quanteda::kwic(text, pattern, "regex", window = 1)
  }
  else{
    kwic <- quanteda::kwic(text, pattern, window = 1)
  }

  kwic$match_count <- 1
  df <- as.data.frame(kwic)

  result <- df%>%
   dplyr::select(pattern, match_count)%>%
    dplyr::group_by(pattern)%>%
    dplyr::summarise(
      match_count = sum(match_count)
    )

  return(result)
}







