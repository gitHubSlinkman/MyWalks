test__plot_walk_frequency.R

################################################################################
# Load required packages.
################################################################################

require( tidyverse )                    # I live in the tidyverse ...
require( cowplot )                      # For proeffessional plots ...


################################################################################
# Load required functions
################################################################################

source('D:/R-Projects/MyWalks/functions/get_day_routes.R')
source('D:/R-Projects/MyWalks/functions/plot_walk_frequency.R')


################################################################################
# Load day_routes.
################################################################################

day_routes <- get_day_routes()


###############################################################################
# Test plot+_walk_frequency
###############################################################################

plot_walk_frequency( day_routes )

```


