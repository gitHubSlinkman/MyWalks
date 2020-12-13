# plot_wind_direction.R
#
###############################################################################
# This is a bar chart on an ordered factor and summerizes the wind direction
# for the span od the time series.
###############################################################################

###############################################################################
# Specify packages need to provide functionality.
###############################################################################

require( tidyverse )                # This project lives in the tidyverse ...
require( lubridate )                # For date processing ...
require( cowplot )                  # For additiobal ggplot functionality ...


###############################################################################
# Load required function definitions
###############################################################################

plot_wind_direction <- function( day_routes )
{
    day_routes %>%  
        ggplot( aes( x = wind )) +
            geom_bar( color = "black",
                      fill  = "blue" ) +
        geom_text(stat='count', aes(label=..count..), vjust=-1) +
        xlab( "Wind direction" ) +
        ylab( "Frequency" ) +
        ggtitle( "Distribution of wind direction" ) +
        theme_cowplot()
}
