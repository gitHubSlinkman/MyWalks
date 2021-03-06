# compute_parametric.R
###############################################################################
# Function: compute_parametrics( days )
###############################################################################
# This function compute the parametric totals, the means, the standard
# deviations, the coefficient of variation.
###############################################################################

library( tidyverse )                            
source('D:/R-Projects/MyWalks/functions/compute_totals_v01.R')
source('D:/R-Projects/MyWalks/functions/compute_means_v01.R')
source("D:/R-Projects/MyWalks/functions/compute_standard_deviations_v01.R" )


compute_parametrics <- 
    function( days ){
        
        totals <- compute_totals( days )
        means  <- compute_means( days ) 
        stds   <- compute_standard_deviations( days )
                      
        bind_rows( totals, 
                   means, 
                   stds )
    }