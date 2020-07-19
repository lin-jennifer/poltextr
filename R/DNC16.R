#' Democrat National Convention 2016
#'
#' Captures the speeches given at the 2016 Democrat
#' National Convention
#'
#' @format a Large Corpus with 155 texts
#' @source Varies. \url{https://www.politico.com/story/2016/07/dnc-2016-schedule-of-events-and-speakers-225617}
#'
#' @examples
#' \dontrun{dnc16}
#'
#'
#' @name dnc16
#' @rdname dnc16
"dnc16"

#' Metadata File for the 2016 DNC
#'
#' @format a data frame with 155 rows and 7 variables
#' \describe{
#' \item{Last}{Last Name of Speaker}
#' \item{First}{First Name of Speaker}
#' \item{Filename}{Corresponding File name to \code{\link{dnc16}}}
#' \item{Day}{Day in the convention the speech was given}
#' \item{Type}{speech or benediction}
#' \item{Source}{Provider of the document}
#' \item{Convention}{Type of convention -- DNC}
#' }
#'
#' @examples
#' dnc16_meta

"dnc16_meta"
