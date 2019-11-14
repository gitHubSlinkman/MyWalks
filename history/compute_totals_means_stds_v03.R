# compute_totals_means_stds_ver_03.R
#
compute_totals_means_stds <- 
    function( walks ){
        #
        totals <- 
            walks %>% 
                summarise( statistic = "Totals:",
                           walks  = sum( walked, na.rm = TRUE ),
                           miles  = sum( miles,  na.rm = TRUE ),
                           ksteps = sum( ksteps, na.rm = TRUE ),
                           hours  = sum( hours,  na.rm = TRUE ),
                           mph    = NA,
                           pace   = NA,
                           kcal   = sum( kcal,   na.rm = TRUE ))
        #
        means <- 
            walks %>% 
                summarise( statistic = "Mean:",
                           miles  = mean( miles,  na.rm = TRUE ),
                           ksteps = mean( ksteps, na.rm = TRUE ),
                           hours  = mean( hours,  na.rm = TRUE ),
                           mph    = mean( mph,    na.rm = TRUE ),
                           pace   = mean( pace,  na.rm  = TRUE ),
                           kcal   = mean( kcal,  na.rm  = TRUE ))
        #
        stds <- 
            walks %>% 
                summarise( statistic = "Standard deviations:",
                           miles  = sd( miles,  na.rm = TRUE ),
                           ksteps = sd( ksteps, na.rm = TRUE ),
                           hours  = sd( hours,  na.rm = TRUE ),
                           mph    = sd( mph,  na.rm = TRUE ),
                           pace   = sd( pace,   na.rm = TRUE ),
                           kcal   = sd( kcal,   na.rm = TRUE ) )
        #
        tms <- bind_rows( totals, means, stds )
        #
       tms <- 
            tms %>% 
            select( statistic,
                    walks,
                    miles,
                    ksteps,
                    hours,
                    mph,
                    pace,
                    kcal ) 
        
        #
        # 
        digits_0 <-  c( "walks", "kcal" )
        digits_2 <-  c( "miles", "hours", "mph", "pace" )
        #
        tms %>% flextable() %>% 
                    width( j=1, 2.0 ) %>% 
                    colformat_num( col_keys = digits_0,
                                   digits = 0 ) %>% 
                    colformat_num( col_keys = digits_2 ) %>% 
                    set_header_labels( "statistic" = "Statistic",
                                       "walks"     = "Walks",
                                       "miles"     = "Miles",
                                       "ksteps"    = "KSteps", 
                                       "hours"     = "Hours",
                                       "mph"       = "MPH",
                                       "pace"      = "Pace",
                                       "kcal"      = "KCal" ) %>% 
                    theme_zebra() %>% 
                    fontsize( size = 13, part = "all") %>% 
                    autofit()
        #
        
                                        
    }