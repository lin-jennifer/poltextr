# ------------------------------- #
# Install Package From Source
# ------------------------------- #

# Remove previous version just in Case
remove.packages("ncfdown")

# Install with devtools
library(devtools)
devtools::install("../ncfdown")

# Load to check it is all good
library(ncfdown)
