# get_sky_conditioins_levels.R

require(tidyverse)

make_sky_conitions_factor <- 
    function(  sky_conditions ){
        
        #######################################################################
        # Read factor names from data directory
        #######################################################################
        
        URL                <-  "data/conditions.xlsx"  # Get ordered 
        ordered_conditions <- read_xlsx( URL )         # conditions ...
        
        
        
        
    }
    