# display_period.R

display_period <- 
    function( days ){
        last  <- today()
        first <- today() - days
        paste( "from", first, "to", last )
    }