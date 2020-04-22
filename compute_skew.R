# compute_skew.R
###############################################################################
# Function: compute_skew( days )
###############################################################################
# This function computes the skewness of relevant data in days tibble.
###############################################################################

library( tidyverse )                             # I live in the tidyverse ...
library( e1071 )                                 # For the skewnwss function ..

compute_skewness <- 
    function( days ){

        days %>% 
            summarise( label = "Skewness:",
                       walked = NA,
                       miles    = skewness( miles,    na.rm = TRUE ),
                       steps    = skewness( steps,    na.rm = TRUE ),
                       hours    = skewness( hours,    na.rm = TRUE ),
                       mph      = skewness( mph,      na.rm = TRUE ),
                       pace     = skewness( pace,     na.rm = TRUE ),
                       gain     = skewness( gain,     na.rm = TRUE ),
                       avg_hr   = skewness( avg_hr,   na.rm = TRUE ),
                       max_hr   = skewness( max_hr,   na.rm = TRUE ),
                       breaks   = skewness( max_hr,   na.rm = TRUE ),
                       shuffles = skewness( shuffles, na.rm = TRUE ))
        
    }
