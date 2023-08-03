#' Deploy a weighted dictionary as a dataframe to text
#'
#' @param data Data should be provided as an object that can be used for quntedas kwic function.
#' Note: If you want to apply a dictionary containing wildcard patterns then you should prepare your textdata using corpus_to_compound_tokens().
#' Otherwise you can set prepare_corp = TRUE but this is not recommended since it will take a while.
#' @param dict Dict can be a quanteda dictionary or a character vector anything that works with quantedas kwic.
#' @param dict_name Set a custom name for the original dictionary
#' @param dict_weight Provide a dataframe containing a column "pattern" and "weight"
#' @param dict_weight_name Set a custom name for the weighted dictionary
#' @param prepare_corp Set to TRUE if you apply a dictionary containing wildcards and you have have not prepared your textdata
#' @param include_main_dict Should results for the original dictionary be returned?
#'
#' @return
#' @export
#'
#' @examples
#' @importFrom magrittr %>%

run_weightdictR <- function(
  data,
  dict,
  dict_name = "original",
  dict_weight,
  dict_weight_name = "weighted",
  prepare_corp = FALSE,
  include_main_dict = TRUE
)
{
  if (prepare_corp == TRUE) {
    data <- corpus_to_compound_tokens(data) #define function
  }

  if (quanteda::is.dictionary(dict)){
    pattern <-  unlist(pattern)
  }

  df_kwic <- quanteda::kwic(data, pattern = dict, valuetype = "regex", window = 1, case_insensitive = T)
  merged <- merge(dict_weight, as.data.frame(df_kwic), by = "pattern")

  if (include_main_dict == TRUE) {
    merged$dict <- 1
    merged <- merged %>%
      dplyr::select(docname, dict, weight) %>%
      dplyr::group_by(docname) %>%
      dplyr::reframe(
        dict = sum(dict),
        weight = sum(weight)
      )
  } else {
    result <- merged %>%
      dplyr::select(docname, weight) %>%
      dplyr::group_by(docname) %>%
      dplyr::reframe(
        weight = sum(weight)
      )
  }


  return(result)

}

