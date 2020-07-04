# DNC 16

# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

dnc16raw <- dir(
  here::here("data-raw/DNC16/"),  # Set to same location as `download_dir` above
  pattern    = ".+.txt$",   # Finds Stata Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

dnc16 <- corpus(readtext(dnc16raw), docid_field = "doc_id")
summary(dnc16)
save(dnc16, file = here::here("data/dnc16.RData"),version = 2)

dnc16_meta <- read_csv(here::here("data-raw/DNC16/metadata.csv"))
save(dnc16_meta, file = here::here("data/dnc16_meta.RData"), version = 2)

# ***********************************
# NOTES #
# ***********************************

# For conversion to data frame

# dnc16 <- data.frame(text = sapply(dnc16, as.character), stringsAsFactors = FALSE)
# dnc16 <- tibble::rownames_to_column(dnc16, "document")
