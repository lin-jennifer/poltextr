% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ScraperFunctions.R
\name{ScraperFunctions}
\alias{ScraperFunctions}
\alias{scrapePlat}
\alias{scrapeInaug}
\alias{scrapeSOTU}
\alias{scrapeUCSB}
\title{Scraper Functions for General Texts}
\usage{
scrapePlat(url, content)

scrapeInaug(n, content)

scrapeSOTU(url, content)

scrapeUCSB(n, content)
}
\arguments{
\item{url}{A URL in quotes}

\item{content}{CSS content that you want to scrape from site}

\item{n}{number, from end of URL for Inaugural Addresses ONLY}
}
\description{
Functions to scrape political texts from
\code{https://www.presidency.ucsb.edu}
}
\details{
\code{scrapePlat()} is designed to scrape
party platforms but has the potential to work
for a general text on the \code{https://www.presidency.ucsb.edu}
site. This returns a text string, which
can then be converted to a data frame and
manipulated as desired.

\code{scrapeInaug()} is like \code{scrapePlat()} but is designed for
Inaugural Addresses. Each address URL for the UCSB presidency
page is designed with \code{"https://www.presidency.ucsb.edu/documents/inaugural-address-n"}
such that the last "n" is the unique identifier for a given address.
Therefore, \code{scrapeInaug(15, '.field-docs-content')} will give you
President Obama's 2012 address. The "n" value can be locaed by reading the last
number on the URL
}
\examples{
# Party Platforms
url <- "https://www.presidency.ucsb.edu/documents/2016-democratic-party-platform"
DemPP2016 <- scrapePlat(url, '.field-docs-content')

# Inaugural Address
# Source: https://www.presidency.ucsb.edu/documents/inaugural-address-15
# n = 15
Obama2012 <- scrapeInaug(15, '.field-docs-content')

# State of the Union
url <- "https://www.presidency.ucsb.edu/documents/address-before-joint-session-the-congress-the-state-the-union-19"
ObamaSOTU16 <- scrapeSOTU(url, '.field-docs-content')

# Any Text on UCSB
# https://www.presidency.ucsb.edu/node/321069
# n = 321069
ObamaFarewell <- scrapeUCSB(321069, '.field-docs-content')


}
