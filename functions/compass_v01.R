# compass_v01.R

################################################################################
# Load required packages
################################################################################

require( tidyverse )
require( readxl )


################################################################################
# This function loads the compass Excel spreadsheet.
################################################################################

get_compass <- 
    function()
    {
       fp <- file.path( "D:/R-Projects/MyWalks",
                         "data",
                         "compass.xlsx")
       
       compass <- read_xlsx( fp )
    }


###############################################################################
# This function looks use search key to return the row number of the first
# math in the table.  If the key is not found then a value of zero is returned.
# There are no rows for CALM and VAR (variable_winds).
################################################################################

find_compass_row <- 
    function( key )
    {
    
        
        row <- match( key, 
                      compass$direction,
                      nomatch = 0 )
        
        ifelse( row <= 2, 0, row )
    }
    
        
    
