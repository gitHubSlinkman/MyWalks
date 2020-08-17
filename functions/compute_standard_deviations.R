# compute_statndard_deviations.R
###############################################################################
# Function: compute_standard_deviationss( days )
###############################################################################
# This function computes the relevant standrd deviation of the days tibble.
###############################################################################

require( tidyverse )                             # I live in the tidy verse ...

compute_standard_deviations <- 
    function( days ){
        
        days %>% 
            summarise( label    = "Standard deviations:",
                       walked   =  NA,
                       miles    = sd( miles,   na.rm = TRUE ),
                       steps    = sd( steps,   na.rm = TRUE ),
                       hours    = sd( hours,   na.rm = TRUE ),
                       mph      = sd( mph,     na.rm = TRUE ),
                       pace     = sd( pace,    na.rm = TRUE ),
                       gain     = sd( gain,    na.rm = TRUE ),
                       kcal     = sd( kcal,    na.rm = TRUE ),
                       avg_hr   = sd( avg_hr,  na.rm  = TRUE ),
                       max_hr   = sd( max_hr,   na.rm = TRUE ),
                       breaks   = sd( breaks,   na.rm = TRUE ),
                       stumbles = sd( stumbles, na.rm = TRUE ))
        
    }
