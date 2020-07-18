#' Scraper Functions for Debates
#'
#' Functions to scrape Debates from
#' \code{https://www.presidency.ucsb.edu} or
#' \code{https://www.debates.org/}
#'
#' Use \code{scrapeDebUCSB} for texts from \code{https://www.presidency.ucsb.edu}
#' and use \code{scrapeDebOrg} for texts from
#' \code{https://www.debates.org/voter-education/debate-transcripts/}. Since
#' the websites are set up a bit differently, the functions are
#' adjusted to account for the difference CSS labels of the main
#' text. Both return a text string which can then be manipulated
#' as desired.
#'
#' @return text string in the format
#' \code{SPEAKERA: text SPEAKERB: text} with
#' line breaks between the speakers
#'
#'
#' @name ScraperDebates
#'
#' @importFrom rvest html_text html_nodes
#' @importFrom xml2 read_html
#' @importFrom magrittr %>%
#'
#' @param url A URL in quotes
#'
#' @examples
#' # Debates from https://www.presidency.ucsb.edu
#' url <- "https://www.presidency.ucsb.edu/documents/presidential-debate-washington-university-st-louis-missouri"
#' Debate <- scrapeDebUCSB(url) # Scrape 2016 Presidential Debate
#'
#' # Debates from Debates.org
#' url <- "https://www.debates.org/voter-education/debate-transcripts/september-26-2016-debate-transcript/"
#' Debate <- scrapeDebOrg(url)
#'
#' @rdname ScrapeDebate
#' @export
scrapeDebUCSB <- function(url){
  debate_text <- read_html(url) %>%
    html_nodes('.field-docs-content') %>% html_text()
  debate_tidy <- gsub("\\n(?![A-Z]{3})", " ", debate_text, perl = TRUE)
}

#' @rdname ScrapeDebate
#' @export
scrapeDebOrg <- function(url){
  debate_text <- read_html(url) %>%
    html_nodes(xpath = '//*[@id="content-sm"]') %>% html_text()
  debate_tidy <- gsub("\\n(?![A-Z]{3})", " ", debate_text, perl = TRUE)
}
