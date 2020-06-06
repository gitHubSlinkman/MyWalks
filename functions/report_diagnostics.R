# report_diagnostics.R

#' report_diagnistics
#' 
#' This function displays the diagnostics q nd highlights the observations
#' that are either outliers or highly influential, that is, observations that
#' have extremely high hat values, or have high covariance ratios.  Highly
#' influential variables are dislayed in blue.  Outliers are displaed in red.
#' While Cook's distabce is an influential meansure is is considered an 
#' outliwe in this report.
#' 
#' @param fit_model  is the fitted model 
#' @param daignostic is the diagnostic report chenerated by
#'        compute_diagnostics( fi_model )
#'
#' @return The diaqgnostic report as a flextable
#' 
#'
#' @examples
#' report_diagbistics( fit_model, diagonstics )
#' 
report_diagnostics <- 
    function( fitted_model, daignostic ){
        
        ####################################################################
        # We need the sample size to set the criteria computed below.
        ####################################################################
        
        n <- dim( diagnostics )[1]
        p    <- length(fitted_model[[1]])
        df   <- n - p
        prob  <-  1 - 0.01 / (2 * n)
        t_cv   <- rep( prob, n)
        
        
                
        
        ####################################################################
        # Compute and
        
        
        ####################################################################
        # The compute outlier criteria.
        ####################################################################
        
        RSTUDENT <-                       # Bonferooni critical value
            qt( prob, df,                  # For outliers 
                lower.tail = TRUE )
        DFFITS   <- 3 / sqrt( n )         # Criteria for for deletion
                                          # fit statistic ...
        D2       <- 9 / n                 # Criteria for Cook's distance
                                          # measure ...
        
        
        ####################################################################
        # Criteria for influenttial observations ...
        ####################################################################
        
        
        HATVALUES  <-  3.00 * sqrt( p / n  ) # Criteria for high hat
                                             # values ...
        L_COVRATIO <-  1.00 - 3 * p / n      # Criteria for low covariance
                                             # ratio values ...
        H_COVRATIO <-  1.00 + 3 * p / n      # Criteria for high covariance
                                             # values ...
        
        ###################################################################
        # We produce the report as a flextable object.
        ###################################################################
        
        diagnostics %>% 
            flextable() %>% 
            width( j = 2:6, 1.00 ) %>% 
            colformat_num( j = 2:6,
                           digits = 4 ) %>% 
            set_header_labels( id = "Id",
                               rstudent = "Studentized\nresiduals",
                               hats     = "Hat\nvalues",
                               covratio = "Covariance\nratio",
                               dffits   = "DFFITS",
                               d2       = "Cooks's\ndistance") %>% 
            align( align = "left", 
                   part = "header" ) %>%
            color( ~ abs( rstudent ) > 3.00,
                   ~ rstudent , color = "red" ) %>%  
            bold( ~ abs( rstudent ) > 3.00,
                  ~ rstudent, bold = TRUE ) %>% 
            color( ~ hats > 3 * sqrt(p/n),
                   ~ hats, color="orange" ) %>% 
            bold( ~ covratio < L_COVRATIO,
                  ~ covratio, bold = TRUE )
        
            
        
    }