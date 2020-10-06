# reverse_by_date.R

require( tidyverse )
require( lubridate )

reverse_by_date <- 
    function( day_routes )
    {
        day_routes %>% 
            arrange( desc( date_time ))
    }