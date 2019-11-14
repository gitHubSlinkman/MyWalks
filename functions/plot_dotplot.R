# plot_dotplot.R

plot_dotplot <- 
    function( column, 
              column_name )
        {
            y_axis <- seq( from=0, to=10, by=1)
        
            tibble( column ) %>% 
                ggplot( aes( x=column ) ) +
                    geom_dotplot() +
                scale_alpha_continuous( name = column,
                                        breaks =y_axis,
                                        labels = y_axis ) +
                    theme_cowplot()
        }