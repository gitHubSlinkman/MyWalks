# passed.R

###############################################################################
# Load the required functions.
###############################################################################
require( tidyverse )                    # I live in the tidyverse ....
require( purrr )                        # Formfinction iteration ...

test_scalar <- 
    function( test_answer, 
              correct_answer )
    {
       test_answer == correct_answer 
    }

test_vector <- 
    function( test_answer,
              correct_answer )
    {
       n <- length( test_answer )
       passed <- rep( FALSE, n)
     
       for( i in 1:n )
           passed[1] <- test_answer[1] == correct_answer[i]
       
       all( passed )
    }