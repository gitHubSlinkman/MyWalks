# extract_variable_v_01.R
#
#########################################################################################
#
# Extracts the data values of the named variaable and returns them to the calling 
# R script.
#
# If the variable name is not found in the data object the script will stop with an
# error message
#
#########################################################################################

extract_variable <- 
    function( column_name,                        # Desired variable name ...
              data_source )                        # Data source ...
      {
       column_names <- colnames( data_source )    # Obtain column names from
                                                  # data source ...
      
       p <-match( column_name,                    # Search for desired column in
                  column_names )                  # column naames vecttor and
                                                  # return column position ...
       
                                                  # Check for unknown column name ...
       if( is.na(p))
         stop( paste( column_name, 
                      "not found in colnames of data source"))
      
       variable <- data_source[[p]]               # Extract variable from
                                                  # tibble ...
        
      variable[!is.na(variable)]                  # Remove missing values and
                                                  # return ...
    }

###End of function***
        
        
        
        
        
        
        
        