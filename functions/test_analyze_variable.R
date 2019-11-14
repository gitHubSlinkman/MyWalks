# test_analyze_variable.R

library(tidyverse)
library(lubridate)
library(flextable)
require(cowplot)

source('~/R-Projects/MyWalks4/functions/get_walks_ver_03.R')
source('~/R-Projects/MyWalks4/functions/extract_varianble_v001.R')


file_path <- file.path( getwd(), "data/walks.xlsx")
    

walks <- get_walks( file_path )

char_date_partition <- as.character( today() - 180 )

walks <- 
    walks %>% 
        filter( as.character(date) > char_date_partition ) %>% 
        filter( walked == 1)

variable <- extract_variable( "miles", walks )

n <- length(variable)  


if (n < 10) {
    print( "Dot plot")
} else {
    print("print histogram")
}

