# Stackoverflow example

require(tidyverse)

heart_rates <- c( "<= 88",
                  "89 - 103",
                  "104 - 118",
                  "119 - 133",
                  ">= 134" )

hours <- c( 2.00, 1.02, 0.21, 0.86, 0.41 )

df <- tibble( heart_rates, hours )

ggplot(df, aes( x = heart_rates, y = hours ) ) +
    geom_col()

