# plot_scatter.R

require(tidyverse)                      # I live in the tidyverse
require(cowplot)                        # For professional graphics

theme_set( theme_cowplot)               # Make cowplot the default theme ...

plot_scatter <- 
    function(X, Y){
      
      df <- tibble( X, Y )
       
      ggplot( df, aes( x = X, y = Y )) +
        geom_point()
        
    }

require(alr3)

oldfaith <- as_tibble(oldfaith )

oldfaith <- 
    oldfaith %>% 
        mutate( Duration = Duration/60 )

duration <- 
    oldfaith %>% 
        pull(Duration)

interval <- 
    oldfaith %>% 
        pull(Interval)

plot_scatter( X = duration,
              Y = interval )
