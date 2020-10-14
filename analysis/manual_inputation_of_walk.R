# impute_walk.R

require( tidyverse )
require( flextable )

fp <-                                           # Build file path ...
    file.path( 'D:/R-Projects/MyWalks/data',
               'days.xlsx')

days <- read_excel( fp )                       # Read days.xlsx  ...

stoval <- 
    days %>% 
        filter( route == "Stoval Park") 

stoval %>% 
    summarise( n = n(),
               miles = mean(miles),
               steps = mean( steps),
               hours = mean( hours ),
               mph   = mean( mph ),
               pace  =  mean( pace ),
               gain  = mean( gain ),
               cal   = mean( cal ))










r