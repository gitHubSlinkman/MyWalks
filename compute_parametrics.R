# compute_parametrics.R
###############################################################################
# Function: compute_parameteric( days )
###############################################################################
# This function compute the parmatric totals, the means, the standard
# deviations, the coefficient of variation, the skewness, and rhe kurtotsis of
# relevant data in the days tibble.
##############################################################################

library( tidyverse )                             # I live in the tidy verse ...

source( "compute_totals.R" )                     # Compute the relevant totals
source( "compute_means.R" )                      # Compute relevant means ...
source( "compute_standard_deviations.R" )        # Compute standard deviations
source( "compute_coefficient_of_variation.R" )   # Compute the ccoef of var.
source( "compute_skew.R" )                       # Compute the skewness ...
source( "compute_kurtosis.R" )                   # Compute the kutosis ...

compute_parametrics <- 
    function( days ){
        
        totals <- compute_totals( days )
        means  <- compute_means( days ) 
        stds   <- compute_standard_deviations( days )
        covs   <- compute_coefficient_of_variation( means, stds )
        skews  <- compute_skewness( days )
        kurtosis <- compute_kurtosis( days )                  
        
        
        bind_rows( totals, 
                   means, 
                   stds, 
                   covs, 
                   skews,
                   kurtosis )
    }