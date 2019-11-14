# extract the contents of a varriavle by name

require(tidyverse)                                    # I live in the 
                                                      # tidyverse ...
require(lubridate)                                    # For advanced date 
                                                      # functionality ...

###############################################################################
# This function retruns the column number of a dataframe or a tribble fiven
# The name of the column (key).
###############################################################################

get_variable_column_number <- 
    function( key, variable_names ){
        match( key, variable_names )
    }



FP <- '~/R-Projects/MyWalks4/data/test-walks.csv'     # Test data ...

walks <- read.csv( FP, 
                   header=TRUE,
                   sep=",",
                   stringsAsFactors = FALSE )

variable_names <- colnames( walks )

get_variable_column_number( key="date", variable_names )   # Should be 1 ...

                            