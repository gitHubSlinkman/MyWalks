# plot_bar_chart_v01.R

###############################################################################
# Load required packages.
###############################################################################

require(tidyverse)                      # I live in the tidyverse ...
require(lubridate)                      # For advanced date processing ...

###############################################################################
# Load required functions
###############################################################################

source('D:/R-Projects/MyWalks/functions/find_max_frequency_v01.R')


#' This function draws a frequency bar-chart of a variable.  If there are
#' missing variables it removes them prior to drawing the bar-chart.
#'
#' @param variable         is the name of the vector to  to be plotted.         - 
#' @param frequency_scale  is the optional scale to be used for the x-axis,
#' @param variable_name    is the label of the x-axis.  
#' @param plot_title       is the plot title 
#' @param bar_width        used to override default bar width
#' @param fill_color       used to override  default bar color
#'
#' @return                 a plot object
#' @export                 none
#' 
#' @examples               none
       
 
 
plot_bar_chart <- 
    function( variable,
              frequency_scale = NULL,
              variable_name   = NULL,
              plot_title      = NULL,
              bar_width       = NULL,
              fill_color      = "green" )
        {

              ################################################################
              # We remove missing values from the variable data.
              ################################################################
              
              variable <- variable[ !is.na( variable )]
              
              ###############################################################
              # Determine the maximum frequency to be plotted on the bar
              # so can allocate additional space to display frquences without
              # them being partially variable.
              ###############################################################
              
               max_frequency <- find_max_frequency( variable )
               
              
              
              ##############################################################
              # Create a tibble and pass the tibble to ggplot ro create 
              # bar chart.
              ##############################################################
              
               tibble( variable ) %>% 
                   ggplot( aes( x = variable)) +
                      geom_bar( color = "black",
                                fill  = fill_color ) +    
                      geom_text( stat = 'count',
                                 aes(label =..count.., 
                                     vjust = -0.2)) +
                      expand_limits( y = max_frequency + 10 ) +
                      xlab( variable_name ) +
                      ylab( "Frequency" ) +
                      ggtitle( plot_title ) +
                      theme_cowplot()
    }