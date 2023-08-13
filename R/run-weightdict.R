#' Deploy a weighted dictionary as a dataframe to text
#'
#' @param text Data should be provided as an object that can be used for quntedas kwic function.
#' Note: If you want to apply a dictionary containing wildcard patterns then you should prepare your textdata using corpus_to_compound_tokens().
#' Otherwise you can set prepare_corp = TRUE but this is not recommended since it will take a while.
#' @param dict Provide a dataframe containing a column "pattern" and "weight"
#' @param dict_name Set a custom name
#' @param prepare_corp Set to TRUE if you apply a dictionary containing wildcards and you have not prepared your textdata
#' @param add_no_weight_results Should results without considering weights be returned in addition
#'
#' @return A dataframe objecct including the populism score per document
#' @export
#'
#' @examples run_weightdict(
#' text = toksBT17_20_clean,
#' dict = klotz_clara,
#' dict_name = "klotz"
#' )

run_weightdict <- function(
  text,
  dict,
  dict_name = "weighted_dict",
  prepare_corp = FALSE,
  add_no_weight_results = FALSE
)
{
  if (!"pattern" %in% colnames(dict)) {
    print("There is no column named pattern")
    stop()
  }
  if (!"weight" %in% colnames(dict)) {
    print("There is no column named weight")
    stop()
  }

  if (prepare_corp == TRUE) {
    text <- corpus_to_compound_tokens(text)
  }

  df_kwic <- quanteda::kwic(text, pattern = dict$pattern, valuetype = "regex", window = 1, case_insensitive = T)
  merged <- merge(dict, as.data.frame(df_kwic), by = "pattern")

  if (add_no_weight_results  == TRUE) {
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

