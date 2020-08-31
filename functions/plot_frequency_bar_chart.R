# plot_frequency_bar_chart.R

require( tidyverse )                     # I live in the tidyverse ...


plot_frequency_bar_chart <- 
    function( data, 
              variable_name,
              x_axis_label = "",
              plot_title   = "" )
    {
       ########################################################################
       # We get the variable names of the tibble.
       ########################################################################
       
        vnames <- names( data )
        
        
        #######################################################################
        # Find the column position of the variable with name variable.
        #######################################################################
        
        position <- which( vnames == variable_name )[[1]]
        
        if( postion == 0 )stop( 
            "Variable name not found in data.frame or tibble")
        
        values <- data[, position ]
       
    }