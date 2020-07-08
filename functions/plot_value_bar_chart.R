# plot_bar_char.R
###############################################################################
# plot_bar_chart( variable)
###############################################################################

plot_value_bar_chart <- 
    function( x_variable,
              y_variable,
              y_scale         = NULL,
              x_variable_name = NULL,
              y_variable_name = NULL,
              plot_title      = NULL,
              bar_width       = NULL,
              fill_color      = "green" )
        {
              ##############################################################
              # Create dataframe-ribble object to pass to ggplot from 
              # x_variable and y_variable.
              ##############################################################
        
              this_tibble <- tibble( x_value, y_vslue )

              ################################################################
              # We remove missing values from the variable data.
              ################################################################
              
              this_tibble <- this_tibble[complete.cases( this_tibble)]
              
         
              
              
              ##############################################################
              # Create a tibble and pass the tibble to ggplot ro create 
              # bar chart.
              ##############################################################
        
              ) %>% 
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