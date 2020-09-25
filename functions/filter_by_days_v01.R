# filter_by_days_v01.R

require( tidyverse )                    # I live in the tidyverse.
require( lubridate )                    # For date processing ...

filter_by_days <- 
    function( walks, days )
    {
        current_date <- today()
        filter_date  <- current_date - days + 1
        walks %>% 
            filter( date_time > filter_date )
    }
