# my_ecdf.R

###############################################################################
# This dunction returns the empirical cummulative distribution fumction. It
# differs from the bare R function in that it returns the frequency, raw
# cummaltive frequency, and the cummaltive relative frequency.
###############################################################################

compute_ecdf <- 
    function( x ){
    
    all     <- sort( x )                # Sort the data into ascending order ...
    uniques <- sort( unique(x) )        # Sort the unique values into ascending 
                                        # order
    
    n_all <- length( x )                # Compute data length ...
    n_unq <- length( uniques )          # Compute number of unique values ...
    
   f <- rep( 0, n_unq )                 # Set up vector to hold frequency of
                                        # each value ...
    
    for( i_unq in 1:n_unq )             # Loop thriugh each unique value ....
    {
       for( j_all in 1:n_all ){         # Loop through orginal values ....
           
          ##Count the number of matches to the uniques in the orginal data ...
           
          if( uniques[i_unq] == all[j_all])f[i_unq]  <-  f[i_unq] + 1
       } 
    }
   
   x <- uniques                         # Copy the unique valuers to the x vector
                                        # for output ...
     
   cf <- cumsum( f )                    # Compute cummulative frequency ...
   
   ecdf <- cf / cf[ n_unq]                # cimpute the relative cummulative
                                        # frequency ...
   
   t <- tibble( uniques, f, cf, ecdf)   # Create tibble for output ...
   
   
   colnames( t ) <-                     # Assign column names so user knows what
       c( "x",                          # she is getting ....
          "f", 
          "rf", 
          "ecdf" )                      # return tibble
   
   t                                    # return tibble ...
    }
    
    
    

