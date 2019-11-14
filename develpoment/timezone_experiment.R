# Experiment with time zone
library(tidyverse)
library(readxl)
library(lubridate)

FILE_PATH  <-  "data/walks.xlsx"             # Specify file location

walks <-                                     # Read xlsx file walks ...
    read_xlsx( FILE_PATH )

n <- dim( walks )[1]

last_walk <- walks$date[n]
tz( last_walk )

tz( last_walk ) <- "America/Chicago"

last_walk

tz( last_walk ) <- "Pacific/Honolulu"

last_walk
