###############################################################################
# compute_means(  days )
###############################################################################
# The function computes thr relevant means uing the days tibble.
###############################################################################

compute_means <- 
    function( days ){
        
        days %>% 
            summarise( label    = "Means",
                       walked   =  NA,
                       miles    = mean( miles,   na.rm = TRUE ),
                       steps    = mean( steps,   na.rm = TRUE ),
                       hours    = mean( hours,   na.rm = TRUE ),
                       mph      = mean( mph,     na.rm = TRUE ),
                       pace     = mean( pace,    na.rm = TRUE ),
                       gain     = mean( gain,    na.rm = TRUE ),
                       kcal     = mean( kcal,    na.rm = TRUE ),
                       avg_hr   = mean( avg_hr,  na.rm  = TRUE ),
                       max_hr   = mean( max_hr,   na.rm = TRUE ),
                       breaks   = mean( breaks,   na.rm = TRUE ),
                       stumbles = mean( stumbles, na.rm = TRUE ),
                       falls    = mean( falls,    na.rm = TRUE ))
    }