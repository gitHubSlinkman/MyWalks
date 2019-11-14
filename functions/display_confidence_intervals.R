# display_confidence_intervals.R

###############################################################################
# This function displats the various confidence intervals computed by ci.boot
###############################################################################

display_confidence_intervals <- 
    function( ci ){
      
        ######################################################################
        # Convert the computed confidence intervals from a list to a tibble
        # to use with flextable.
        ######################################################################
        
        type   <- c( "Normal", "Basic", "Studentized", "Percentile", "BCa")
        conf  <- c( ci[[4]][1], ci[[5]][1], ci[[6]][1], ci[[7]][1], ci[[8]][1] )
        lower <- c( ci[[4]][2], ci[[5]][4], ci[[6]][4], ci[[7]][4], ci[[8]][4] )
        upper <- c( ci[[4]][3], ci[[5]][5], ci[[6]][5], ci[[7]][5], ci[[8]][5] )
        ci_length <- upper - lower
        
        tibble( type, conf, lower, upper, ci_length  ) %>% 
            flextable() %>% 
            set_header_labels( "conf" = "Confidence\nlevel",
                               "lower" = "Lower\bound",
                               "upper" = "Upper\nbound",
                               "ci_length" = "Length of\ninterval" )
        
    }