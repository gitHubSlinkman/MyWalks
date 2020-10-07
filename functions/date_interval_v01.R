# make_date_interval.R

require( tidyverse )
require( lubridate )

make_date_interval <- 
    function( day_routes )
    {
        
        start_date_time  <- day_routes$date_time[dim(day_routes)[1] ]
        interval( start_date_time, end_date_time )
    }

display_date_interval <- 
    function( date_interval )
    {
       start_dt <- as_date( int_start( date_interval ))
       end_dt   <- as_date( int_end( date_interval ))  
       
       paste0( "For the period from ",
               start_dt,
               " to ",
               end_dt )
    }
