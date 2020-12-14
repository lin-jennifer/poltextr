#' Republican National Convention 2012
#'
#' Captures the speeches given at the 2012 Republican
#' National Convention
#'
#' @format a Large Corpus with 33 texts
#' @source Varies. See data metafile for details.
#'
#' @examples
#' \dontrun{rnc12}
#'
#' @name rnc12
#' @rdname rnc12
"rnc12"

#' Metadata File for the 2012 RNC
#'
#'
#' @format a data frame with 33 rows and 8 variables
#' \describe{
#' \item{Last}{Last Name of Speaker}
#' \item{First}{First Name of Speaker}
#' \item{Filename}{Corresponding File name to \code{\link{rnc12}}}
#' \item{Day}{Day in the convention the speech was given}
#' \item{Type}{speech or benediction}
#' \item{Source}{Provider of the document}
#' \item{Convention}{Type of convention -- RNC}
#' \item{URL}{Link to source}
#' }
#'
#' @examples
#' rnc12_meta
"rnc12_meta"
