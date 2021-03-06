# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

rnc16raw <- dir(
  here::here("data-raw/RNC16/"),
  pattern    = ".+.txt$",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

rnc16 <- corpus(readtext(rnc16raw), docid_field = "doc_id")
summary(rnc16)
save(rnc16, file = here::here("data/rnc16.rda"), compress='xz')

#usethis::use_data(rnc16, overwrite = TRUE, compress = 'xz')

#save(rnc16, file = here::here("data/rnc16.RData"),version = 2)

rnc16_meta <- read_csv(here::here("data-raw/RNC16/metadata.csv"))
#save(rnc16_meta, file = here::here("data/rnc16_meta.RData"), version = 2)
save(rnc16_meta, file = here::here("data/rnc16_meta.rda"), compress='xz')

#usethis::use_data(rnc16_meta, overwrite = TRUE, compress = 'xz')

