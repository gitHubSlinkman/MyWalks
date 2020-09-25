# find_column_position.R

find_column_position <- 
    function( data, variable_name )
    {
        #######################################################################
        # Get the variable names of the data object.
        #######################################################################
        
        vnames <- names( data )
        
        #######################################################################
        # Find position column position.  If it does not match throw an error
        #######################################################################
        
        position <-match( variable_name, 
                          vnames,
                          nomatch = 0 )
        
        if( position == 0)stop( "Column position not found." )
        
        position
    }