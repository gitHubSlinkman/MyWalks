# get_compass_factors.R

###############################################################################
# Load required packages ...
###############################################################################

library(tidyverse)                   # I live in the tidyverse ...
library(readxl)                      # Tidvverse packache to reac Excel ...
library(lubridate)                   # For advanced date processing ...

get_compass_factors <- 
    function(){
        fp <- "data/compass.xlsx" 
        read_xlsx(fp)
    }

