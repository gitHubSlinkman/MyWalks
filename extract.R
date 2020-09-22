# extract.R

###############################################################################
# Load packages.
##############################################################################
#'extract
#'This function extracts a variable specified by the variable this from the
#'data-frame or tibble specified by from. 
#'
#' @param this 
#' @param from 
#'
#' @return
#' @export
#'
#' @examples
#' 
extract <- 
    function( this, from ){
        
        this %>% 
            pull( this )
    }


