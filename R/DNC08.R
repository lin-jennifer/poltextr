#' Democrat National Convention 2008
#'
#' Captures the speeches given at the 2008 Democrat
#' National Convention
#'
#' @format a Large Corpus with 17 texts
#' @source Varies. See data metafile for details.
#'
#' @examples
#' \dontrun{dnc08}
#'
#'
#' @name dnc08
#' @rdname dnc08
"dnc08"

#' Metadata File for the 2008 DNC
#'
#' @format a data frame with 17 rows and 8 variables
#' \describe{
#' \item{Last}{Last Name of Speaker}
#' \item{First}{First Name of Speaker}
#' \item{Filename}{Corresponding File name to \code{\link{dnc08}}}
#' \item{Day}{Day in the convention the speech was given}
#' \item{Type}{speech or benediction}
#' \item{Source}{Provider of the document}
#' \item{Convention}{Type of convention -- DNC}
#' \item{URL}{Link to source}
#' }
#'
#' @examples
#' dnc08_meta

"dnc08_meta"
