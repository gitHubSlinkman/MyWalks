# report_glance.R

#' report
#'
#' @param fit_model A fit model object that yoy wish to glance at
#'
#' @return a flextabkle of the glance 

#'
#' @examples
report_glance <- 
    function( fit_model ){
        glance( fit ) %>% 
            select( r.squared,
                    sigma,
                    statistic,
                    p.value,
                    df,
                    df.residual ) %>% 
            flextable() %>% 
            width( j = 1:6, 1.00 ) %>% 
            colformat_num( j = 1:4,
                           digits = 4 ) %>% 
            set_header_labels( 
                r.squared   = "R-squared",
                sigma       = "Estimated\nsigma",
                statistic   = "F-statistic",
                p.value     = "p-value",
                df          = "Model\ndf",
                df.residual = "df\nresiduals" )
    }