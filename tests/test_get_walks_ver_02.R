# test_get_walks_ver02.r

suppressMessages( library(tidyverse) )           # We live in the  tidyverse ...
suppressMessages( library(readxl)  )             # To read xlsx files ....
suppressMessages( library( lubridate) )           # To work with dates ...

    
source("functions/get_walks_ver_02.R")              # Load get_walks version 2

walks <- get_walks()                                # Test get_walks function ...

class( walks )                                      # Check class
head( walks, 8 )                                    # First 8 rows ...
tail( walks, 8 )                                    # Last 8 rows ...
#
colnames( walks )

today_date <- as.Date( today() )
today_date

partition_date <- today_date - 180 
partition_date

walks <- 
    walks %>% 
     filter( date >= partition_date  )

head(walks, 7)
tail( walks, 7 )