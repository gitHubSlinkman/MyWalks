# test__tabulate_walks.R

###############################################################################
# Load required packages.
###############################################################################

require( tidyverse )


###############################################################################
# Load required functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/get_day_routes.R')
source('D:/R-Projects/MyWalks/functions/filter_by_days.R')
source('D:/R-Projects/MyWalks/functions/tabulate_walks.R')


###############################################################################
# Get day_routes data
###############################################################################

all_day_routes <- get_day_routes() 


###############################################################################
# Tests accurate count
###############################################################################

tabulation <- tabulate_walks( all_day_routes )
( correct_answer <- dim( all_day_routes)[1] )
tabulation <- tabulate_walks( all_day_routes )
( answer = sum( tabulation$frequency ) )
print

##############################################################################
# Test 366 days tabulation.
##############################################################################

last_366_day_routes <- filter_by_days( all_day_routes, 366 )
( correct_answer      <-  dim( last_366_day_routes )[1] )
tabulation          <- tabulate_walks( last_366_day_routes )
( answer              <- sum( tabulation$frequency )[1] )


##############################################################################
# Test last_365 days_tabulation.
##############################################################################

last_365_day_routes <- filter_by_days( all_day_routes, 366 )
( correct_answer    <-  dim( last_365_days )[1] )
tabulation          <- tabulate_walks( last_365_day_routes )
( answer            <- sum( tabulation$frequency )[1] )

#############################################################################
# Test last 180 day_routes.
#############################################################################

last_180_day_routes <- filter_by_days( all_day_routes, 180 )
( correct_answer    <-  dim( last_180_day_routes )[1] )
tabulation          <- tabulate_walks( last_180_day_routes )
( answer            <- sum( tabulation$frequency )[1] )

