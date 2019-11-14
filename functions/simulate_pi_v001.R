# simulate_predictionsi_v000.R
#
# This function simulates the process by drawing a random sample from the boot 
# procedure of bootstrap simulated means bd standards.  It then draws 1,1025
# normal replicates from this sample.  This process is repeate 1000,000 times.

y <- NULL

simulate_predictions <- function( boot_sample ){
    
    
    m <- dim( boot_sample )[1]                        # Length of boot sample 
                                                      # input ...

###############################################################################
# Loop through this process 1025 times to produce a simulated populariuon of  
# 1025^2 predictions ....
###############################################################################    
 
    predictions <- rep( 0., 10000 )                   # Create vector to hold 
                                                      # simulation results ...
    
    ###########################################################################
    # Looping through the following logic 100,000 times to create prediction
    # interval samples.  Note that we sample the mean and the standard 
    # dwciation together because the scatter plot of the standard deviation
    # shows the sampling distributions are depdendent.
    ###########################################################################
    
    for( i in 1:10000 ){  
       
        sampled <- sample_n( bsample,            # Draw a random sample of size
                             size=1,             # one from the sampling 
                             replace=TRUE )      # distribution
        
        mu <- sampled[[1,1]]                     # Extract mean from sampled ...
        sigma <- sampled[[1,2]]                  # Extract sigma from sampled ...
        
        predictions[i] <- 
            rnorm( 1, 
                   mean=mu,
                   sd=sigma )
    }
    
       predictions                                    # Return simulated 
                                                      # prediction distribution ...                      
}
    