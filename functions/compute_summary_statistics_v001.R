# compute_summary_statistics_v001.R
#
###############################################################################
# The function computes the totals, means, and standard deviation of the miles,
# Ksteps, hours, mph, pace, altitude gain, and kilo-caalories of the walks
# taken.  Some summary statistics are not computes because thet make no sense. 
# for example, total mph makes no sense.
###############################################################################
#

compute_summary_statistics <- 
    function( input_tibble ){
#
            totals_line <- 
                input_tibble %>% 
                    summarise( id            = NA,
                               date          = NA,
                               wday          = NA,
                               missed_reason = "Totals",
                               walks         = sum( walks, na.rm=TRUE ),
                               route         = NA,
                               miles         = sum( miles,  na.rm=TRUE ),
                               ksteps        = sum( ksteps, na.rm = TRUE ),
                               hours         = sum( hours, na.rm = TRUE ),
                               mph           = NA,
                               pace          = NA,
                               kcal          = sum( kcal, na.rm=TRUE ))
#
            means_line <- 
                input_tibble %>% 
                    summarise( id            = NA,
                               date          = NA,
                               wday          = NA,
                               missed_reason = "Means",
                               walks         = NA,
                               route         = NA,
                               miles         = mean( miles,  na.rm=TRUE ),
                               ksteps        = mean( ksteps, na.rm = TRUE ),
                               hours         = mean( hours, na.rm = TRUE ),
                               mph           = mean( mph, na.rm=TRUE),
                               pace          = mean(pace, na.rm=TRUE ),
                               kcal          = mean( kcal, na.rm=TRUE ))
#
            stds_line <- 
                input_tibble %>% 
                    summarise( id            = NA,
                               date          = NA,
                               wday          = NA,
                               missed_reason = "Standard deviations:",
                               walks         = NA,
                               route         = NA,
                               miles         = sd( miles,  na.rm=TRUE ),
                               ksteps        = sd( ksteps, na.rm = TRUE ),
                               hours         = sd( hours, na.rm = TRUE ),
                               mph           = sd( mph, na.rm=TRUE),
                               pace          = sd(pace, na.rm=TRUE ),
                               kcal          = sd( kcal, na.rm=TRUE ))

            bind_rows( input_tibble,
                       totals_line,
                       means_line,
                       stds_line )      
    }