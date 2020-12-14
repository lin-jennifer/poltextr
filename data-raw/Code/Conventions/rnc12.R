# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

rnc12raw <- dir(
  here::here("data-raw/RNC12/"),
  pattern    = ".+.txt$",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

rnc12 <- corpus(readtext(rnc12raw), docid_field = "doc_id")
summary(rnc12)
save(rnc12, file = here::here("data/rnc12.rda"), compress='xz')

#usethis::use_data(rnc12, overwrite = TRUE, compress = 'xz')

#save(rnc12, file = here::here("data/rnc12.RData"),version = 2)

rnc12_meta <- read_csv(here::here("data-raw/RNC12/metadata.csv"))
#save(rnc12_meta, file = here::here("data/rnc12_meta.RData"), version = 2)
save(rnc12_meta, file = here::here("data/rnc12_meta.rda"), compress='xz')

#usethis::use_data(rnc12_meta, overwrite = TRUE, compress = 'xz')

