## plot_missed_reason_v01.R

plot_missed_reasons <- 
    function( day_routes ){
        
        #######################################################################
        # Remove all rows with missing values.
        ######################################################################
        
       no_walks <- 
            day_routes %>% 
                filter( !is.na( missed_reason ))
       
      y_scale <- seq( from = 0, to = 36, by =4  )
        
      no_walks %>% 
          ggplot( aes( x = missed_reason )) +
            geom_bar( color = "black",
                      fill  = "green" ) +
            geom_text( stat = 'count',
                       aes( label =..count.., 
                           vjust = -0.2)) +
            xlab( "Resons for missing walk") +
            scale_y_continuous( name = "Frequency",
                                breaks = y_scale,
                                labels = y_scale ) +
            theme( axis.text.x = element_text(angle =90, 
                   vjust = 0.5, 
                   hjust=1 ))     
            
            
            
    }