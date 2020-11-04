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
                   summarize( frequency  = n(), 
                              .groups = FALSE ) %>% 
                arrange( desc( frequency)) %>%
                ungroup()

        #######################################################################
        # Find max frequency.
        #######################################################################
        
        ymax <- tabulation$frequency[1]
        
        ggplot( tabulation,
                aes( x =  variable, y = frequency ))
        
       
    }