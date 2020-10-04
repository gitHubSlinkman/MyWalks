# compute_parametric.R
###############################################################################
# Function: computeq( days )uantiles
###############################################################################
# This function compute the quantiles used in the 5-number display, the basis
# for the Tukey's boxplot.
###############################################################################

library( tidyverse )


source('D:/R-Projects/MyWalks/functions/compute_minimums_v01.R')
source('D:/R-Projects/MyWalks/functions/compute_q25_v01.R')
source('D:/R-Projects/MyWalks/functions/compute_medians_v01.R')
source('D:/R-Projects/MyWalks/functions/compute_q75_v01.R')
source('D:/R-Projects/MyWalks/functions/compute_maximums_v01.R')


compute_quantiles <- 
    function( days ){
        
       q0  <- compute_minimums( days )
       q1         <- compute_q25( days ) 
       q2    <- compute_medians( days )
       q3         <- compute_q75( days )
       q4 <- compute_maximums( days )
                      
        bind_rows( minimums, 
                   q2, 
                   medians,
                   q3,
                   maximimums)
    }