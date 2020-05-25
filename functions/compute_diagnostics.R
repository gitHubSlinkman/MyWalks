# compute_diagnostics.R

#' Title
#'
#' @param id is a value from the data set that is used as an identifier for 
#' the case.  If this is a null value an integer value will be supplied by
#' the compute diagnostics function.
#' 
#' @param fitted_model is the output of the linear model function lm().
#'
#' @return a tibble of diagnostic values.
#' 
#' @export
#'
compute_diagnostics <- 
    function( id = NULL, 
              fitted_model )
    {
        ####################################################################
        # Id the id has a null value we generate integer values to serve as
        # observation identification.
        ####################################################################
        
        if( is.null(id) ){
            n  <- length(residuals( fitted_model ))
            temp <- 1:n
        } else
            temp <- id
         
        ####################################################################
        # Build the diagnostics tibble from the fitted_model_function. Note
        # that the last tariables will be used latter when we evauate the
        # diagnostocs measures.  It is more more convenient to add them
        # here then create them latter
        ####################################################################
        
        id             = temp
        rstudent       = rstudent( fitted_model )
        hats           = hatvalues( fitted_model )
        covratio       = covratio( fitted_model )
        dffits         = dffits(  fitted_model )
        d2 = cooks.distance( fitted_model )
        
        
            tibble( id,
                    rstudent,
                    hats,         
                    covratio,
                    dffits,
                    d2 ) 
            }
