# convert_hhmm_to_decimal.R
###############################################################################
# Function: convert_hhmm_to_decimal( date_time )
###############################################################################
# This function converts the time express in hours and minutes to hours and a
# decimal fraction of an hour.
###############################################################################

library( lubridate )                        # For date functions ...

convert_hhmm_to_decimal <- 
    function( day_routes ){
        walk_times <-                                # Extract dates from date_time
            ( day_routes %>% 
                  pull( date_time ) )
        h <- hour( walk_times)                  # Get hour
        m <- minute( walk_times )               # Get minute
        dec <-  h + m/60.                       # Convert hours and  minutes to
        # decimal 
        round( dec, 2 )                         # Round and return ...
    }


