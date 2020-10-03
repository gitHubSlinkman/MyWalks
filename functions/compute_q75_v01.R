# compute_minimums.R

require(tidyverse)

compute_q75 <- function( days )
{
    q3 <- 0.75
    days %>% 
        summarise( label    = "Third Quartile:",
                   walked   = NA,
                   miles    = quantile( miles,  probs =  q3,   na.rm = TRUE),
                   steps    = quantile( steps,  probs  = q3, na.rm = TRUE ),
                   hours    = quantile ( hours, probs = q3, na.rm = TRUE ),
                   mph      = quantile( mph,    probs = q3,  na.rm = TRUE ),
                   pace     = quantile( pace,   probs = q3,  na.rm = TRUE ),
                   kcal     = quantile( kcal,   probs = q3,  na.rm = TRUE ),
                   avg_hr   = quantile( avg_hr, probs = q3,  na.rm = TRUE ),
                   max_hr   = quantile( max_hr, probs = q3,  na.rm = TRUE ),
                   breaks   = quantile( breaks, probs = q3,  na.rm = TRUE ),
                   stumbles = quantile(stumbles,probs = q3,  na.rm = TRUE ),
                   falls    = quantile( falls,  probs = q3,  na.rm = TRUE )
                   )
} 
