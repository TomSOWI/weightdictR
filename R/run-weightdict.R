#' Title
#'
#' @param data
#' @param dict_compound
#' @param dict_name
#' @param dict_weight
#' @param dict_weight_name
#' @param prepare_corp
#' @param include_main_dict
#'
#' @return
#' @export
#'
#' @examples
#' @importFrom magrittr %>%

run_weightdictR <- function(
  data,
  dict_compound,
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

  df_kwic <- quanteda::kwic(data, pattern = dict_compound, valuetype = "regex", window = 1, case_insensitive = T)
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
    merged <- merged %>%
      dplyr::select(docname, weight) %>%
      dplyr::group_by(docname) %>%
      dplyr::reframe(
        weight = sum(weight)
      )
  }


  return(result)

}

