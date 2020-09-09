# test__plot_bar_chart.R

###############################################################################
# load required packages.
###############################################################################


require(tidyverse)                      # I live in the tidyverse ...
require(lubridate)                      # For advanced date processing
require(readxl)                         # To read Excel spreadsheets ...
require(cowplot)                        # for more professional graphics ...


###############################################################################
# Load required functions.
###############################################################################

source(source('D:/R-Projects/MyWalks/functions/get_day_routes.R'))
source('D:/R-Projects/MyWalks/functions/plot_bar_chart.R')

day_routes <- get_day_routes()

###############################################################################
# Extrack walks from data tibble. 
###############################################################################

walked <- 
    day_routes  %>% 
        pull( 3 )


###############################################################################
# Re-code from zero-one to "No walk"-"Walks".
###############################################################################

Activity <- ifelse( walked == 0, 
                  "No walk", 
                  "Walked" ) 
    

###############################################################################
# Plot frequency bat_chart after removing missing values.
###############################################################################

plot_bar_chart( variable = Activity )
