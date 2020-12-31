# get_weather.R

require( tidyverse )          # I live in the tidyvverse ...
require( readxl )             # To read Microsft Excel spreadsheets ...

get_weather <- function()
    {
        fp <-                                     #
            file.path( "D:/R-Projects/MyWalks",       
                         "data",
                         "days.xlsx" )
        
        read_excel( fp )                           # Read days.xlsx ... 
        
        days %>% 
            select( id:walking_conditions )        # And return data ...
    }