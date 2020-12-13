# plot_wind_direction.R
#
################################################################################
# This is a bar chart on an ordered factor and summerizes the wind doirection
# for the span od the time series.
################################################################################


################################################################################
# Load required packages
################################################################################

require( tidyverse )          # MyWalks lives ion the tidyverse ...
require( cowplot )            # For ggplot extensions ...

plot_wind_direction <- function( dayroutes )
    {
       day_routes %>% 
        ggplot( aes( x = wind )) +
            geom_bar( color = "black",
                      fill = "blue") +
            geom_text(stat='count', 
                      aes(label=..count..), vjust=-1 ) + 
            xlab( "Wind direction" ) +
            ylab( "Frequency" ) +
            ggtitle( "Distribution of wind direction") +
            theme_cowplot() +
        
       
}
