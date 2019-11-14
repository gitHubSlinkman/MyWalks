# display_parametriucs.R
#
display_parametrics <- 
    function( variable_tibble ){
        #
        variable_tibble %>% 
            select( vname:se ) %>% 
            regulartable() %>% 
            border_remove() %>% 
                width( j=1, 1.50 ) %>% 
            colformat_num( col_keys = c( "ybar", 
                                         "s_y",
                                         "se" ),
                           big.mark = ",",
                           digits = 2, 
                           na_str = "" ) %>% 
            set_header_labels( "vname"  =  "Variable",
                               "obs"     = "Obs",
                               "missing" = "N/A",
                               "n"       = "n",
                               "ybar"    = "Mean",
                               "s_y"     = "Std dev.") %>%
            theme_booktabs() %>% 
            autofit()
        
    }
