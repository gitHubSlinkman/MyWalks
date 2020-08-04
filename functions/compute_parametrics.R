# compute_parametrics.R
###############################################################################
# Function: compute_parameteric( days )
###############################################################################
# This function compute the parmatric totals, the means, the standard
# deviations, the coefficient of variation, the skewness, and rhe kurtotsis of
# relevant data in the days tibble.
##############################################################################

library( tidyverse )                            
source('D:/R-Projects/MyWalks/functions/compute_totals.R')
source('D:/R-Projects/MyWalks/functions/compute_means.R')
source("D:/R-Projects/MyWalks/functions/compute_standard_deviations.R" )
source('D:/R-Projects/MyWalks/functions/compute_coefficient_of_variation.R')
source('D:/R-Projects/MyWalks/functions/compute_skew.R')
source('D:/R-Projects/MyWalks/functions/compute_kurtosis.R')


compute_parametrics <- 
    function( days ){
        
        totals <- compute_totals( days )
        means  <- compute_means( days ) 
        stds   <- compute_standard_deviations( days )
                      
        
        
        bind_rows( totals, 
                   means, 
                   stds )
    }