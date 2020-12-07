# filter_by_days_v01.R

require( tidyverse )                    # I live in the tidyverse.
require( lubridate )                    # For date processing ...

filter_by_days <- 
    function( walks, days )
    {
        
        ###################################################################
        # We date the retrieved data from the last date in the tibble.
        ###################################################################
        
        n                   <- dim( walks )[1]
        last_walk_date_time <- walks$date_time[n]
        last_walk_date <- date( last_walk_date_time )
        
        
       
        filter_date  <- last_walk_date - days 
        
        walks %>% 
            filter( date_time > filter_date )
    }
