# compute_dates_v003.R
#
# This function acquires the current date and then computes the dates from 7 days ago,
# 90 days_ago, 180 days ago, and 365 days ago.
#########################################################################################
#
library(tidyverse )
library( lubridate )

compute_dates <- 
    function(){
        today          <- as.Date( today() )
        minus_007_days <- as.Date(  today -   7 )
        minus_030_days <- as.Date(  today -  30 )
        minus_060_days <- as.Date (today -  90 )
        minus_090_days <- as.Date ( today - 180 )
        minus_365_days <- as.Date ( today - 365 )

        tibble( today,
                minus_007_days,
                minus_030_days,
                minus_060_days,
                minus_090_days,
                minus_365_days
        )
    }
#