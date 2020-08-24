# ------------------------------- #
# Install Package From Source
# ------------------------------- #

# Remove previous version just in Case
remove.packages("poltextr")

# Install with devtools
library(devtools)
devtools::install("../poltextr")

# Load to check it is all good
library(poltextr)
data(package="poltextr")
c("%>%",
  "select(-c(X.1, head.1, text.1))")
data.frame(
  stringsAsFactors = FALSE,
       check.names = FALSE,
             `%>%` = c("select(-c(X.1, head.1, text.1))")
)
