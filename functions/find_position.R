# find_variable_column_position.R

###############################################################################
# Load required packages.
###############################################################################

require( tidyverse )                    # I live in the tidyverse ...


###############################################################################
# Load required functions.
###############################################################################

find_position <- 
    function( key,  data )
    {
        #######################################################################
        # Get variables
        #######################################################################
        
        vnames <- names( data )
        
        
        #######################################################################
        # Find the column position of the variable in data.  If the variable 
        # is found the column position is returned.  If it is not found the
        # value 0  (zero) is returned.
        #######################################################################
        
        match( key,
            vnames, 
            nomatch = 0 )
    }
       

