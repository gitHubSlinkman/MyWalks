# boot_statistics.R

boot_statistics <- function(  variable, replications  ) {

    ###########################################################################
    # This function computes the mean of the bootstrap sample
    ###########################################################################
    
    compute_statistics <- function( variable, index ){
        selected <- variable[index]
        bar_y <- mean( selected )
        s_y   <- sd( selected )
        c( bar_y, s_y )
    
        }

    ###########################################################################
    # Create bootsrap object and return to the calling script.
    ###########################################################################

    boot( variable,
          R=replications,
          statistic=compute_statistics )
    
}