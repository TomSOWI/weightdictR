#' Original Data used to calculate weights
#'
#'Textdata from the 17. till the ongoing 20. period (2023) of the German Parliament.
#'
#'
#' @docType data
#'
#' @format A corpus .
#' @references
#' Klotz, T. (2023). How can populism be identified in political texts taking context into account?: Development of a new populism dictionary
#' \href{https://github.com/TomSOWI/BA-Arbeit}
#'
#' Open Discourse (2023)
#' \href{https://github.com/open-discourse/open-discourse}
"corpBT17_20"

#' Data used to calculate weights
#'
#'Textdata from the 17. till the ongoing 20. period (2023) of the German Parliament.
#'This data is already to run my weighted dictionary klotz_clara
#'
#' @docType data
#'
#' @format A token .
#' @references
#' Klotz, T. (2023). How can populism be identified in political texts taking context into account?: Development of a new populism dictionary
#' \href{https://github.com/TomSOWI/BA-Arbeit}
#'
#' Open Discourse (2023)
#' \href{https://github.com/open-discourse/open-discourse}
"toksBT17_20_clean"


#' Best performed dictionary by klotz using clara-clustering.
#'
#'A dataframe including gruendls populist terms and klotzs patterns weights created with the clara-algorithm
#'
#' @docType data
#'
#' @format A data frame.
#' @references
#' Klotz, T. (2023). How can populism be identified in political texts taking context into account?: Development of a new populism dictionary
#' \href{https://github.com/TomSOWI/BA-Arbeit}
#'
#' Gründl, J. (2020). Populist ideas on social media: A dictionary-based
#' measurement of populist communication. \emph{New Media & Society}. Advance
#' online publication.
#' \href{https://doi.org/10.1177/1461444820976970}{https://doi.org/10.1177/1461444820976970}
"klotz_clara"


#' klotz_clara including weighted patterns for DACH region.
#'
#'Since the klotz_clara dictionary was trained on data from germany patterns addressing austria and swiss are not included in the original dictionary.
#'This version includes patterns for the DACH region with its corresponding weights addressing germans
#'(zu Lasten der Deutschen -> zu Lasten der Schweizer)
#'
#' @docType data
#'
#' @format A data frame.
#' @references
#' Klotz, T. (2023). How can populism be identified in political texts taking context into account?: Development of a new populism dictionary
#' \href{https://github.com/TomSOWI/BA-Arbeit}
#'
#' Gründl, J. (2020). Populist ideas on social media: A dictionary-based
#' measurement of populist communication. \emph{New Media & Society}. Advance
#' online publication.
#' \href{https://doi.org/10.1177/1461444820976970}{https://doi.org/10.1177/1461444820976970}
"klotz_clara_DACH"


#' klotz_clara including the number of cases used for weight calculation
#'
#'As mentioned in the paper Klotz 2023 the low amount of cases for some patterns could be an issue.
#'This dataframe allows to filter those cases using the colomn match_count to urther explore different versions of klotz_clara.
#'
#'
#' @docType data
#'
#' @format A data frame.
#' @references
#' Klotz, T. (2023). How can populism be identified in political texts taking context into account?: Development of a new populism dictionary
#' \href{https://github.com/TomSOWI/BA-Arbeit}
#'
#' Gründl, J. (2020). Populist ideas on social media: A dictionary-based
#' measurement of populist communication. \emph{New Media & Society}. Advance
#' online publication.
#' \href{https://doi.org/10.1177/1461444820976970}{https://doi.org/10.1177/1461444820976970}
"klotz_clara_N"
