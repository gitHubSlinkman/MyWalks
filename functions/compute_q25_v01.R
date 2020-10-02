# compute_minimums.R

require(tidyverse)

compute_q25 <- function( days )
{
    days %>% 
        summarise( label    = "First Quartile:",
                   walked   = NA,
                   miles    = quantile( miles,  probs = 0.25,   na.rm = TRUE),
                   steps    = quantile( steps,  probs = 0.25,   na.rm = TRUE ),
                   hours    = quantile ( hours,   probs = 0.25, na.rm = TRUE ),
                   mph      = quantile( mph,     probs = 0.25,  na.rm = TRUE ),
                   pace     = quantile( pace,    probs = 0.25,  na.rm = TRUE ),
                   kcal     = quantile( kcal,    probs = 0.25,  na.rm = TRUE ),
                   avg_hr   = quantile( avg_hr,  probs = 0.25,  na.rm = TRUE ),
                   max_hr   = quantile( max_hr,  probs = 0.25,  na.rm = TRUE ),
                   breaks   = quantile( breaks,  probs = 0.25,  na.rm = TRUE ),
                   stumbles = quantile(stumbles, probs = 0.25,  na.rm = TRUE ),
                   falls    = quantile( falls,    probs = 0.25,  na.rm = TRUE )
                   )
} 
