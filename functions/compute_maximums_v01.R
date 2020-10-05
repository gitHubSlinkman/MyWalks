# computemaximums.R

require(tidyverse)

compute_maximums <- function( days )
{
    days %>% 
        summarise( label    = "Max:",
                   walked   = NA,
                   miles    = max( miles,   na.rm = TRUE),
                   steps    = max( steps,   na.rm = TRUE ),
                   hours    = max( hours,   na.rm = TRUE ),
                   mph      = max( mph,     na.rm = TRUE ),
                   pace     = max( pace,    na.rm = TRUE ),
                   kcal     = max( kcal,    na.rm = TRUE),
                   avg_hr   = max( avg_hr,  na.rm = TRUE ),
                   max_hr   = max( max_hr,  na.rm = TRUE ),
                   breaks   = max( breaks,  na.rm = TRUE ),
                   stumbles = max(stumbles, na.rm = TRUE ),
                   falls    = max( falls,    na.rm = TRUE ))
} 
