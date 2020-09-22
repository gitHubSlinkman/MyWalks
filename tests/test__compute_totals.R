# test__compute_totals.R
#
###############################################################################
# Load required packages.
###############################################################################

require( tidy_verse )


###############################################################################
# load required functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/passed.R')
source('D:/R-Projects/MyWalks/functions/get_day_routes.R')
source('D:/R-Projects/MyWalks/functions/filter_by_days.R')
source('D:/R-Projects/MyWalks/functions/compute_totals.R')

##############################################################################
# Get test data
##############################################################################

all_day_routes <- get_day_routes()          # Load required data.

last_007_day_routes  <-                    # Limit the number of records...
    filter_by_days( all_day_routes,        # To the last 7 days ...
                     7 )    


###############################################################################
# Execute function
###############################################################################

test <- compute_totals( last_007_day_routes )
test

###############################################################################
# Check computed totals.
###############################################################################test$

passed(test$walked, sum( test$walked ) )
