# summarize_zones.R

summarize_zones <- 
    function( walks ){
        
        ######################################################################
        # Extract variable  from walks.
        ######################################################################
        
        tbl_temp <- 
            walks %>%
                select( id,
                        date_time,
                        route,
                        zone1:zone5 ) %>% 
                    filter( complete.cases(.))
        
        
        ###################################################################
        # Pivot on zomes to grate longer form of the data.
        ###################################################################
        
        longer_tbl <- 
            pivot_longer( tbl_temp,
                          cols = starts_with("zone"),
                          names_to = "zone",
                          values_to = "minutes",
                          values_drop_na = TRUE )
        
        
        ####################################################################
        # Summarize the hours walked in each zone and pass the the
        # summary tibble back to the the calling script.
        ####################################################################
        
        summary <- 
            longer_tbl %>% 
                group_by( zone ) %>% 
                summarise( hours = sum( minutes ) / 60 )
        
        range <- 
            c(  "< 88",
                "89 - 103",
                "104 - 118",
                "119 - 133",
                "> 130")
        
        add_column( summary,
                    range ) %>% 
            select(  range,
                     hours )
    }


