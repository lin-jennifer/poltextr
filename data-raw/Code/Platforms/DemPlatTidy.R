####### General Information #########
# DemPlatTidy.R
# Tidy Democrat Party Platforms

library(tidyverse)

# ********************************************
# Add Metadata Details ######
# ********************************************

DemPlatraw <- dir(
  here::here("data-raw/Platforms"),
  pattern    = "[^dem]*.csv",   # Finds csv Files
  full.names = TRUE,        # List Full File Path Names
  recursive  = TRUE)        # Repeat

Dem16 <- read.csv(here::here("data-raw/Platforms/dem16.csv"))
Dem16 <- Dem16 %>% slice(1:14)
Dem16 <- Dem16 %>%
  mutate(
    Year  = 2016,
    Party = "Democrat",
    Date  = as.Date("2016-07-21")
  ) %>%
  tibble::add_column(
    topic = c(
      "Introduction",
      "Economy",
      "Economy",
      "Economy",
      "Society",
      "Elections",
      "Society",
      "Society",
      "Society",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs"),
    .data = Dem16
  ) %>%
  relocate(text, .after = last_col()) %>%
  select(-c(X.1, head.1, text.1))

Dem12 <- read.csv(here::here("data-raw/Platforms/dem12.csv"))
Dem12 <- Dem12 %>%
  mutate(
    Year  = 2012,
    Party = "Democrat",
    Date  = as.Date("2012-09-03")
  ) %>%
  tibble::add_column(
    topic = c(
      "Introduction",
      "Economy",
      "Economy",
      "Economy",
      "Economy",
      "Economy",
      "Economy",
      "Economy",
      "Government",
      "Elections",
      "Society",
      "Society",
      "Society",
      "Society",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs",
      "Foreign Affairs"
      ),
    .data = Dem12
  ) %>%
  relocate(text, .after = last_col()) %>%
  select(-c(X.1, head.1, text.1))

Dem08 <- read.csv(here::here("data-raw/Platforms/dem08.csv"))
Dem08 <- Dem08 %>%
  mutate(
    Year  = 2008,
    Party = "Democrat",
    Date  = as.Date("2008-08-25"),
    topic = case_when(
      X %in% c(1:25) ~ "Economy",
      X %in% c(26:66) ~ "Foreign Affairs",
      X %in% c(67:79) ~ "Society",
      X %in% c(80:88) ~ "Government")
  ) %>%
  relocate(text, .after = last_col())


