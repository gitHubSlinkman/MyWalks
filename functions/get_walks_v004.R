#
# get_walks_v004.R

library(tidyverse)                              # I live in the tidyverse ...
library(lubridate)                              # For date arthimetic ...
library(readr)                                  # to read csv files ...

get_walks <- function( file_path )
{

    walks <- read_csv( file_path )               # read walks data from csv
                                                 # files
    
    
    walks$date <- ymd( walks$chr_date,           # Convert character to
                       tz=NULL )                 # Date object ...
    walks#date <- as.Date( walks$date )          # Ensire date has no time
                                                 # components ...
    
    walks$year  <- year(  walks$date )           # Extract uear from date ...
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
                miles,
                ksteps,
                hours,
                mph:reason )
 
 pass_back
          
}
#


