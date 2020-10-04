# display_quantiles_v01.R

require( tidyverse )
require( flextable )

display_quantiles <- 
    function( quantiles )
    {
        integers  <- c( 2, 9:10 )
        decimals1 <- 10:13
        decimals2 <- 3:9
        
        quantiles %>% 
            flextable() %>% 
            colformat_int( j = integers, 
                           na_str = "" ) %>% 
            colformat_num( j = decimals1, 
                           na_str = "" ) %>% 
            colformat_num( j = decimals2,
                           na_str = "" ) %>% 
            set_header_labels( "label" = "Quantile",
                               "miles" = "Miles",
                               "steps" = "Steps \n(1000s)",
                               "hours" = "Hours",
                               "mph"   = "Miles/\nhour",
                               "pace"  = "Minutes/\nmile",
                               "kcal"  = "Calories\n(1000s)",
                               "avg_hr" = "Mean\nheart\nrate",
                               "max_hr" = "Maximum\nheart\nrate",
                               "breaks" = "Breaks\ntaken",
                               "stumbles" = "Stubles\nmade",
                               "falls"    = "Fales\nmade" ) 
    }