# get_walks_ver02.R
#
#########################################################################################
# This function read from a csv ciles.  It also  computes derived values and then
# reorders variables into "logical order".
#########################################################################################
#



get_walks <- function()
{
    
    FILE_PATH  <-  "data/Walks.csv"              # Specify file location
    
    walks <-                                     # Read xlsx file walks ...
        read_csv( FILE_PATH )
    
    walks$date <- as.Date( walks$date, 
                           "%m/%d/%Y" )
                     
    
    walks$year      <- year( walks$date )        # Extract year fromd date ...
    walks$month     <- month( walks$date )       # Extract month from date ...
    walks$week      <- week( date )              # Extract week of year ...
    walks$day       <- day( walks$date )         # Extract day of month ...
    
    walks$week_day  <- wday( walks$date, 
                             label = TRUE, 
                             abbr = TRUE,
                             week_start = 7 ) 

    
    walks$ksteps    <- walks$steps / 1000        # Convert steps to thouand steps ...
    
    walks %>% 
        select( id,
                date,
                year,
                month,
                day,
                week_day,
                walked,
                missed_reason,
                route,
                start_hour,
                miles,
                ksteps,
                steps,
                hours,
                mph,
                laps,
                mpl,
                pace,
                gain,
                kcal,
                pace.01,
                pace.02,
                pace.03,
                pace.04,
                pace.05,
                pace.06,
                pace.07,
                breaks,
                shuffles,
                phone,
                app,
                gps_failure )
    
}