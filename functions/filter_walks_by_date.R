# filter_by_date.R

filter_walks_by_date <- 
    function( walks, days ){
        #
        filter_date <- today() - days
        #
        walks %>% 
            filter( date > filter_date )
        #
    }