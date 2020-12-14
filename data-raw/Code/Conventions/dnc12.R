# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

dnc12raw <- dir(
  here::here("data-raw/DNC12/"),
  pattern    = ".+.txt$",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

dnc12 <- corpus(readtext(dnc12raw), docid_field = "doc_id")
summary(dnc12)
save(dnc12, file = here::here("data/dnc12.rda"), compress='xz')
usethis::use_data(dnc12, overwrite = TRUE, compress = 'xz')

#save(dnc12, file = here::here("data/dnc12.RData"),version = 2)
#dnc12 <- data.frame(text = sapply(dnc12, as.character), stringsAsFactors = FALSE)
#dnc12 <- tibble::rownames_to_column(dnc12, "Filename")

dnc12_meta <- read_csv(here::here("data-raw/DNC12/metadata.csv"))
#save(dnc12_meta, file = here::here("data/dnc12_meta.RData"), version = 2)

#dnc12 <- merge(dnc12text, dnc12_meta, by = "Filename")

save(dnc12_meta, file = here::here("data/dnc12_meta.rda"), compress='xz')
usethis::use_data(dnc12_meta, overwrite = TRUE, compress = 'xz')

#dnc12text$file <- dnc12text$document
#dnc12_meta$File <- dnc12_meta$Filename
#dncmerge <- merge(dnc12text, dnc12_meta, by.x = "file")

# ***********************************
# NOTES #
# ***********************************

# For conversion to data frame

# dnc12 <- data.frame(text = sapply(dnc12, as.character), stringsAsFactors = FALSE)
# dnc12 <- tibble::rownames_to_column(dnc12, "document")
