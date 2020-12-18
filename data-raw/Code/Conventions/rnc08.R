# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

rnc08raw <- dir(
  here::here("data-raw/RNC08/"),
  pattern    = ".+.txt$",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

rnc08 <- corpus(readtext(rnc08raw), docid_field = "doc_id")
summary(rnc08)
save(rnc08, file = here::here("data/rnc08.rda"), compress='xz')

#usethis::use_data(rnc08, overwrite = TRUE, compress = 'xz')

#save(rnc08, file = here::here("data/rnc08.RData"),version = 2)

rnc08_meta <- read_csv(here::here("data-raw/RNC08/metadata.csv"))
#save(rnc08_meta, file = here::here("data/rnc08_meta.RData"), version = 2)
save(rnc08_meta, file = here::here("data/rnc08_meta.rda"), compress='xz')

#usethis::use_data(rnc08_meta, overwrite = TRUE, compress = 'xz')

