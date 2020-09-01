# remove_na.R

#' Title
#'
#' @param vector is an vector that we want to remove all the NA's.
#'
#' @return a vector wothout any NA's
#' @export
#'
#' @examples
remove_na <- 
    function( vector ){
        vector[!is.na(vector)]
    }