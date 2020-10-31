# Make example 

library( tidyverse )

data("diamonds")
diamonds

diamonds %>% 
    ggplot( aes( x = cut)) + 
        geom_bar()
