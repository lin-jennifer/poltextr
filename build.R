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
