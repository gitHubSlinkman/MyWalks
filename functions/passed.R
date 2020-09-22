# passed.R

###############################################################################
# Load the required functions.
###############################################################################

require( tidyverse )                    # I live in the tidyverse ....

passed <- 
    function( test_answer, 
              correct_answer )
    {
       test_answer == correct_answer 
    }
