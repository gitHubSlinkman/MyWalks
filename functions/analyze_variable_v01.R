# analyze_variable_v_01.R

###############################################################################
# Load packages
###############################################################################
#
suppressMessages( library(tidyverse) )           # We live in the tidyverse ...
suppressMessages( library(lubridate) )           # For date arthimetic ....
suppressMessages( library(flextable) )           # For data display 
#
##############################################################################
# Load needed functions
##############################################################################
#
# Extract univariate variable univariate analysis ...
#
source( '~/R-Projects/MyWalks4/functions/extract_varianble_v001.R' ) 
#

##############################################################################
# Function analyze_variable definition starts here ...
##############################################################################

analyze_variable <- 
    function( column_name,                     # Character  variable name
              data_source )                      # Data source file
        {
        #
        variable <- 
            extract_variable( column_name,     # Extract variable data 
                              data_source )      # from data source ...
       
        f( n < 5){
            plot_dot_plot( variable, "column_name" )
        } else {
            if(client=='public'){
                tot.price <- net.price * 1.06    # 6% VAT
            } else {
                tot.price <- net.price * 1    # 0% VAT
            }
        }
        
        #
        }
