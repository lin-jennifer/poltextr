#' Republican National Convention 2008
#'
#' Captures the speeches given at the 2008 Republican
#' National Convention
#'
#' @format a Large Corpus with 10 texts
#' @source Varies. See data metafile for details.
#'
#' @examples
#' \dontrun{rnc08}
#'
#' @name rnc08
#' @rdname rnc08
"rnc08"

#' Metadata File for the 2008 RNC
#'
#'
#' @format a data frame with 10 rows and 8 variables
#' \describe{
#' \item{Last}{Last Name of Speaker}
#' \item{First}{First Name of Speaker}
#' \item{Filename}{Corresponding File name to \code{\link{rnc08}}}
#' \item{Day}{Day in the convention the speech was given}
#' \item{Type}{speech or benediction}
#' \item{Source}{Provider of the document}
#' \item{Convention}{Type of convention -- RNC}
#' \item{URL}{Link to source}
#' }
#'
#' @examples
#' rnc08_meta
"rnc08_meta"
