# diagnose_heteroskedasticity.R

#' diagnose_heteroskedasticity.R
#' This function is used to draw a scatterplot of the square root of the
#' aboslute value of the residuals.  If the variance is approxumately
#' The smoothed line should be roughly horizontal.  Any other shape
#' indicates that the variance is not homoskedastic.
#'
#' @param fitted_model 
#'
#' @return a raphical object
#' 
#'
#' @examples
diagnose_heteroskedasticity <- 
    function( fitted_model ){
        
        yhat          <- fitted( fitted_model )
        ehat          <- residuals( fitted_model )
        sqrt_abs_ehat <- sqrt( abs( ehat ))
        ybar          <- mean( sqrt_abs_ehat )
        
        tibble( yhat, sqrt_abs_ehat ) %>% 
            ggplot( aes( x = yhat, y =  sqrt_abs_ehat )) +
            geom_point() +
            geom_smooth( color  = "green",
                         method = "loess") +
            geom_hline( yintercept = ybar ) +
            xlab( expression( hat( y ) )) +
            ylab( expression( sqrt( abs( hat(e)))))
    }