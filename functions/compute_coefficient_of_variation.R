# compute_coefficienr_of_variation.R
###############################################################################
# Function: compute_coefficient_of_varriation( means, stds )
###############################################################################

library( tidyverse )                             # I live in the tidyverse ...


compute_coefficient_of_variation <- 
    function( means, stds  ){
        
        label = "Cofficient of variation:"   
        walked   = NA
        miles    = 100 * stds$miles    / means$miles
        steps    = 100 * stds$steps    / means$steps
        hours    = 100 * stds$hours    / means$hours
        mph      = 100 * stds$mph      /  means$mph
        pace     = 100 * stds$pace     / means$pace
        gain     = 100 * stds$gain     / means$gain
        kcal     = 100 * stds$kcal     / means$kcal
        avg_hr   = 100 * stds$avg_hr   / means$avg_hr
        max_hr   = 100 * stds$max_hr   / means$max_hr
        breaks   = 100 * stds$breaks   / means$breaks
        shuffles = 100 * stds$shuffles / means$shuffles
        
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