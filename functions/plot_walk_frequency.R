# plot_walk_frequency.R

################################################################################
# Load required functions.
################################################################################

require( tidyverse )                   # I live in the tidyverse.
require( cowplot )

plot_walk_frequency <- 
    function( tabulation ){
        
        ymax <- max( tabulation$frequency )
        
        ggplot( tabulation, aes( x = Activity, y = Frequency)) +
            geom_col( color = "black",
                      fill = "green" ) +
            geom_text( aes( label = Frequency ), 
                       size    = 4, 
                       color    = "black",
                       position = position_dodge(width = 0.9),
                       vjust    = -0.50 ) +
            xlab( "Days" ) +
            ylab( "Frequency" ) +
            ggtitle( "Frequency of walks made and not made" ) +
            expand_limits( y = ymax + 10 ) +
            theme_cowplot()  
    }