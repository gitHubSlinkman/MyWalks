# tabulate_walks.R

###############################################################################
# required packages
###############################################################################
tabulate_walks <- 
    function( tbbl )
    {
       tbbl %>% 
            group_by( Walked ) %>% 
                summarise( Frequency = n(),
                           .groups = "keep" )
    }