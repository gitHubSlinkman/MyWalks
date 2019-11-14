# display_bootstrap_summary
#
###############################################################################
# This function displays the ssummary statistics of the bootartap sample
# computed with compute_statistics.
###############################################################################

display_bootstrap_summary <- 
    function(boot_object){
        n <- length( boot_object$data )           # Get sample size
        replications <- boot_object$REPS          # Get number of replications
        
        #######################################################################
        # Define statistics column
        #######################################################################
        
        Statistics <- c( "Mean:",
                         "Standard Deviation:" )
        
        
        ######################################################################
        # Get estimates ...
        ######################################################################
        
        Estimates <- c( boot_object$t0[1], boot_object$t0[2])
        
        #####################################################################
        # Compute bias 
        #####################################################################
        
        t1   <- mean( boot_object$t[,1] )
        t2   <- mean( boot_object$t[,2] )
        bias1 <- boot_object$t0[1] - boot_object$t0[1]
        bias2 <- boot_object$t0[2] - boot_object$t0[2]
        Bias <- c( bias1, bias2 )
        
        ####################################################################
        # Compute rhe standard error
        ####################################################################
        
        se.ybar   <- sd( boot_object$t[,1] )
        se.std    <- sd( boot_object$t[,2] )
        se        <- c( se.ybar, se.std )
        
        ###################################################################
        # Add ssample size and replications to each line of the bootstrap
        # table ....
        ###################################################################
        
        n <- rep( n, 2)
        Replications <- rep( REPS, 2)
        
        tibble( Statistics, 
                Estimates, Bias, 
                se,
                n,
                Replications ) %>% 
            flextable() %>% 
            set_header_labels( "se" = "Standard\nError",
                               "n"  = "Sample\nSize" ) %>% 
            colformat_num( col_keys=c( "Estimates","Bias", "se"),
                           digits=4,
                           big.mark = ",",
                           na_str = "" ) %>% 
            colformat_num( col_keys = c( "n", "Replications"),
                           digits = 0,
                           big.mark =",",
                           na_str = "" )
    }
    