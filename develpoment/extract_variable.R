# Develope bootstraping function,

require(tidyverse)                                    # I live in the tidyverse
require(lubridate)                                    # Date functions

FP <- '~/R-Projects/MyWalks4/data/test-walks.csv'     # Test data ...

walks <- read.csv( FP, 
                   header=TRUE,
                   sep=",",
                   stringsAsFactors = FALSE )
