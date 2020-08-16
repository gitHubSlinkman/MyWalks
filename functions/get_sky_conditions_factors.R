# get_sky_conditions_factors.R

require(tidyverse)

get_sky_conditions_factors <- 
    function(  sky_conditions ){
        
        #######################################################################
        # Read factor names from data directory
        #######################################################################
        
        fp  <- file.path( "D:/R-Projects/MyWalks",
                          "data/sky.xlsx"  )
        read_xlsx( fp )       
    }
    