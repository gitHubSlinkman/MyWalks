# compute_minimums_v01.R

require(tidyverse)

compute_minimums <- function( days )
{
    days %>% 
        summarise( label    = "Minimums:",
                   walked   = sum( walked,  na.rm = TRUE),
                   miles    = min( miles,   na.rm = TRUE),
                   steps    = min( steps,   na.rm = TRUE ),
                   hours    = min( hours,   na.rm = TRUE ),
                   mph      = min( mph,     na.rm = TRUE ),
                   pace     = min( pace,    na.rm = TRUE ),
                   kcal     = min( kcal,    na.rm = TRUE),
                   avg_hr   = min( avg_hr,  na.rm = TRUE ),
                   max_hr   = min( max_hr,  na.rm = TRUE ),
                   breaks   = min( breaks,  na.rm = TRUE ),
                   stumbles = min(stumbles, na.rm = TRUE ),
                   falls    =min( falls,    na.rm = TRUE ))
} 
