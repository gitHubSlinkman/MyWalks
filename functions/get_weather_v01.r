# get_weather_v01.R

require( tidyverse )                    # I live in the tidyverse.
require( dplyr )                        # For data wrangling.
require( lubridate )                    # For date process.  

get_weather <- 
    function(){
                                        
        fp <-                            # Specify path to data ...
            file.path(  "D:",
                        "R-Projects",
                        "MyWalks",
                        "data",
                        "days.xlsx" )
        
        weather <-                       # Specify weather columns ....
            readxl::read_xlsx( fp ) %>% 
            select( id, 
                    date_time,
                    sky:walking_conditions ) %>% 
            select( date_time,
                    sky:walking_conditions )
        weather
    }