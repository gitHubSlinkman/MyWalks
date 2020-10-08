# plot_missed_walks_reasons.R

require( tidyverse )
require( cowplot )

plot_nmissed_walks_reasons <- 
    function( day_routes )
    {
        tabulation <- 
            all_day_routes %>%
            filter( !is.na( missed_reason)) %>% 
            group_by( missed_reason ) %>% 
            count()
        
        max_count <- max( tabulation$n )
        
        all_day_routes %>% 
            filter( !is.na( missed_reason )) %>% 
                ggplot( aes( x = missed_reason)) +
                geom_bar( na.rm = TRUE,
                          color = "black",
                          fill  = "green" ) +
                geom_text( stat = 'count',
                           aes( label =..count.., 
                                vjust = -0.2)) +
                xlab( "Reson for missing walk") +
                ylab( "Frequency" ) + 
                ggtitle( "Reasons that walks were missed") +
                expand_limits( y = max_count + 3 ) +
                 theme_cowplot() +
                theme(axis.text.x=element_text( angle = 45,
                                                hjust = 1 ))
        
        
    }