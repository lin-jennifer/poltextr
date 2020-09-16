# Create Corpus

library(here)
library(rvest)
library(poltextr)
library(tidyverse)
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(readr)

# Texts downloaded from Rev using each link
# Select Download from Upper right
# Download as Plain Text with column format, exclude timestamps
# Night 1: https://www.rev.com/transcript-editor/shared/BqMflekGOaYROC-qtVwZprRgQUPjhUKDP1_bBMz0z_XfU7UHdeL5VTx8lo7vNbOJvNFeknzqJZTr4Alwt-hFs2-3uSQ?loadFrom=PastedDeeplink&ts=1674.62
# Night 2: https://www.rev.com/transcript-editor/shared/UkdWZq50Kb8Om6sMREDg0pnNlMvg-QOMt0-dUKXRbHt1dvRHO8AySZEGfQNabMBs3lwKMP_Mvhsi9c20vrN_Y5zzMJ0?loadFrom=PastedDeeplink&ts=0.04
# Night 3: https://www.rev.com/transcript-editor/shared/gMGdVerEruXK9Yu5ZAQlbpDPTk35ds64IgA4vctTu9PE4S2pgwaWVicQl44XJDMpYLeHbW7qGTB7LTAGPY5xzwR00HE?loadFrom=PastedDeeplink&ts=0.53
# Night 4: https://www.rev.com/transcript-editor/shared/BYWBNp9-p8flbm38A3CsmO6KdJHQLjJOVSgaB9TWtBe7lyXI31pvdOc4_pBpi5MYSdPDhSXadyXHIECue7BXu45rtzQ?loadFrom=PastedDeeplink&ts=11.75

# Load Data

Night1 <- read_delim(
  here::here("data-raw/RNC20/Night1.txt"),
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night1 <- Night1 %>%
  mutate(
    Day        = "Monday",
    Date       = as.Date("2020-08-24"),
    Speaker    = X1,
    text       = X2,
    Convention = "RNC"
  ) %>%
  select(-c(X1, X2))

Night2 <- read_delim(
  here::here("data-raw/RNC20/Night2.txt"),
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night2 <- Night2 %>%
  mutate(
    Day        = "Tuesday",
    Date       = as.Date("2020-08-25"),
    Speaker    = X1,
    text       = X2,
    Convention = "RNC"
  ) %>%
  select(-c(X1, X2))

Night3 <- read_delim(
  here::here("data-raw/RNC20/Night3.txt"),
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night3 <- Night3 %>%
  mutate(
    Day        = "Wednesday",
    Date       = as.Date("2020-08-26"),
    Speaker    = X1,
    text       = X2,
    Convention = "RNC"
  ) %>%
  select(-c(X1, X2))

Night4 <- read_delim(
  here::here("data-raw/RNC20/Night4.txt"),
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night4 <- Night4 %>%
  mutate(
    Day        = "Thursday",
    Date       = as.Date("2020-08-27"),
    Speaker    = X1,
    text       = X2,
    Convention = "RNC"
  ) %>%
  select(-c(X1, X2))

rnc20 <- bind_rows(Night1, Night2, Night3, Night4)
save(rnc20, file = here::here("data/rnc20.rda"), compress='xz')
usethis::use_data(rnc20, overwrite = TRUE, compress = 'xz')

