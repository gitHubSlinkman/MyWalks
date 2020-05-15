# find_max_frequency.R
###############################################################################
# find_max_frequency( df, variable )
###############################################################################
# The function find the maximum frequency of a categorical varaible so we can
# expand the limits of a barchart to display the frequencies of each category.
###############################################################################

find_max_frequency <- 
    function( variable ){
        
        ######################################################################
        # Remove any missing values.
        ######################################################################
        
        variable <- variable[!is.na( variable )]
        
        ######################################################################
        # Determine the frequencies of each category of the variable.
        ######################################################################
        
        tabulation <- 
            tibble( variable ) %>% 
                group_by( variable ) %>% 
                    summarise( frequency = n())
        
        ######################################################################
        # Determine the meaximum frequency and return
        ######################################################################
        max_frequency <- 
            tabulation %>% 
             summarise( n = max( frequency ) )
        
        max_frequency
    }