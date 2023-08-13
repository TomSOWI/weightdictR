

## Load (and install if necessary) packages
required_packages <- c("usethis","quanteda")

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "http://cran.rstudio.com")
    library(pkg, character.only = TRUE)
  }
}
rm(required_packages, pkg)

### Create example data by using the original data used to identify weights

BT17_20 <- BT17_20[sample(nrow(BT17_20), 100), ]

corpBT17_20 <- corpus(BT17_20_sample, text_field = "speech_content")

usethis::use_data(corpBT17_20, internal = FALSE,
                  overwrite = TRUE)

### Data used to identify weights

toksBT17_20_clean <- weightdictR::corpus_to_compound_tokens(corpBT17_20, popdictR::gruendl_terms, include_totals = TRUE)
usethis::use_data(toksBT17_20_clean, internal = FALSE,
                  overwrite = TRUE)

### Original dictionary

usethis::use_data(klotz_clara, internal = FALSE,
                  overwrite = TRUE)


### Original Dictionary including patterns for DACH

DACH <- data.frame(list(
  pattern = c("auf kosten de(s|r) österreich(er|ers|erinnen|erin|ischer|ischen)","auf kosten de(s|r) schweizer(s|innen|in|ischer|ischen)?","österreichische(n|r)? tradition(en)?", "schweizer tradition(en)?", "(a|ä)ngst(e)? (de(s|r)|eine(s|r)|unsere(s|r)) österreich(er|ers|erinnen|erin|ischer|ischen)","(a|ä)ngst(e)? (de(s|r)|eine(s|r)|unsere(s|r)) schweizer(s|innen|in|ischer|ischen)?","durchschnittlich(e|er|es|en|em) schweizer(s|n|innen|in|ische|ischer|isches|ischen|ischem)?","durchschnittlich(e|er|es|en|em) österreich(er|ers|ern|erinnen|erin|ische|ischer|isches|ischen|ischem)", "zu( )?lasten de(s|r) österreich(er|ers|erinnen|erin|ischer|ischen)", "zu( )?lasten de(s|r) schweizer(s|innen|in|ischer|ischen)?", "durchschnitts(-)?schweizer(s|n|innen|in|ische|ischer|isches|ischen|ischem)?", "durchschnitts(-)?österreich(er|ers|ern|erinnen|erin|ische|ischer|isches|ischen|ischem)", "(.*)arbeitend(e|er|es|en|em) österreich(er|ers|ern|erinnen|erin|ische|ischer|isches|ischen|ischem)", "(.*)arbeitend(e|er|es|en|em) schweizer(s|n|innen|in|ische|ischer|isches|ischen|ischem)?" ),
  weight = c(0.4375000, 0.4375000, 0.8, 0.8, 0, 0, 1, 1, 0.3928571, 0.3928571, 1, 1, 0.2857143, 0.2857143 ))
)

DACH$pattern <- make_patterns_compound(DACH$pattern)

klotz_clara_DACH <- rbind(klotz_clara, DACH)

usethis::use_data(klotz_clara_DACH, internal = FALSE,
                  overwrite = TRUE)


### Original dictionary including N for calculated weights to filter for robust weighted patterns

# loaded original toksBT17_20_clean object from analysis. This is not provided with the package since its a large dataframe.
# toksBT17_20_clean <- readRDS("~/Documents/R-Packages/weightdictR/data-raw/toksBT17_20_clean.RDS")
stats <- get_pattern_stats(toksBT17_20_clean, klotz_clara$pattern, regex = TRUE)
klotz_clara_N  <- merge(stats, klotz_clara)

usethis::use_data(klotz_clara_N, internal = FALSE,
                  overwrite = TRUE)


