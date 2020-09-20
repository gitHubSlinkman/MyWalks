# tabulate_walks.R

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
           mutate( walked = 
                       ifelse( walked == 0,
                               "No",
                                "Yes")) %>% 
            count( walked ) %>% 
                rename( frequency = n )
    }