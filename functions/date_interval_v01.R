# date_interval.R

require( tidyverse )
require( lubridate )

make_date_interval <- 
    function( day_routes )
    {
        start_date_time  <- day_routes$date_time[1]
        n <- dim( day_routes )[1]
        end_date_time <- day_routes$date_time[n]
        interval( start_date_time, end_date_time )
    }

display_date_interval <- 
    function( date_interval )
    {
       start_date <- as_date( int_start( date_interval ))
       end_date   <- as_date( int_end( date_interval ))  
       
       paste0( "For the period from ",
               start_date,
               " to ",
               end_date )
    }
