

#Create Corpus

library("quanteda")
library(quanteda.corpora)

dnc16raw <- dir(
  here::here("data-raw/DNC16/"),  # Set to same location as `download_dir` above
  pattern    = ".+.txt$",   # Finds Stata Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

library("readtext")
dnc16 <- corpus(readtext(dnc16raw))
summary(dnc16)
save(dnc16, file = here::here("data/dnc16.Rda"))
