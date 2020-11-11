# plot_walk_frequency_v01.R

################################################################################
# Load required packages..
################################################################################

require( tidyverse )                   # I live in the tidyverse ...
require( cowplot )                     # For more professional plots ...


###############################################################################
# Define function.
################################################################################

plot_walk_frequency <- 
    function( this_tibble )
    {   
        
        walks <- sum( this_tibble$walked )
     
        if ( walks <= 7 ) {
            y_expand <-  walks + 2
        } else if ( walks <= 30 ) {
           y_expand <- walks +3
        } else if ( walks < 180) {
            y_expand <- walks + 5
        } else {
            y_expand  <- walks + 10 
        }
        
        
###############################################################################
# Plot walks frequency
###############################################################################
        
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
                    xlab( "Walked?" ) +
                    scale_y_continuous( name = "Frequency" ) +
                    expand_limits( y = y_expand ) +
                    ggtitle( "Walks taken during period" ) +
                    theme_cowplot()
    }
