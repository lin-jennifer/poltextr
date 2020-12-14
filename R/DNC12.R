#' Democrat National Convention 2012
#'
#' Captures the speeches given at the 2012 Democrat
#' National Convention
#'
#' @format a Large Corpus with 111 texts
#' @source Varies. See data metafile for details.
#'
#' @examples
#' \dontrun{dnc12}
#'
#'
#' @name dnc12
#' @rdname dnc12
"dnc12"

#' Metadata File for the 2012 DNC
#'
#' @format a data frame with 111 rows and 8 variables
#' \describe{
#' \item{Last}{Last Name of Speaker}
#' \item{First}{First Name of Speaker}
#' \item{Filename}{Corresponding File name to \code{\link{dnc12}}}
#' \item{Day}{Day in the convention the speech was given}
#' \item{Type}{speech or benediction}
#' \item{Source}{Provider of the document}
#' \item{Convention}{Type of convention -- DNC}
#' \item{URL}{Link to source}
#' }
#'
#' @examples
#' dnc12_meta

"dnc12_meta"
