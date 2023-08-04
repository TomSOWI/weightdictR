#' Optimizes regex-patterns for deployment on compound textdata
#'
#' @param pattern A character vector
#'
#' @return A character vector
#' @export
#'
#' @examples make_patterns_compound("zum schaden de(s|r)")
make_patterns_compound <- function(pattern){
  terms_optimized <- regexhelpeR::optimize_regex_patterns(pattern)
  terms_lazy <- regexhelpeR::make_all_regex_lazy(terms_optimized)
  terms_underscore <- stringi::stri_replace_all_fixed(terms_lazy," ", "_")
  return(terms_underscore)
}


