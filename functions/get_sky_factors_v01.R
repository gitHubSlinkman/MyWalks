# get_sky_factors_vo1.R

require(tidyverse)

get_sky_factors <- 
    function()
        {
        
        #######################################################################
        # Read factor names from data directory
        #######################################################################
        
        fp  <- file.path( "D:/R-Projects/MyWalks",
                          "data/sky.xlsx"  )
        read_xlsx( fp )  
        
        }
    