# compute_critical_values.R

compute_critical_values <- 
    function( fitted_model ){
        
        ######################################################################
        # Determine sample size(n), number of predictors(p), and degrees of
        # freedom(df) of the fitted model.
        ######################################################################
        
        n <- length( fitted_model$residuals )
        p <- length( fitted_model$coefficients )
        df <- n - p
        
        ######################################################################
        # Compute the "critical values" for outliers, high leverlage points,
        # and influential observations.
        ####################################################################
        
        ####################################################################
        # We start with outliers.  Because this is a hypothestes test and
        # there are mulitple obsevarions we will use  Bonferroni approach
        # and divide alpha/2 by n.
        ####################################################################
        
        bonferroni <- qt( 1 - (0.01/(2 * n )), df )
        
        ####################################################################
        # Compute the "critical value" for the hatvalues.
        ####################################################################
        
        hatvalues <- 3 * p / n
        
        ####################################################################
        # Compute the lower and upper covariance ratio limits.
        ####################################################################
        
       lower_covratio  - 1 - 3 * p / n 
       upper_covratio <- 1 + 3 * p / n
       
       #####################################################################
       # Compute the critical value for the deletion statistic dffits.
       #####################################################################
       
       dffits <- 3 * sqrt( p /n )
       
       #####################################################################
       # Compute the critical value for Cook's distiance measure
       #####################################################################
       
       cooks_distance <- 9 / n
       
       tibble(  bonferroni,
                hatvalues,
                lower_covratio,
                upper_covratio,
                dffits,
                cooks_distance )
    }
 

