# develop__plot_wind_direction.R

require( tidyverse )          # MyWalks lives in the tidyverse environment ...
require( lubridate )          # For consistent date processing ...



###############################################################################
# Load function definitions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/get_day_routes_v01.R')
source('D:/R-Projects/MyWalks/functions/plot_wind_direction.R')


###############################################################################
# Get day_routes data.
###############################################################################

day_routes <- get_day_routes()          # Get the data ...
day_routes                              # Confirm data was read ...


################################################################################
# Plot wind directions.
################################################################################

plot_wind_direction( day_routes )

