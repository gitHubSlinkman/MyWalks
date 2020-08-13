# get_day_routes.R
###############################################################################
# Function get_days
###############################################################################
# This function reads the <Icrosoft Excel spread shets days.xlsx and 
# routes xlsx and left joins the two tibbles on roues.  The date and time
# are converted from Exceel format to POSIXct format.  The steps and kcal
# variables are divided by 1000 and rename to ksteps and kkcal.
###############################################################################


require(tidyverse)              # I live in the tidyverse ...
require(readxl)                 # To read Microsft Excell spreadshets ...
require(lubridate)              # For advnced date/time processing ....


##############################################################################
# get_days( ) function
##############################################################################

get_day_routes <- 
    function()
    {
        #######################################################################
        # We read the days.xlsx file in the followiung two statements.
        #######################################################################
        
        fp <-                                           # Build file path ...
            file.path( 'D:/R-Projects/MyWalks/data',
                       'days.xlsx')
        
        days <- read_excel( fp )                       # Read days.xlsx  ...
        
        
        #######################################################################
        # There is an error in the spreadsheet that I don't seem to be able to
        # fix.  The column for the variable gain was turned from numeric to 
        # characters.  Therefor I convert the character variables to 
        # numeric values here.
        #######################################################################
        
        days$gain <- as.numeric( days$gain )
        
        
        #######################################################################
        # The routes file contains information concerning the route that does
        # not change from route to route.  We rera it now.
        #######################################################################
        
        fp <-                                           # Build file path ...
            file.path( 'D:/R-Projects/MyWalks/data',
                       'routes.xlsx' )
        routes <- read_excel( fp )
        
        #######################################################################
        # We perform a left join on the days and routes tibbles.
        #######################################################################
        
        days <- 
            left_join( days, routes, 
                       by = "route",
                       copies = FALSE,
                       keep = FALSE )
        
        #######################################################################
        # We add derived data fields to the days tibble.  We make the
        # following data conversions:
        #   1. We convert the variable sky_conditions to a factor.
        #   1. Convert Excel data and time POSIXct data and tine.
        #######################################################################  
        
        
        #######################################################################
        # Change sky_conditions to ordered factor
        #######################################################################
        
        days$sky_conditions <- factor( days$sky_conditions,
                                       level )
        
        days <- 
            days %>% 
            mutate( date_time =  ymd_hms( date_time ))
        
        tz( days$date_time ) <- Sys.timezone( location = TRUE )
        
        
        
        #######################################################################
        # Because the variables steps and kcal can become very large we divide
        # each of this quantities by 1000.
        #######################################################################
        
         days <- 
            days %>% 
               mutate( steps = steps / 1000,
                    kcal = cal / 1000 )
        
        #######################################################################
        # We return the tibble to the calling programs'
        #######################################################################
        
        days
    }
