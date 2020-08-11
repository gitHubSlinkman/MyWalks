# build_compass_dictionary.r

require( tidyverse )                        # I live in the tidyverse ...
require( readxl )                           # to reald a xlsx spreadsheet .../
require( hash )                             # For has table to be used as  
                                            # a dictionary ...
                                           
#' build_compass_dictionary
#' 
#' This function builds a hash table that relates wind directions as reported
#' by the Weather Underground to the degrees of a compass.  This allows 
#' direction to degrees.
#' 
#'
#' @return Compass hash table
#' @export
#'
#' @examples
#' 
#' 
build_compass_dictionary <- 
    function(  ){
        URL       <-  "data/compass.xlsx"
        temp      <-  read_xlsx( URL )
        direction <- temp$direction
        degrees   <- temp$degrees 
        hash( keys = direction,
              values = degrees )
    }

compass <- build_compass_dictionary()

values( compass, "N")
values( compass, "E")
values( compass, "S" )
values( compass, "W")

values( compass, "NE")
values( compass, "SE" )
vaales( compass, "SW" )
values( compass, "NW" )

values( compass, "NNE")
values( compass, "NEE")
values( compass, "SEE" )
values( compass, "SSE" )
values( compass, "SSW" )
