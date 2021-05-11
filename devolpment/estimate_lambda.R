# ols_estimation.R

# This routine determine the value of the smoothong parameter lambda that will
# minimize the sum-of-squared-errors.
#

require( tidyverse )
require( lubridate )
require( latex2exp )
require( cowplot )

source('D:/R-Projects/MyWalks/functions/get_weather_v01.R' )
weather <- get_weather()

n <- dim( weather )[1]

index <-  1:n

temperature <- 
   weather  %>%
     mutate( date = date( date_time )) %>% 
        select( date,
                temp ) %>% 
        add_column( index, .before = 1)

lambda <- seq( from = 0.10, 
               to   = 0.99,
               by = 0.01 )

m <- length( lambda )
sse <- rep( NA, m )


for( i in 1:m ){
    fit <- loess( temp ~ index,
                  data = temperature,
                  parametric = FALSE,
                  degree = 2,
                  family = "symmetric",
                  span = lambda[i])
    sse[i] <- sum( fit$residuals^2 )
}

math <- 

results <- tibble( lambda, sse )

ggplot( results,
        aes( x = lambda,
             y = sse )) +
    geom_line(  ) +
    xlab( TeX( "$\\hat{\\lambda}$")) +
    ylab( "Sum of squared errors") +
    ggtitle( "Selecting the lowess parametermfor OLS fit" ) +
    theme_bw() 


optimal_lambda <- 
    results %>% 
        filter( sse == min( sse )) %>% 
            pull( lambda )
optimal_lambda

fit <-  fit <- loess( temp ~ index,
                      data = temperature,
                      parametric = FALSE,
                      degree = 2,
                      family = "symmetric",
                      span = optimal_lambda )

fitted <- fit$fitted

termperature <- 
    temperature %>% 
        add_column( fitted )
      
ggplot( temperature,
        aes( x = date,
             y = temp )) +
        geom_line() +
        geom_line( aes( x= date,
                        y = fitted ),
                   color = "red" ) +
    xlab( "Date" ) +
    ylab( "Temperature(Farenheit" ) 
    ggtitle("Loess smooth of Temperature" ) +
    theme_cowplot()
