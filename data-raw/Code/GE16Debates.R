####### General Information #########
# GE16Debates.R
# Scrape Debates General Election 16

library(here)
library(poltextr)
library(tidyverse)

# *****************************************
# 2016 Presidential: GENERAL ELECTION ###
# *****************************************

# University of Nevada Las Vegas
UNLV16 <- "https://www.presidency.ucsb.edu/documents/presidential-debate-the-university-nevada-las-vegas"
UNLV16 <- scrapeDebUCSB(UNLV16)
UNLV16 <- as.data.frame(UNLV16)
UNLV16 <- strsplit(UNLV16$UNLV16, split = "\n")
UNLV16 <- as.data.frame(UNLV16[[1]])
UNLV16tidy <- UNLV16 %>% separate(
  `UNLV16[[1]]`,
  into   = c("speaker", "text"),
  sep    = "(?<=([A-Z]{5}:))",
  remove = TRUE
) %>%
  mutate(
    Last = case_when(
      speaker == "WALLACE:" ~ "Wallace",
      speaker == "CLINTON:" ~ "Clinton",
      speaker == "TRUMP:"   ~ "Trump"),
    First = case_when(
      speaker == "WALLACE:" ~ "Chris",
      speaker == "CLINTON:" ~ "Hillary",
      speaker == "TRUMP:"   ~ "Donald"),
    Role = case_when(
      speaker == "WALLACE:" ~ "Moderator",
      speaker == "CLINTON:" ~ "Candidate",
      speaker == "TRUMP:"   ~ "Candidate"),
    Party = case_when(
      speaker == "CLINTON:" ~ "Democrat",
      speaker == "TRUMP:"   ~ "Republican"),
    Year    = 2016,
    Month   = "October",
    Day     = 19,
    Network = "Fox",
    Election= "General"
  ) %>%
  relocate(text, .after = last_col())
write.csv(UNLV16tidy, here::here("data-raw/Debate/ge16unlv.csv"))

# Washington University St. Louis
WASHU16 <- "https://www.presidency.ucsb.edu/documents/presidential-debate-washington-university-st-louis-missouri"
WASHU16 <- scrapeDebUCSB(WASHU16)
WASHU16 <- as.data.frame(WASHU16)
WASHU16 <- strsplit(WASHU16$WASHU16, split = "\n")
WASHU16 <- as.data.frame(WASHU16[[1]])
WASHU16tidy <- WASHU16 %>% separate(
  `WASHU16[[1]]`,
  into   = c("speaker", "text"),
  sep    = "(?<=([A-Z]{5}:))",
  remove = TRUE
) %>%
  mutate(
    Last = case_when(
      speaker == "COOPER:" ~ "Cooper",
      speaker == "RADDATZ:" ~ "Raddatz",
      speaker == "QUESTION:" ~ "Question",
      speaker == "CLINTON:" ~ "Clinton",
      speaker == "TRUMP:"   ~ "Trump"),
    First = case_when(
      speaker == "COOPER:" ~ "Anderson",
      speaker == "RADDATZ:" ~ "Martha",
      speaker == "QUESTION:" ~ "Question",
      speaker == "CLINTON:" ~ "Hillary",
      speaker == "TRUMP:"   ~ "Donald"),
    Role = case_when(
      speaker == "COOPER:" ~ "Moderator",
      speaker == "RADDATZ:" ~ "Moderator",
      speaker == "QUESTION:" ~ "Moderator",
      speaker == "CLINTON:" ~ "Candidate",
      speaker == "TRUMP:"   ~ "Candidate"),
    Party = case_when(
      speaker == "CLINTON:" ~ "Democrat",
      speaker == "TRUMP:"   ~ "Republican"),
    Year    = 2016,
    Month   = "October",
    Day     = 9,
    Network = "CNN/ABC",
    Election= "General"
  ) %>%
  relocate(text, .after = last_col())
write.csv(WASHU16tidy, here::here("data-raw/Debate/ge16washu.csv"))


