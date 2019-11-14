# compute_statistics.R

summarise_variable <- 
    function( variable,
              vname )
    {
        obs      <- length( variable )
        variable <- variable[!is.na(variable)]
        n        <- length( variable )
        missing  <- obs - n
        tbl_1 <- tibble( vname, obs, missing, n ) 
        #
        tbl_2 <-
            tibble( variable) %>% 
                summarise( ybar   = mean( variable ),
                           s_y    = sd( variable ),
                           se     = s_y / sqrt(tbl_1$n ),
                           min    = min( variable ),
                           q010   = quantile( variable, 0.010 ),
                           q025   = quantile( variable, 0.025),
                           q250   = quantile( variable, 0.500 ),
                           median = median( variable ),
                           q750   = quantile( variable, 0.750 ),
                           q975   = quantile( variable, 0.975 ),
                           q990   = quantile( variable, 0.990 ),
                           max    = max( variable),
                           iqr    = q750 - q250,
                           range  = max - min )
        #
        return( bind_cols( tbl_1, tbl_2 ))
    } 
#