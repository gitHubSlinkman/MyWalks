#
# get_walks_v004.R

library(tidyverse)                              # I live in the tidyverse ...
library(lubridate)                              # For date arthimetic ...
library(readr)                                  # to read csv files ...

get_walks <- function( file_path )
{

    walks <- read_csv( file_path )               # read walks data from csv
                                                 # files
    #
    file_path <- file.path( "data",              # Construct file path to routes ...
                            "routes.csv")    
    routes <- read_csv( file_path )              # Get routes.csv file ...
    
    walks <- left_join( walks,                   # Left join walks and routes ...
                        routes )
    walks$start_hour <-                          # Convert start_hour to 
        as.character( walks$start_hour )         # character ...
    
    walks$start_hour <- 
        ifelse( walks$start_hour == "9",         # If start_hour is 9:00 AM  
                "09",                            # we append a leading zero ...
                walks$start_hour )
    
    walks$date <- ymd( walks$chr_date,           # Convert character to
                       tz=NULL )                 # Date object ...
    walks#date <- as.Date( walks$date )          # Ensire date has no time
                                                 # components ...
    
    walks$year  <- year(  walks$date )           # Extract year from date ...
    walks$month <- month( walks$date )           # Extract month from date ...
    walks$wday  <- wday( walks$date,             # Extract day of wee from date ...
                         label=TRUE,
                         week_start=7,
                         abbr = TRUE )
    
    walks$ksteps <- walks$steps / 1000          # Convert steps to 1000 steps ...
    
    
 
 pass_back <-                                   # Pass wanted variables back to
    walks %>%                                   # calling entity ...                              
        select( id,                              
                date,                            
                year,                           
                month,
                wday,
                walked,
                missed_reason,
                start_hour,
                route,
                environment,
                miles,
                ksteps,
                hours,
                mph:reason )
 
 pass_back
          
}
#


