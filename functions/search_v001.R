#search( for, in)

###############################################################################
# This function returns the column number of a dataframe or a tribble fiven
# The name of the column (key).
###############################################################################

search <- 
    function( key, variables ) match( key, variables )

