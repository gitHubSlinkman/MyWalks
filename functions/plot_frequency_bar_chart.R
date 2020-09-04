# plot_frequency_bar_chart.R

require( tidyverse )                     # I live in the tidyverse ...
require(cowplot)                         # For professional quality graphics ...


plot_frequency_bar_chart <- 
    function( variable, 
              x_axis_label = "",
              title   = "" )
    {
       ########################################################################
       # ggplot2 requires a tibble.
       ########################################################################
        
        tbl <- tibble( variable )
        
        
        #######################################################################
        # We need to tabulate the variable so we can find the maximum 
        # frequency so we can make room for the frequency counts on top of
        # the bars.
        #######################################################################
        
        tabulation <- 
            tbl %>%
                group_by( variable ) %>% 
                   summarize( frequency  = n()) %>% 
                arrange( desc( frequency))
        
        #######################################################################
        # Find max frequency.
        
        ######################################################################
        ymax <- tabulation$frequency[1]
           
        ggplot( tbl, aes( x = variable )) +
            geom_bar( color = "black",
                      fill = "green" ) +
            geom_text( stat = 'count',
                       aes(label =..count.., 
                           vjust = -0.2)) +
            coord_cartesian( ylim = c( 0, ymax + 5 )) +
            xlab( x_axis_label ) +
            ylab( "Frequ ency") +
            ggtitle( title ) +
            theme_cowplot() +
            theme(axis.text.x = element_text(angle = 90, 
                                             vjust = 0.5, 
                                             hjust=1))
        
       
    }