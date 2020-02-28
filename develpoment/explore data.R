# Read MyWalks using xlsx file

library( tidyverse )
library( lubridate )
library( readxl )


FOLDER <- "data"
DAYS   <- "days.xlsx"
days_path <- file.path( FOLDER, DAYS )

days <- read_xlsx( days_path )

str( days )

##############################################################################
# Get year, month, and day from unput date
##############################################################################

days$year      <- year( days$date )
days$month     <- month( days$date )
days$month_day <- day( days$date )

###############################################################################
# We round the srart time to the nearest hour so we can draw a bar cahrt of the
# starting hours of the walks rounded to the nearest hour.                     
###############################################################################

days$hour   <- hour( days$start_time ) 
days$minute <- minute( days$start_time )

days$start_hour <- ifelse( days$minute > 20, 
                           days$hour + 1, 
                           days$hour )
days$date   <- as.Date( days$date )

##############################################################################
# We transform variables for ease of printing.  ksteps is a thousand steps 
# for a walk.
##############################################################################

days$ksteps <- days$steps / 1000

    days %>% 
        select( id,
                date,
                year:month_day,
                
                walked,
                missed_reason,
                condition:,
                shoes,
                route,
                start_hour,
                miles,
                -steps,
                ksteps,
                hours:failure_reason )
               
 str(days)   

