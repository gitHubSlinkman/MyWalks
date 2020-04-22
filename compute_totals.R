###############################################################################
# compute_totals( days )
###############################################################################
# Compute the totals for the relevant totals for the days file.
###############################################################################
compute_totals <- 
    function( days ){
        days %>% 
            summarise( label = "Totals:",
                       walked   = sum( walked, na.rm = TRUE),
                       miles    = sum( miles,  na.rm = TRUE),
                       steps    = sum( steps, na.rm = TRUE ),
                       hours    = sum( hours, na.rm = TRUE ),
                       mph      = NA,
                       mpl      = NA,
                       pace     = NA ,
                       gain     = sum( gain, na.rm = TRUE),
                       kcal     = sum( kcal, na.rm = TRUE),
                       avg_hr   = NA,
                       max_hr   = NA,
                       breaks   = sum( breaks,  na.rm = TRUE ),
                       shuffles = sum(shuffles, na.rm = TRUE ))
    }
