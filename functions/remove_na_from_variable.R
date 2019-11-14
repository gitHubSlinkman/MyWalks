# remove_na_from_variable

remove_na_from_variable <- 
    function( variable ){
        variable[!is.na(variable)]
    }
