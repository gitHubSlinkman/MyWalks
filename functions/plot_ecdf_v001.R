#plot_ecdf.R

###############################################################################
# This function plots the emirical cimulative distribution with confience
# intervals from vactor input.  Because of the wide variety of variables
# that will use this function, it is allowed in to imput minimum and maximum
# values of the variable being plotted.
###############################################################################

#' Title
#'
#' @param x      is a numeric vector with no missing values
#' @param vname  is a character string giving the output string on the graph
#' @parm  alpha  is the probability that the interval will not contain the
#'               population cummulative distribution function
#' @param xmin   is the minimum value to be on the x-axis
#' @param xmax   is the maximum value to be shown on the x-axis.
#'
#' @return       a ggplot2 object to be printed   
#' @export       none
#' 
#'
#' @examples
#' 

require(tidyverse)                              # I live in the tidyverse ...

plot_ecdf <- 
    function( x,
              alpha = 0.05,
              vname,
              xmin=NULL,
              xmax=NULL ){
        #
   
        
        #######################################################################
        # We first construct the emprical cummulative distribution function.
        #######################################################################
        #
        x <- sort( x )                           # Sort data into ascending
                                                 # value ...
        
        unique_x <- unique( x )                  # Detrmine values that are
                                                 # unique ...
        
        n_all <- length( x )                     # Dermine sample size ...
        n_unique <- length( unique_x)            # Determine the number of unique
                                                 # observations ...
        #
        #######################################################################
        # Set up vectors to hold the frequency.
        #######################################################################
        #
        f   <-  rep( 0, n_unique )               # Initialise frequency ...
      
        #
        #######################################################################
        # We now loop through the unique values counting the number of times a
        # variable occurs to obtain the values in the frecquency vector.
        #######################################################################
        #
        for( unique in 1:n_unique){
            for( i in 1:n ){
                if( unique_x[unique]  == x[i])f[unique] <- f[unique] + 1
            } # End if i loop 
        } # End of unique loop
        #
        ######################################################################
        # Compute the relative frequency and the cummlative relative
        # cummulative relative frequency
        ######################################################################
        #
        rf <- round( f / n_all, 4 )              # Compute relative 
                                                 # frequency ...
        #
        crf <- cumsum( rf )                      # Compute cummulative
                                                 # relative frequency ...
        
        #
        #
        #######################################################################
        # We are know going to compute the ( 1 - alpha)*100 confidence 
        # interval for the empirical cummulative distribution function.  The
        # reference for this technique is: Castro, Rui(2013), "Lecture 1 - 
        # Introduction and the Empirical CDF," 
        # https://www.win.tue.nl/~rmcastro/AppStat2013/files/lecture1.pdf,
        # Downloaded 2019/10/12.
        #######################################################################
        #
        epsilon <- sqrt( 1/(2*n)*log(2/alpha))   # Compute the error bound
        #
        l <- crf - epsilon                       # compute lower confidence
                                                 # can't be less than 0 
        l[l<0] <- 0                              # Set negative values to 0 ...
        #
        u <- crf + epsilon                       # Compute upper confidence
                                                 # boundary ...
        u[u>100] <- 1.0                          # Cummulative frequency can not 
                                                 # begreater than 1.00 ...
        ecdf <- tibble( x=unique_x,
                        f,
                        rf,
                        crf)
        return(ecdf)
    }