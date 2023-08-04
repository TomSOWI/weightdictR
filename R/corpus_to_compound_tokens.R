#' Prepares a text for deployment of a multiword dictionary
#'
#' @param corpus A corpus object
#' @param pattern A list of patterns or a quanteda dictionary object
#' @param include_totals Should the returned tokens object include n_sentences and n_tokens per document?
#'
#' @return A compound token object
#' @export
#'
#' @examples corpus_to_compound_tokens(corpus = corpBT17_20,
#'  pattern = klotz_clara$pattern,
#'  include_totals = TRUE)

corpus_to_compound_tokens <- function(corpus, pattern, include_totals = FALSE){

  if (quanteda::is.dictionary(pattern)){
     pattern <-  unlist(pattern)
  }

  #toks <- get_pop_tokens_updated(corpus,create_compounds = T,compounds_dict = pattern,compounds_at_level = "sentences")

  #Make text compound
  text <- make_compounds_updated(
    text = corpus,
    patterns = pattern,
    at_level = "sentence",
    glob = FALSE,
    lazy = TRUE,
    ignore_case = TRUE,
    optimize_regex = TRUE)

  #Default settings dor tokenizer
  toks <- quanteda::tokens(
    text,
    what = "word",
    remove_punct = TRUE,
    remove_symbols = TRUE,
    remove_numbers = TRUE,
    remove_url = TRUE,
    remove_separators = TRUE,
    split_hyphens = FALSE,
    include_docvars = TRUE
  )
  toks <- quanteda::tokens_tolower(toks, keep_acronyms = FALSE)

  if (include_totals){
    quanteda::docnames(toks) <- quanteda::docvars(corpus)$id
    #quanteda::docvars(toks)$party <- docvars(corpus)$party
    quanteda::docvars(toks)$n_sentences <- quanteda::nsentence(corpus)
    quanteda::docvars(toks)$n_tokens <- quanteda::ntoken(toks)
  }

  return(toks)
}


