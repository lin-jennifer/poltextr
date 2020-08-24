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

Dem20 <- read.csv(here::here("data-raw/Platforms/dem20.csv"))
Dem20 <- Dem20 %>%
  mutate(
    Year     = 2020,
    Party    = "Democrat",
    Date     = as.Date("2020-08-17"),
    Candidate= "Joe Biden"
  ) %>%
  tibble::add_column(
    topic = c(
      "Introduction",
      "Society",
      "Economy",
      "Society",
      "Society",
      "Society",
      "Society",
      "Elections",
      "Society",
      "Society",
      "Foreign Affairs"),
    .data = Dem20
  ) %>%
  relocate(text, .after = last_col())%>%
  select(-c(X.1, head.1, text.1))


Dem16 <- read.csv(here::here("data-raw/Platforms/dem16.csv"))
Dem16 <- Dem16 %>% slice(1:14)
Dem16 <- Dem16 %>%
  mutate(
    Year     = 2016,
    Party    = "Democrat",
    Date     = as.Date("2016-07-21"),
    Candidate= "Hillary Clinton"
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
    Year      = 2012,
    Party     = "Democrat",
    Date      = as.Date("2012-09-03"),
    Candidate = "Barack Obama"
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
    Year      = 2008,
    Party     = "Democrat",
    Date      = as.Date("2008-08-25"),
    Candidate = "Barack Obama",
    topic = case_when(
      X %in% c(1:25) ~ "Economy",
      X %in% c(26:66) ~ "Foreign Affairs",
      X %in% c(67:79) ~ "Society",
      X %in% c(80:88) ~ "Government")
  ) %>%
  relocate(text, .after = last_col())

Dem04 <- read.csv(here::here("data-raw/Platforms/dem04.csv"))
Dem04 <- Dem04 %>%
  mutate(
    Year      = 2004,
    Party     = "Democrat",
    Date      = as.Date("2004-07-27"),
    Candidate = "John Kerry",
    topic = case_when(
      X == 1 ~ "Introduction",
      X == 2 ~ "Foreign Affairs",
      X == 3 ~ "Economy",
      X == 4 ~ "Society",
      X == 5 ~ "Government")
  ) %>%
  relocate(text, .after = last_col())

Dem00 <- read.csv(here::here("data-raw/Platforms/dem00.csv"))
Dem00 <- Dem00 %>%
  mutate(
    Year      = 2000,
    Party     = "Democrat",
    Date      = as.Date("2000-08-14"),
    Candidate = "Albert Gore",
    topic = case_when(
      X ==     1      ~ "Introduction",
      X %in% c(2:24)  ~ "Economy",
      X %in% c(25:57) ~ "Society",
      X %in% c(58:75) ~ "Foreign Affairs")
  ) %>%
  relocate(text, .after = last_col())

# ********************************************
# Generate Dataset ######
# ********************************************

DemocratPlatforms <- bind_rows(Dem20, Dem16, Dem12, Dem08, Dem04, Dem00)
save(DemocratPlatforms, file = here::here("data/DemocratPlatforms.rda"), compress='xz')
usethis::use_data(DemocratPlatforms, overwrite = TRUE, compress = 'xz')
