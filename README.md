
<!-- README.md is generated from README.Rmd. Please edit that file -->

# weightdictR

<!-- badges: start -->
<!-- badges: end -->

The goal of weightdictR is to facialiate the deployment of weighted
dictionaries especially ones including complex multiword patterns. The
package was build taking inspirations from gruendls package
[multidictR](https://github.com/jogrue/multidictR).

## Installation

You can install the development version of weightdictR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("TomSOWI/weightdictR")
```

## Example

First of all clean and prepare textdata. This is **only necessary** if
the weighted dictionary includes **complex multiword-patterns**.

``` r
library(weightdictR)
library(quanteda)
library(dplyr)

#Takes a long time to execute

toksBT17_20_clean <- corpus_to_compound_tokens(
  corpus = corpBT17_20,
  pattern = popdictR::gruendl_terms,
  include_totals = TRUE)
```

…this is already done for a sample of 100 documents to run as an example

``` r
#Clean and compound textdata sample
weightdictR::toksBT17_20_clean

#This is my dictionary
weightdictR::klotz_clara


#Deploy my weighted dictionary using the main function of this package: run_weightdict

result_klotz <- run_weightdict(
  text = weightdictR::toksBT17_20_clean,
  dict = klotz_clara,
  dict_name = "klotz"
  )

#Individual context information -----------------------------------------------

#Add party 
party <- data.frame(docname = quanteda::docnames(corpBT17_20), party = docvars(corpBT17_20)$party)
result_klotz <- merge(result_klotz, party)

#Add totals
totals <- data.frame(docname = quanteda::docnames(corpBT17_20), nsentences = nsentence(corpBT17_20), ntokens = ntoken(corpBT17_20))
result_klotz <- merge(result_klotz, totals)

#Final result
result <- result_klotz %>%
  group_by(party) %>%
  reframe(
    nsentence = sum(nsentences),
    ntokens = sum(ntokens),
    klotz_clara = sum(weight)/nsentence,
  )
result

#You may continue by comparing the results using z-transformation
result$klotz_clara_z <- scale(result$klotz_clara, center = T)
```
