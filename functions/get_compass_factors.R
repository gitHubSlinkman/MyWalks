# get_compass_factors.R

###############################################################################
# Load required packages ...
###############################################################################

library(tidyverse)                   # I live in the tidyverse ...
library(readxl)                      # Tidyverse package to read Excel ...

get_compass_factors <- 
    function(){
        fp <- file.path( "D:",
                         "R-Projects",
                         "MyWalks",
                         "data",
                         "compass.xlsx") 
        read_xlsx(fp)
    }

