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
    function( fitted_model, daignostics ){
        
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
            autofit()
    }