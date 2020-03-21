# Read MyWalks using xlsx file

library( tidyverse )
library( lubridate )
library( readxl )

###############################################################################
# Read MyWalks data files which are storded in xlsx format,
###############################################################################

FOLDER <- "data"
DAYS   <- "days"
ROUTES <- "routes"

days   <- read_MyWalks( FOLDER, DAYS )
routes <- read_MyWalks( "data", ROUTES )

days <- left_join( days,
                   routes,
                   by = "route" )

##############################################################################
# Get year, month, and day from input date
##############################################################################

tz( days$date ) <- "America/Chicago"

days$date      <- as.Date( days$date )
days$year      <- year( days$date )
days$month     <- month( days$date )
days$month_day <- day( days$date )

###############################################################################
# We convert the start time to decimal so we can plot a histogram of the start
# times ...
###############################################################################

days$start_time   <- hour( days$start_time ) +
                     round( minute( days$start_time )/60, 2)


##############################################################################
# We transform variables for ease of printing.  ksteps is a thousand steps 
# for a walk.
##############################################################################

days$ksteps <- days$steps / 1000

mutated_days <- 
   days %>%
        select( id,
                date,
                year:month_day,
                walked,
                missed_reason,
                weather,
                temp,
                rh,
                shoes,
                route,
                environment,
                start_time,
                miles,
                -steps,
                ksteps,
                miles, 
                hours, 
                mph,
                laps,
                mpl,
                pace, 
                gain, 
                kcal,
                avg_hr,
                max_hr,
                pace.01:pace.08,
                breaks,
                shuffles,
                device:failure_reason )
#
mutated_days

mutated_days %>% 
    filter( walked ==1 & gps_failure == 0  )

