####### General Information #########
# DemPlatforms.R
# Scrape Democrat Party Platforms

library(here)
library(poltextr)
library(tidyverse)
library("quanteda")
library(quanteda.corpora)
library("readtext")

D16 <- "https://www.presidency.ucsb.edu/documents/2016-democratic-party-platform"
Dem2016 <- scrapePlat(D16, '.field-docs-content')
exportDoc(Dem2016, here::here("data-raw/Platforms/dem16.txt"))

D12 <- "https://www.presidency.ucsb.edu/documents/2012-democratic-party-platform"
Dem2012 <- scrapePlat(D12, '.field-docs-content')
exportDoc(Dem2012, here::here("data-raw/Platforms/dem12.txt"))


# ********************************************
# Add Metadata Details ######
# ********************************************


DemPlatraw <- dir(
  here::here("data-raw/Platforms"),
  pattern    = "[^dem]*.txt",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

DemPlat <- corpus(readtext(DemPlatraw), docid_field = "doc_id")
summary(DemPlat)
DemPlat <- data.frame(text = sapply(DemPlat, as.character), stringsAsFactors = FALSE)
DemPlat <- tibble::rownames_to_column(DemPlat, "Filename")

# ********************************************
# NOTES ######
# ********************************************

# A Possible Loop
#platformURLs <- c("https://www.presidency.ucsb.edu/documents/2016-democratic-party-platform",
 #                 "https://www.presidency.ucsb.edu/documents/2012-democratic-party-platform")
#library(purrr)
#processURL <- function (URL) {
#  platform_data <- scrapePlat(URL, '.field-docs-content') %>%
#    as.data.frame()
#}
#platforms <- map(platformURLs, processURL)
