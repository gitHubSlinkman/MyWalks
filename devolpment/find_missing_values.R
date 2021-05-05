# validating MyWalks data

require( tidyverse )
require( lubridate )
require( flextable )

source('D:/R-Projects/MyWalks/functions/get_day_routes_v01.R')

my_walks <- get_day_routes()

date <- date( my_walks$date_time )
temp <- as.integer( my_walks$temp )

daily_temp <- 
    tibble( date,
            temp )

daily_temp %>% 
    flextable() %>% 
    colformat_int( j = 2 ) %>%
    autofit()

this_year <- 
    daily_temp %>% 
        filter( year(date) == 2021 )
 
# Find missing dates

n <- dim( this_year )[1]
results <- rep(NA_character_, n)

this_year$date
        





