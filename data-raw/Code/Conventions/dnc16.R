# Create Corpus

# Load packages
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(tidyverse)

dnc16raw <- dir(
  here::here("data-raw/DNC16/"),
  pattern    = ".+.txt$",   # Finds text Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

dnc16 <- corpus(readtext(dnc16raw), docid_field = "doc_id")
summary(dnc16)
save(dnc16, file = here::here("data/dnc16.rda"), compress='xz')
usethis::use_data(dnc16, overwrite = TRUE, compress = 'xz')

#save(dnc16, file = here::here("data/dnc16.RData"),version = 2)
#dnc16 <- data.frame(text = sapply(dnc16, as.character), stringsAsFactors = FALSE)
#dnc16 <- tibble::rownames_to_column(dnc16, "Filename")

dnc16_meta <- read_csv(here::here("data-raw/DNC16/metadata.csv"))
#save(dnc16_meta, file = here::here("data/dnc16_meta.RData"), version = 2)

#dnc16 <- merge(dnc16text, dnc16_meta, by = "Filename")

save(dnc16_meta, file = here::here("data/dnc16_meta.rda"), compress='xz')
usethis::use_data(dnc16_meta, overwrite = TRUE, compress = 'xz')

#dnc16text$file <- dnc16text$document
#dnc16_meta$File <- dnc16_meta$Filename
#dncmerge <- merge(dnc16text, dnc16_meta, by.x = "file")

# ***********************************
# NOTES #
# ***********************************

# For conversion to data frame

# dnc16 <- data.frame(text = sapply(dnc16, as.character), stringsAsFactors = FALSE)
# dnc16 <- tibble::rownames_to_column(dnc16, "document")
