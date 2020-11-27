## plot_sky_conditions.R

###############################################################################
# Load required packages.
###############################################################################

require( tidyverse )                      # I live in the tidyverse ...
require( lubridate )                      # For advanced date processing ...
require( cowplot )                        # For superior plots ...
 
###############################################################################
# Load required functions
###############################################################################

source('D:/R-Projects/MyWalks/functions/find_max_frequency_v01.R')


################################################################################
# Function specification
################################################################################

plot_sky <- 
    function(df, days  )
    {
        ########################################################################
        # Compute the partition date to filter wather for the last days.
        ########################################################################
        
        partition_date <- today() - days + 1
        
        ########################################################################
        # Filter df to the last number of days
        ########################################################################
        
        tbl_temp <- 
           df %>% 
              filter(  date_time >  partition_date )
       
         
        ########################################################################
        # Determine max frequency of the categories so we can expand the 
        # y-axis limits so we can display counts.
        ########################################################################
        
        y_max = find_max_frequency( tbl_temp$sky )
        
        ########################################################################
        # Compute length of tibble ...
        ########################################################################
        
        n <- dim(tbl_temp )[1]
       
        
        ########################################################################
        # Adjust the expand limits so that is visible within the bounds of the 
        # the plot.
        ########################################################################
        
        expand <- ceiling( log2( n ) )
         
            ggplot( tbl_temp,
                    aes( x = sky )) +
                geom_bar( color = "black",
                          fill  = "green" ) +
                geom_text( stat='count', 
                           aes(label=..count..),
                           vjust=-1) +
                expand_limits( y = y_max + expand + 4 ) +
                xlab( "Sky condition") +
                ylab( "Frequency" ) +
                ggtitle( paste( "Sky Conditions for the last", n, "days" )) +
             theme_cowplot() +
             theme(axis.text.x = 
                      element_text( angle = 90, 
                                    vjust = 0, 
                                    hjust = 0.5 )) 
    }