# fetch_variable_values.R

###############################################################################
# Load required packages.
###############################################################################

require( tidyverse )                    # Live in the the tidyverse ....


###############################################################################
# Load required functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/Find_column__position.R')



fetch_variable_values <- 
    function( data, variable_name )
    {
        position <- find_column_position( data, variable_name )
        
        data %>% 
            pull( position )

    }