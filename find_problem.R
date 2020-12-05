
require( tidyverse )
require( lubridate )
require( cowplot )

## Load functiions

source('D:/R-Projects/MyWalks/functions/get_day_routes_v01.R')
source('D:/R-Projects/MyWalks/functions/filter_by_days_v01.R')
source('D:/R-Projects/MyWalks/functions/plot_ts_v01.R')

day_routes <- get_day_routes()

plot_ts( data     = day_routes,
         variable = "temp",
         label    = "Temperature",
         title    = "Special title" )

