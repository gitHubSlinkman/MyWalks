# plot_walk_frequency_v01.R

################################################################################
# Load required packages..
################################################################################

require( tidyverse )                   # I live in the tidyverse ...
require( cowplot )                     # For more professional plots ...


###############################################################################
# Load functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/fetch_values_01.R')
source('D:/R-Projects/MyWalks/functions/tabulate_walks_v01.R')


plot_walk_frequency <- 
    function( this_tibble )
    {   
        
        n <-dim( this_tibble )[1]
        
        if ( n <= 7) {
            y_scale <- seq( from = 0, to = 10, by = 2 )
        } else if ( n <= 30 ) {
            y_scale <- seq( from = 0, to = 35, by = 5 )
        } else if ( n <= 180) {
            y_scale <- seq( from = 0, to = 190, by = 10 )
        } else {
            y_scale <- seq(from = 0, to = 370, by = 20 )
        }
        
        
        this_tibble %>% 
            mutate( walked = ifelse( walked == 1,
                                      "Yes",
                                     "No" )) %>% 
            
                ggplot( aes( x = walked)) +
                    geom_bar( width = 0.50,
                              color = "black",
                              fill  = "green" ) +
                    geom_text(stat='count', 
                              aes(label =..count.. ),
                              vjust=-1) +
                    xlab( "Walked" ) +
                    scale_y_continuous( name = "Frequency",
                                        breaks = y_scale,
                                        labels = y_scale ) +
                    expand_limits( y = 10 ) +
                    ggtitle( "Walks taken during period" ) +
                    theme_cowplot()
    }
