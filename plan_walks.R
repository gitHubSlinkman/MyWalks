# gompute_olderst_walks.R

require( tidyverse )
require( lubridate )
require( flextable )

source("define_functions.R")

days <- get_days()

walks_summary <- 
        days %>% 
            filter( walked == 1 ) %>% 
                group_by( route ) %>% 
                 summarise( date = last( date)) %>% 
                    arrange( date )
walks_summary


