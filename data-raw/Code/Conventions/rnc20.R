# Create Corpus

library(here)
library(rvest)
library(poltextr)
library(tidyverse)
library("quanteda")
library(quanteda.corpora)
library("readtext")
library(readr)

# Texts downloaded from Rev using each link
# Select Download from Upper right
# Download as Plain Text with column format, exclude timestamps
# Night 1: https://www.rev.com/transcript-editor/shared/BqMflekGOaYROC-qtVwZprRgQUPjhUKDP1_bBMz0z_XfU7UHdeL5VTx8lo7vNbOJvNFeknzqJZTr4Alwt-hFs2-3uSQ?loadFrom=PastedDeeplink&ts=1674.62
# Night 2: https://www.rev.com/transcript-editor/shared/UkdWZq50Kb8Om6sMREDg0pnNlMvg-QOMt0-dUKXRbHt1dvRHO8AySZEGfQNabMBs3lwKMP_Mvhsi9c20vrN_Y5zzMJ0?loadFrom=PastedDeeplink&ts=0.04
# Night 3: 
# Night 4: 
