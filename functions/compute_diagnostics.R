# compute_diagnostics.R

#' Title
#'
#' @param id is a value from the data set that is used as an identifier for 
#' the case.  If this is a null value an integer value will be supplied by
#' the compute diagnostics function.
#' 
#' @param fitted_model is the output of the linear model function lm().
#'
#' @return a tibble of the case id and diagnostic values.
#' 
#' @export
#'
compute_diagnostics <- 
    function( id = NULL,
              fitted_model )
    {
        ####################################################################
        # If the case id is NULL we generate a sequential id with vaules
        # from 1 through the sample size.  We determine the sample size by
        # the number of residuals in the fitted model.
        ####################################################################

        if( is.null( id ))
            {
                ehat <- residuals( fitted_model )
                n <- lemgth( ehat )
                id <- 1:n
            }
    
        ####################################################################
        # Build the diagnostics tibble from the fitted_model_function. Note
        # that the last tariables will be used latter when we evauate the
        # diagnostocs measures.  It is more more convenient to add them
        # here then create them latter
        ####################################################################
        
        rstudent       = rstudent( fitted_model )  # Sudentized residauls
        hats           = hatvalues( fitted_model ) # Hast values
        covratio       = covratio( fitted_model )  # Covariance ratio
        dffits         = dffits(  fitted_model )   # Deletion statistic for
                                                   # fitted valuecritical  ...
        d2 = cooks.distance( fitted_model )        # Cook's distance 
                                                   # measure
        
        tibble( id,                            # Return tibble ...
                rstudent,
                hats,         
                covratio,
                dffits,
                d2 )
        
            }
