# fetch_variable_values.R

###############################################################################
# Load required packages.
###############################################################################

require( tidyverse )                    # Live in the the tidyverse ....

###############################################################################
# Load required functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/find_column_position.R')


#'fetch_values fetches the all the values of a variable in a dataframe or a
#'             tibles.
#'
#'
#'
#' @param data           is either a dataframe or a tibble 
#' @param variable_name  is a string variable name
#' @return               a vector of variables ...
#' @export
#'
#' @examples
#' 
fetch_values <- 
    function( data, variable_name )
    {
        position <- find_column_position( data, variable_name )
        
        data %>% 
            pull( position )

    }

