# get_weather_v01.R

require( tidyverse )                    # I live in the tidyverse.
require( dplyr )                        # For data wrangling.
require( lubridate )                    # For date process.  

get_weather <- 
    function(){
        fp <- 
            file.path(  "D:",
                        "R-Projects",
                        "MyWalks",
                        "data",
                        "days.xlsx" )
        
        weather <- 
            readxl::read_xlsx( fp ) %>% 
            select( id, 
                    date_time,
                    sky_conditions:walking_conditions ) %>% 
            select( date_time,
                    sky_conditions:walking_conditions )
        weather
    }