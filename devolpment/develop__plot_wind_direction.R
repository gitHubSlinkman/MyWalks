# develop__plot_wind_direction.R

################################################################################
# This is the development platform used to test plot_wind_directions as it is
# being developed.
################################################################################


################################################################################
# Load required oackages.
################################################################################

require( tidyverse )          # MyWalks lives in the tidyverse ...
require( lubridate )          # for date processing


################################################################################
#Load function definitions
################################################################################

source('D:/R-Projects/MyWalks/functions/get_day_routes_v01.R')
source('D:/R-Projects/MyWalks/functions/plot_wind_direction.R')


###############################################################################
# Get the data.
###############################################################################

day_routes <- get_day_routes()


###############################################################################
# Plot the wind direction.
###############################################################################

plot_wind_direction( day_routes )