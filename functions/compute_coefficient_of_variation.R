# compute_coefficienr_of_variation.R
###############################################################################
# Function: compute_coefficient_of_varriation( means, stds )
###############################################################################

library( tidyverse )                             # I live in the tidyverse ...


compute_coefficient_of_variation <- 
    function( means, stds  ){
        
        label = "Cofficient of variation:"   
        walked = NA
        miles  = stds$miles / means$miles
        steps  = stds$steps / means$steps
        hours  = stds$hours / means$hours
        mph    = stds$mph /  means$mph
        pace   = stds$pace / means$pace
        gain   = stds$ gain / means$gain
        kcal   = stds$kcal / means$kcal
        avg_hr = stds$avg_hr / means$avg_hr
        max_hr = stds$max_hr / means$max_hr
        breaks = stds$breaks / means$breaks
        shuffles = stds$shuffles / means$shuffles
        
        tibble( label,
                walked,
                miles,
                steps,
                hours,
                mph,
                pace,
                gain,
                avg_hr,
                max_hr,
                breaks,
                shuffles )
        
    }