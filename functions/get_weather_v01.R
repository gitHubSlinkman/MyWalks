# get_weather.R

require( tidyverse )          # I live in the tidyvverse ...
require( readxl )             # To read Microsft Excel spreadsheets ...

get_weather <- function()
    {
        fp <-                                     #
            file.path( "D:/R-Projects/MyWalks",       
                         "data",
                         "days.xlsx" )
        
        read_excel( fp ) %>%                       # Read day_routes and
            select( id:walking_conditions )        # And extract weather.
        
        
}
