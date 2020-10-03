# compute_minimums.R

require(tidyverse)

compute_medians <- function( days )
{
    days %>% 
        summarise( label    = "Medians:",
                   walked   = NA,
                   miles    = median( miles,   na.rm = TRUE),
                   steps    = median( steps,   na.rm = TRUE ),
                   hours    = median( hours,   na.rm = TRUE ),
                   mph      = median( mph,     na.rm = TRUE ),
                   pace     = median( pace,    na.rm = TRUE ),
                   kcal     = median( kcal,    na.rm = TRUE),
                   avg_hr   = median( avg_hr,  na.rm = TRUE ),
                   max_hr   = median( max_hr,  na.rm = TRUE ),
                   breaks   = median( breaks,  na.rm = TRUE ),
                   stumbles = median(stumbles, na.rm = TRUE ),
                   falls    = median( falls,   na.rm = TRUE ))
} 
