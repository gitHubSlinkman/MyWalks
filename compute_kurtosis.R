# compute_kurtosis.R
###############################################################################
# Function: compute_kurtosis( days )
###############################################################################

library( tidyverse )                             # I live in the tidyverse ...
library( e1071 )                                 # For kurtosis function ...

compute_kurtosis <- 
    function( days ){
        
        days %>% 
            summarise( label = "Kurtosis:",
                       walked = NA,
                       miles    = kurtosis( miles,    na.rm = TRUE ),
                       steps    = kurtosis( steps,    na.rm = TRUE ),
                       hours    = kurtosis( hours,    na.rm = TRUE ),
                       mph      = kurtosis( mph,      na.rm = TRUE ),
                       pace     = kurtosis( pace,     na.rm = TRUE ),
                       gain     = kurtosis( gain,     na.rm = TRUE ),
                       avg_hr   = kurtosis( avg_hr,   na.rm = TRUE ),
                       max_hr   = kurtosis( max_hr,   na.rm = TRUE ),
                       breaks   = kurtosis( max_hr,   na.rm = TRUE ),
                       shuffles = kurtosis( shuffles, na.rm = TRUE )) 
        
    }