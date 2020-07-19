#' Republican National Convention 2016
#'
#' Captures the speeches given at the 2016 Republican
#' National Convention
#'
#' @format a Large Corpus with 65 texts
#' @source Varies. \url{https://www.politico.com/story/2016/07/rnc-2016-schedule-of-events-and-speakers-225704}
#'
#' @examples
#' \dontrun{rnc16}
#'
#' @name rnc16
#' @rdname rnc16
"rnc16"

#' Metadata File for the 2016 RNC
#'
#'
#' @format a data frame with 65 rows and 7 variables
#' \describe{
#' \item{Last}{Last Name of Speaker}
#' \item{First}{First Name of Speaker}
#' \item{Filename}{Corresponding File name to \code{\link{rnc16}}}
#' \item{Day}{Day in the convention the speech was given}
#' \item{Type}{speech or benediction}
#' \item{Source}{Provider of the document}
#' \item{Convention}{Type of convention -- RNC}
#' }
#'
#' @examples
#' rnc16_meta
"rnc16_meta"
