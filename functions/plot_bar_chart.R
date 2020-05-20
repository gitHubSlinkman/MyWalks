# plot_bar_char.R
###############################################################################
# plot_bar_chart( variable)
###############################################################################

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
              # Determine the maximum fequency to be plotted on the bar
              # so can allocate addtional space to display frquences without
              # them being partially visoble.
              ###############################################################
              
               max_frequency <- find_max_frequency( variable )
              
              
              ##############################################################
              # Create a tibble and pass the tibble to ggplot ro create 
              # bar chart.
              ##############################################################
        
              tibble( variable ) %>% 
                   ggplot( aes( x = variable )) +
                      geom_bar( color = "black",
                                fill = "green" ) +
                      geom_text( stat = 'count',
                                 aes(label =..count.., 
                                     vjust = -0.2)) +
                      expand_limits( y = max_frequency + 10 ) +
                      xlab( variable_name ) +
                      ylab( "Frequency" ) +
                      ggtitle( plot_title )
    }