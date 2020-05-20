# diagnose_lnearity.R

#' diagnoose linearity
#' This function daraws the scaterplot of the residuals versus the fitted
#' values.  Its major purpose is to check the linearity assumption although
#' it can be used to discover potential outliers and heteroskedasticity.
#' 
#'
#' @param fitted_model  is the model fitted to the data.
#'
#' @returns              a scatterplot.
#' @export
#'
#' @examples             
#' 
diagnose_linearity <- 
    function( fitted_model ){
        yhat <- fitted( fitted_model )
        ehat <- residuals( fitted_model )
        
        tibble( yhat, ehat ) %>% 
            ggplot( aes( x = yhat, y = ehat)) +
            geom_point() +
            geom_hline( yintercept=0, 
                        color = "black" ) +
            geom_smooth( method = "loess",
                         color = "green") +
            xlab( expression( hat( y[1]) ) ) +
            ylab( expression( hat( e[1]))) +
            ggtitle( "Diagnosing the linearity assumptoion")
    }