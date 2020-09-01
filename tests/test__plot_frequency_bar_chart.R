test__plot_frequency_barchart.R

###############################################################################
# Load packages.
###############################################################################

require(tidyverse)                      # I live in the tidyverse


###############################################################################
# Load functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/get_day_routes.R')
source('D:/R-Projects/MyWalks/functions/plot_frequency_bar_chart.R')
source('D:/R-Projects/MyWalks/functions/Find_column__position.R')
source('D:/R-Projects/MyWalks/functions/fetch_variable_values.R')
source('D:/R-Projects/MyWalks/functions/remove_na.R')

################################################################################
# Get data to test
################################################################################

all_day_routes <- get_day_routes()


###############################################################################
# Test: find_column_position
###############################################################################

variable_name = "missed_reason"

position <- find_column_position( data, variable_name ) # Answer should be 4.


##############################################################################
# Fetch the values of the desire variable.
##############################################################################

values <- fetch_variable_values( all_day_routes, "missed_reason" )
values


##############################################################################
# Remove all observations that are missing values
##############################################################################

values <- remove_na( values )
values



