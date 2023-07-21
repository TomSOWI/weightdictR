#' Title
#'
#' @param corp A corpus object
#' @param pattern A list of patterns or a quanteda dictionary object
#'
#' @return
#' @export
#'
#' @examples
#' @importFrom quanteda docvars
#' @importFrom quanteda docnames<-
corpus_to_compound_tokens <- function(corp, pattern){

  if (quanteda::is.dictionary(pattern)){
     pattern <-  unlist(pattern)
  }

  toks <- get_pop_tokens_updated(corp,create_compounds = T,compounds_dict = pattern,compounds_at_level = "sentences")
  docnames(toks) <- docvars(corp)$id
  docvars(toks)$party <- docvars(corp)$party
  docvars(toks)$n_sentences <- quanteda::nsentence(corp)
  docvars(toks)$n_tokens <- quanteda::ntoken(toks)
  return(toks)
}
