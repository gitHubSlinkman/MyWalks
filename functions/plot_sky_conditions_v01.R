## plot_sky_conditions.R

###############################################################################
# Load required packages.
###############################################################################

require(tidyverse)                      # I live in the tidyverse ...
require(lubridate)                      # For advanced date processing ...

###############################################################################
# Load required functions
###############################################################################

source('D:/R-Projects/MyWalks/functions/find_max_frequency_v01.R')

plot_bar_chart <- 
    function( sky_conditions,
              frequency_scale = NULL,
              bar_width       = NULL,
              fill_color      = "blue" )
    {
        
        
        ###############################################################
        # Determine the maximum frequency to be plotted on the bar
        # so can allocate additional space to display frquences without
        # them being partially variable.
        ###############################################################
        
        max_frequency <- find_max_frequency( sky_conditions )
        
        
        
        ##############################################################
        # Create a tibble and pass the tibble to ggplot ro create 
        # bar chart.
        ##############################################################
        
        tibble( variable ) %>% 
            ggplot( aes( x = variable)) +
            geom_bar( color = "black",
                      fill  = "blue" ) +    
            geom_text( stat = 'count',
                       aes(label =..count.., 
                           vjust = -0.2)) +
            expand_limits( y = max_frequency + 10 ) +
            xlab( "Sky condition" ) +
            ylab( "Frequency" ) +
            ggtitle( plot_title ) +
            theme_cowplot()
    }