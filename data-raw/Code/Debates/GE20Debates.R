####### General Information #########
# GE20Debates.R
# Scrape Debates General Election 16

library(here)
library(poltextr)
library(tidyverse)

# *****************************************
# 2020 Presidential: GENERAL ELECTION ###
# *****************************************

CWRU20 <- "https://www.presidency.ucsb.edu/documents/presidential-debate-case-western-reserve-university-cleveland-ohio"
CWRU20 <- scrapeDebUCSB(CWRU20)
CWRU20 <- as.data.frame(CWRU20)
CWRU20 <- strsplit(CWRU20$CWRU20, split = "\n")
CWRU20 <- as.data.frame(CWRU20[[1]])
CWRU20tidy <- CWRU20 %>% separate(
  `CWRU20[[1]]`,
  into   = c("speaker", "text"),
  sep    = "(?<=([A-Z]{5}:))",
  remove = TRUE
) %>%
  mutate(
    Last = case_when(
      speaker == "WALLACE:" ~ "Wallace",
      speaker == "BIDEN:"   ~ "Biden",
      speaker == "TRUMP:"   ~ "Trump"),
    First = case_when(
      speaker == "WALLACE:" ~ "Chris",
      speaker == "BIDEN:"   ~ "Joe",
      speaker == "TRUMP:"   ~ "Donald"),
    Role = case_when(
      speaker == "WALLACE:" ~ "Moderator",
      speaker == "BIDEN:"   ~ "Candidate",
      speaker == "TRUMP:"   ~ "Candidate"),
    Party = case_when(
      speaker == "BIDEN:"   ~ "Democrat",
      speaker == "TRUMP:"   ~ "Republican"),
    Year    = 2020,
    Month   = "September",
    Day     = 29,
    Date    = as.Date("2020-09-29"),
    Network = "Fox",
    Election= "General",
    Type    = "Presidential",
    ElectYR = 2020
  ) %>%
  relocate(text, .after = last_col()) %>%
  select(-c(speaker))
write.csv(CWRU20tidy, here::here("data-raw/Debate/ge20cwru.csv"))

