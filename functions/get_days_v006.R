# get_days.r
###############################################################################
# The function reads the days and routes csv files and left joins them. It
# then computes derived variables and returns the tibble to the calling
# program.
###############################################################################
#
#
library(tidyverse)                              # I live in the tidyverse ...
library(lubridate)                              # For date arthimetic ...
library(readr)                                  # to read csv files ...

get_days <- function()                          # Start of function definition ...                  
{
    file_path <- file.path( "data",             # Define path to days.csv ...
                              "days.csv" )

    days <- read_csv( file_path,                 # read days.csv ...
                       col_types = cols())      
    #
    file_path <- file.path( "data",              # Cdeffine path to routes ...
                            "routes.csv")   
    #
    routes <- read_csv( file_path,               # Get routes.csv file ...
                        col_types=cols())             
    
    days <- left_join( days,                     # Left join days and routes ...
                       routes, 
                       col_types = cols())
    #
    days$start_hour <-                          # Convert start_hour to 
        as.character( days$start_hour )        # character ...
    
    days$start_hour <- 
        ifelse( days$start_hour == "9",         # If start_hour is 9:00 AM  
                "09",                            # we append a leading zero ...
                days$start_hour )
    
    days$date <- ymd( days$chr_date,           # Convert character to
                       tz=NULL )                 # Date object ...
    days$date <- as.Date( days$date )          # Ensire date has no time
                                               # components ...
    
    days$year  <- year(  days$date )           # Extract year from date ...
    days$month <- month( days$date )           # Extract month from date ...
    days$wday  <- wday( days$date,             # Extract day of wee from date ...
                         label=TRUE,
                         week_start=7,
                         abbr = TRUE )
    
    days$ksteps <- days$steps / 1000          # Convert steps to 1000 steps ...
    
    days %>% 
        select ( id,                              
                 date,                            
                 year,                           
                 month,
                 wday,
                 walked,
                 missed_reason,
                 weather,
                 temp,
                 rh,
                 start_hour,
                 route,
                 environment,
                 miles,
                 ksteps,
                 hours,
                 mph:shoes )
      #
}                                                # End of function
