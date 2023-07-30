

## Load (and install if necessary) packages
required_packages <- c("readODS",
                       "usethis",
                       "quanteda",
                       "tidyverse")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "http://cran.rstudio.com")
    library(pkg, character.only = TRUE)
  }
}
rm(required_packages, pkg)

###

usethis::use_data(dfClaraDACH, internal = FALSE,
                  overwrite = TRUE)


