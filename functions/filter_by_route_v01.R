# filter_by_route.R

#' Filter by route
#' 
#' This function returnss all the rows in the data object that are the desired route. 
#'
#' @param data           a tibble or data.frame object that contins the route column.
#' @param desired_route  is the the oute that we need
#'
#' @return a tibble with all the walks taked on the desired rout.
#'
#'
#' @examples
#' 
#' 
#' 
filter_by_route <- 
    function( data, desired_route ){
        data %>% 
            filter( route == desired_route )
    }