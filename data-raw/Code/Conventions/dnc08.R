# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

dnc08raw <- dir(
  here::here("data-raw/DNC08/"),
  pattern    = ".+.txt$",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

dnc08 <- corpus(readtext(dnc08raw), docid_field = "doc_id")
summary(dnc08)
save(dnc08, file = here::here("data/dnc08.rda"), compress='xz')
usethis::use_data(dnc08, overwrite = TRUE, compress = 'xz')

#save(dnc08, file = here::here("data/dnc08.RData"),version = 2)
#dnc08 <- data.frame(text = sapply(dnc08, as.character), stringsAsFactors = FALSE)
#dnc08 <- tibble::rownames_to_column(dnc08, "Filename")

dnc08_meta <- read_csv(here::here("data-raw/DNC08/metadata.csv"))
#save(dnc08_meta, file = here::here("data/dnc08_meta.RData"), version = 2)

#dnc08 <- merge(dnc08text, dnc08_meta, by = "Filename")

save(dnc08_meta, file = here::here("data/dnc08_meta.rda"), compress='xz')
usethis::use_data(dnc08_meta, overwrite = TRUE, compress = 'xz')

#dnc08text$file <- dnc08text$document
#dnc08_meta$File <- dnc08_meta$Filename
#dncmerge <- merge(dnc08text, dnc08_meta, by.x = "file")

# ***********************************
# NOTES #
# ***********************************

# For conversion to data frame

# dnc08 <- data.frame(text = sapply(dnc08, as.character), stringsAsFactors = FALSE)
# dnc08 <- tibble::rownames_to_column(dnc08, "document")
