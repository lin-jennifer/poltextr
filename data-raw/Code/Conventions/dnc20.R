# Create Corpus

library(here)
library(rvest)
library(poltextr)
library(tidyverse)
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(readr)

# https://www.politico.com/news/2020/08/07/dnc-2020-schedule-of-events-and-speakers-390977

# Texts downloaded from Rev using each link
# Select Download from Upper right
# Download as Plain Text with column format, exclude timestamps
# Night 1: https://www.rev.com/transcript-editor/shared/c3cbYICI8FhR_Xwmna51XfI_fde-x-ypy46-QOVrlF-i466t6BCQr8mcTWZH6-XLU_SWhmxDdiqjyWtild5ytPX8LBc?loadFrom=PastedDeeplink&ts=5.13
# Night 2: https://www.rev.com/blog/transcripts/democratic-national-convention-dnc-2020-night-2-transcript
# Night 3: https://www.rev.com/transcript-editor/shared/O-kTYZ_g5YCuHHqOH9ieztTwoJnPNQWlGBp-G0VTroBCIGF7cSd6ifIpSTSWqkaxb4l1W22piYmWs2_as2u4L7_5vKc?loadFrom=PastedDeeplink&ts=0
# Night 4: https://www.rev.com/transcript-editor/shared/qcW2Pr5owfxNyTv8kGQX-mxpsrs6yzOfS11jxX4NC9SZK6AjXbWbDa3v_q7S3wftuSWC_UT55nAfZI3lD1KyYA8f3DE?loadFrom=PastedDeeplink&ts=33.35

# Load Data

Night1 <- read_delim(
  here::here("data-raw/DNC20/Night1.txt"),
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night1 <- Night1 %>%
  mutate(
    Day        = "Monday",
    Date       = as.Date("2020-08-17"),
    Speaker    = X1,
    text       = X2,
    Convention = "DNC"
  ) %>%
  select(-c(X1, X2))

Night2 <- read_delim(
  "~/Desktop/poltextr/data-raw/DNC20/Night2.txt",
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night2 <- Night2 %>%
  mutate(
    Day        = "Tuesday",
    Date       = as.Date("2020-08-18"),
    Speaker    = X1,
    text       = X2,
    Convention = "DNC"
  ) %>%
  select(-c(X1, X2))

Night3 <- read_delim(
  "~/Desktop/poltextr/data-raw/DNC20/Night3.txt",
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night3 <- Night3 %>%
  mutate(
    Day        = "Wednesday",
    Date       = as.Date("2020-08-18"),
    Speaker    = X1,
    text       = X2,
    Convention = "DNC"
  ) %>%
  select(-c(X1, X2))

Night4 <- read_delim(
  "~/Desktop/poltextr/data-raw/DNC20/Night4.txt",
  ":", escape_double = FALSE, col_names = FALSE,
  trim_ws = TRUE)
Night4 <- Night4 %>%
  mutate(
    Day        = "Thursday",
    Date       = as.Date("2020-08-20"),
    Speaker    = X1,
    text       = X2,
    Convention = "DNC"
  ) %>%
  select(-c(X1, X2))

dnc20 <- bind_rows(Night1, Night2, Night3, Night4)
save(dnc20, file = here::here("data/dnc20.rda"), compress='xz')
usethis::use_data(dnc20, overwrite = TRUE, compress = 'xz')

