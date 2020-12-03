# plot_temperature.R

################################################################################
# This function creates a tine series temperature at the time of my walk or
# a 11:53 AM. In addition it creates a loess smooth or the temperature which
# can be used to look for locale trends.
################################################################################

################################################################################
# Load required packages.
################################################################################

require( tidyverse )                    # I live in the tidyverse
require( lubridate )                    # For date processing ...
require( smooth )                       # Used to smooth data ...
require( tidyr )                        # So we can pivot thr data ...
require( cowplot )                      # For professional graphics ...


################################################################################
# Function definition
################################################################################

plot_temperature <- 
    function( weather )
    {
      ##########################################################################
      # We compute the length of the temperature and create a tine series index
      # so we can can yse the loess plot.
      ##########################################################################
      
      n <- dim( weather )[1]
      t <- 1:n
      
      ##########################################################################
      # We extract the date_time from the weather tibble and then extract the
      # date from the date_time object.
      ##########################################################################
      
      date_time <- 
       weather %>% 
         pull( date_time )
      date <- date( date_time )
       
      ##########################################################################
      # We  extract the temperature data from the input tibble so we can pass it
      # to the loess function to be smother.
      ##########################################################################
      
      temp <- 
        weather %>% 
        pull( temp )
      
      ##########################################################################
      # We comput the loess smooth of the temperature data.  Since there are 
      # four seans per year we use 1/4 as the smoothing window.
      ##########################################################################
      
      smooth <- 
        lowess( temp ~ t,
                f = 2/3 )
        
      ##########################################################################
      # We extract the soothed data from the smooth list.
      ##########################################################################
        
      smooth <- smooth$y
        
      ##########################################################################
      # We create a tibble of the computed data values.
      ##########################################################################
        
      tbl <- 
        tibble( date,
                t,
                temp,
                smooth )
      
      ##########################################################################
      # Chnage names for easy output.
      ##########################################################################
                  
      names(tbl) <- c( "Date", "t", "Observation", "Smoothed" )
            
        
      #######################,###################################################
      # We would like to plot the temperatures and the the smoothed temperatures
      # On the same plot.  To have an automatic legend we must all the change  
      # the data to long form.
      ##########################################################################
       
      tbl <- 
        pivot_longer( tbl,
                      cols      = c( Observation, Smoothed ),
                      names_to  = "Source",
                      values_to = "Temperature" )
    
      
      ##########################################################################
      # Define manual colors for output
      ##########################################################################
      
      colors = c(   "Observation" = "black",
                    "Smoothed"    = "red"    )
       
      plot <-  
        ggplot( tbl,
                aes( x = Date, y =Temperature, color = Source )) +
          geom_line()  +
          scale_color_manual(  values = colors ) + 
          xlab( "Date" ) +
          ylab( "Remperature(Fahrenheit)") +
        ggtitle( "Beginning walking Temperatures") +
        theme_cowplot()
      
      plot
      
    }

