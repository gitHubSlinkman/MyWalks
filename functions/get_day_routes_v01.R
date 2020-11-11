# get_day_routes_V01.R
###############################################################################
# Function get_day_routes
###############################################################################
# This function reads the Microsoft Excel spread shets days.xlsx and 
# routes xlsx and left joins the two tibbles on roues.  The date and time
# are converted from Excel format to POSIXct format.  The steps and kcal
# variables are divided by 1000 and rename to ksteps and kkcal.
###############################################################################


###############################################################################
# We load the required packages ...
###############################################################################

suppressMessages( require( tidyverse)) # I live in the tidyverse ...
suppressMessages( require( readxl ))   # To read Excel spreadsheets...
suppressMessages( require( lubridate )) # For date/time processing ...


###############################################################################
# Load the required functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/get_sky_conditions_factors.R')


###############################################################################
# get_days( ) function
###############################################################################

get_day_routes <- 
    function()
    {
        
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
        # The routes file contains information contains route data that does
        # not change from walk to walk.  We read it now.
        #######################################################################
        
        fp <-                                   
            file.path( 'D:/R-Projects/MyWalks/data',
                       'routes.xlsx' )
        
        routes <- read_excel( fp )
        
        
        #######################################################################
        # We perform a left join on the days and routes tibbles.
        #######################################################################
        
        day_routes <- 
           left_join( days,
                       routes, 
                       by = "route",
                       copies = FALSE,
                       keep = FALSE )
        
        
        #######################################################################
        # We add derived data fields to the days tibble.  We make the
        # following data conversions:
        #  1. Change the NA value of sky_conditions to "unrecorded."
        #  2. We convert the numeric walked to an ordered factor.
        #  3. We convert the variable sky_conditions to a factor.
        #  4. We convert the wind direction to an ordered factor.
        #  5. Convert Excel data and  POSIXct data and time.
        #######################################################################  
        
        #######################################################################
        # Change sky_conditions to ordered factor
        #######################################################################
        
        sky_factors <- get_sky_conditions_factors()
        
        day_routes$sky_conditions <-
            factor( day_routes$sky_conditions,
                    levels = sky_factors,
                    ordered = TRUE )
        
        
        #######################################################################
        # Change the direction_wind to an ordered factor.
        #######################################################################
        
        day_routes$wind <- 
            factor( day_routes$wind,
                    levels  = c( "CALM", "VAR",
                                 "N", "NNE", "NE", "ENE",
                                 "E", "ESE", "SE",  "SSE", 
                                 "S", "SSW", "SW", "WSW",
                                 "W", "WNW", "NW", "NNW" ),
                    ordered = TRUE )
        
        day_routes <- 
            day_routes %>% 
                mutate( date_time =  ymd_hms( date_time ))
        
        tz( day_routes$date_time ) <- Sys.timezone( location = TRUE )
        
        
        
        #######################################################################
        # Because the variables steps and kcal can become very large we divide
        # each of this quantities by 1000.
        #######################################################################
        
         day_routes <- 
            day_routes %>% 
               mutate( steps = steps / 1000,
                    kcal = cal / 1000 )
        
        #######################################################################
        # We return the tibble to the calling programs'
        #######################################################################
        
        day_routes
    }


