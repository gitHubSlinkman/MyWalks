# display_quantiles.R

display_quantiles <- 
    function( variable_tibble ){
        variable_tibble %>% 
            select( vname:n, min:range) %>% 
            
            regulartable() %>% 
            width( j=1, 1.25 ) %>% 
            colformat_int( col_keys = c("obs",
                                        "missing",
                                        "n" ),
                           big.mark=",",
                           na_str = "" ) %>% 
            colformat_num( col_keys = c( "min",
                                         "q010",
                                         "q025",
                                         "q250",
                                         "median",
                                         "q750",
                                         "q975",
                                         "q990",
                                         "max",
                                         "iqr",
                                         "range"),
                           digits = 2,
                           na_str = "" ) %>%
            set_header_labels( "vname"   = "Variable",
                               "obs"     = "Obs",
                               "missing" = "Missing",
                               "min"     = "Minimum",
                               "q010"    = "1%",
                               "q025"    = "2.5%",
                               "q975"    = "97.5%",
                               "q250"    = "25%",
                               "q750"    = "75%",
                               "median"  = "median",
                               "q990"    = "99%", 
                               "max"     = "Maximum",
                               "iqr"     = "IQR",
                               "range"   = "Range" ) %>%
            add_header( top = TRUE,
                        vname = "Quantiles and related statistics ") %>% 
            theme_vanilla() %>% 
            autofit()
            
    }