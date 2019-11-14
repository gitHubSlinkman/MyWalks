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
        date_000_days_ago <- as.Date( today() )
        date_007_days_ago <- as.Date(  date_000_days_ago -   7 )
        date_030_days_ago <- as.Date(  date_000_days_ago -  30 )
        date_090_days_ago <- as.Date ( date_000_days_ago -  90 )
        date_180_days_ago <- as.Date ( date_000_days_ago - 180 )
        date_365_days_ago <- as.Date ( date_000_days_ago - 365 )
        
        tibble( date_000_days_ago,
                date_007_days_ago,
                date_090_days_ago,
                date_180_days_ago,
                date_365_days_ago )
    }