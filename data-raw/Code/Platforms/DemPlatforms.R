####### General Information #########
# DemPlatforms.R
# Scrape Democrat Party Platforms

library(here)
library(rvest)
library(poltextr)
library(tidyverse)
library("quanteda")
library(quanteda.corpora)
library("readtext")

D16   <- "https://www.presidency.ucsb.edu/documents/2016-democratic-party-platform"
page  <-  read_html(D16)
heads <-  page %>%
  html_nodes(xpath = "//p/strong/parent::p") %>%
  html_text()
all_p <-  page %>%
  html_nodes(xpath = "//p") %>%
  html_text()
start <-  match(heads, all_p)
end   <-  c(start[-1], length(all_p))
Dem2016 <- as_tibble(do.call(rbind, mapply(function(a, b, h)
{data.frame(head = h, text = paste(all_p[(a + 1):b], collapse = "\n"))
}, a = start, b = end, h = heads, SIMPLIFY = FALSE)))
write.csv(Dem2016, here::here("data-raw/Platforms/dem16.csv"))

D12 <- "https://www.presidency.ucsb.edu/documents/2012-democratic-party-platform"
page <- read_html(D12)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h3")
xpath <- sprintf("./p[count(preceding-sibling::h3)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D12, "h3")
head <- as.data.frame(head)
head <- head %>%  slice(2:25)
Dem12 <- bind_cols(head, text)
write.csv(Dem12, here::here("data-raw/Platforms/dem12.csv"))

D08 <- "https://www.presidency.ucsb.edu/documents/2008-democratic-party-platform"
page <- read_html(D08)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h4")
xpath <- sprintf("./p[count(preceding-sibling::h4)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D08, "h4")
head <- as.data.frame(head)
Dem08 <- bind_cols(head, text)
write.csv(Dem08, here::here("data-raw/Platforms/dem08.csv"))

D04 <- "https://www.presidency.ucsb.edu/documents/2004-democratic-party-platform"
page <- read_html(D04)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h3")
xpath <- sprintf("./p[count(preceding-sibling::h3)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D04, "h3")
head <- as.data.frame(head)
head <- head %>%  slice(2:6)
Dem04 <- bind_cols(head, text)
write.csv(Dem04, here::here("data-raw/Platforms/dem04.csv"))

D00 <- "https://www.presidency.ucsb.edu/documents/2000-democratic-party-platform"
page <- read_html(D00)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h4")
xpath <- sprintf("./p[count(preceding-sibling::h4)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D00, "h4")
head <- as.data.frame(head)
Dem00 <- bind_cols(head, text)
write.csv(Dem00, here::here("data-raw/Platforms/dem00.csv"))

D96 <- "https://www.presidency.ucsb.edu/documents/1996-democratic-party-platform"
page <- read_html(D96)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h4")
xpath <- sprintf("./p[count(preceding-sibling::h4)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D96, "h4")
head <- as.data.frame(head)
Dem96 <- bind_cols(head, text) %>% slice(2:6)
write.csv(Dem96, here::here("data-raw/Platforms/dem96.csv"))

D92 <- "https://www.presidency.ucsb.edu/documents/1992-democratic-party-platform"
page <- read_html(D92)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h4")
xpath <- sprintf("./p[count(preceding-sibling::h4)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D92, "h4")
head <- as.data.frame(head)
Dem92 <- bind_cols(head, text) %>% slice(2:41)
write.csv(Dem92, here::here("data-raw/Platforms/dem92.csv"))

D88 <- "https://www.presidency.ucsb.edu/documents/1988-democratic-party-platform"
Dem88 <- scrapePlat(D88, "p") %>%
  as.data.frame() %>%
  slice(3:33)
Dem88 <- Dem88 %>% rename(text = ., .data = Dem88)
write.csv(Dem88, here::here("data-raw/Platforms/dem88.csv"))

D84 <- "https://www.presidency.ucsb.edu/documents/1984-democratic-party-platform"
page <- read_html(D84)
content <- html_node(page, '.field-docs-content')
headlines <- html_nodes(content, "h4")
xpath <- sprintf("./p[count(preceding-sibling::h4)=%d]", seq_along(headlines))
text <- map(xpath, ~html_nodes(x = content, xpath = .x)) %>% # Get the text inside the headlines
  map(html_text, trim = TRUE) %>% # get per node in between
  map_chr(paste, collapse = "\n") %>% # collapse the text inbetween
  set_names(headlines %>% html_node("span") %>% html_text())
text <- as.data.frame(text)
head <- scrapePlat(D84, "h4")
head <- as.data.frame(head)
Dem84 <- bind_cols(head, text)
write.csv(Dem84, here::here("data-raw/Platforms/dem84.csv"))



# ********************************************
# NOTES ######
# ********************************************

# A Possible Loop
#platformURLs <- c("https://www.presidency.ucsb.edu/documents/2016-democratic-party-platform",
 #                 "https://www.presidency.ucsb.edu/documents/2012-democratic-party-platform")
#library(purrr)
#processURL <- function (URL) {
#  platform_data <- scrapePlat(URL, '.field-docs-content') %>%
#    as.data.frame()
#}
#platforms <- map(platformURLs, processURL)
