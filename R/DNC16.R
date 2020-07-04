

#Create Corpus

library("quanteda")
library(quanteda.corpora)

dnc16raw <- dir(
  here::here("data-raw/DNC16/"),  # Set to same location as `download_dir` above
  pattern    = ".+.txt$",   # Finds Stata Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

library("readtext")
library(tidyverse)
dnc16 <- corpus(readtext(dnc16raw), docid_field = "doc_id")
summary(dnc16)
save(dnc16, file = here::here("data/dnc16.RData"),version = 2)

# ***********************************
# NOTES #
# ***********************************

# For conversion to data frame

# dnc16 <- data.frame(text = sapply(dnc16, as.character), stringsAsFactors = FALSE)
# dnc16 <- tibble::rownames_to_column(dnc16, "document")
