#' Export Functions for General Texts
#'
#' Export to plain text functions for plain text with settings
#' pre-configured globally
#'
#' @name ExportingData
#'
#' @param df Data frame to export
#' @param dest Location and file name to save the data
#'
#' @rdname ExportFunctions
#' @export
exportDoc <- function(df, dest){
  write.table(
    df, dest,
    sep="\t",
    col.names = FALSE, row.names = FALSE, quote = FALSE
  )
}
