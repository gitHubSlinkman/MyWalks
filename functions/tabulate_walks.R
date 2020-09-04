# tabulate_walks.R

tabulate_walks <- 
    function( day_routes )
    {
        walks   <- sum( day_routes$walked )
        nowalks <- dim( day_routes)[1] - walks
        Activity <- c(  "No walks", "Walks", "Totals" )
        Frequency <- c( nowalks, walks, nowalks + walks )
        tibble( Activity, Frequency  )
    }
        