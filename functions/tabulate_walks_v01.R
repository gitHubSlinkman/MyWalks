# tabulate_walks_v01.R

###############################################################################
# required packages
###############################################################################
tabulate_walks <- 
    function( day_routes )
    {
       ########################################################################
       # Count the number of days where ther we no walks and walks
       ########################################################################
       
        day_routes %>% 
            count( walked ) %>% 
                rename( frequency = n ) %>% 
                    mutate( walked = ifelse( walked == 0, "No", "Yes" )) %>% 
                        rename( "Walked" = "walked",
                                "Frequency" = "frequency" )
    }
    