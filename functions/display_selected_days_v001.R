# display_selected_days_v001.R

display_selected_days <- 
    function( day ){
        
        days %>% 
            mutate( Walked = ifelse( walked == 1,
                                     "Yes",
                                     "No")) %>%
            select( id:date,
                    -walked,
                    Walked,
                    missed_reason,
                    weather,
                    temp,
                    rh,
                    route,
                    environment) %>% 
            
            flextable() %>% 
            width( j = 2, 2.0 ) %>% 
            width( j = 8, 3.0 ) %>% 
            colformat_num( j = 6,
                           big.mark = ",",
                           digits = 0,
                           na_str = "" ) %>% 
            set_header_labels( "id"            = "Id\n ",
                               "date"          = "Date\n ",
                               "Walked"        = "Walked\n ",
                               "missed_reason" = "Missed\nreason",
                               "weather"       = "Weather\n ",
                               "temp"          = "Tempature",
                               "rh"            = "Relative\nhumidity",
                               "route"         = "Route",
                               "environment"  = "Environment" ) %>% 
            fontsize( size=13, part="all") %>% 
            autofit()
    }