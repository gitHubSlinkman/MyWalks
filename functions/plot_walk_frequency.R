# plot_walk_frequency.R

################################################################################
# Load required packages..
################################################################################

require( tidyverse )                   # I live in the tidyverse.
require( cowplot )

###############################################################################
# Load functions.
###############################################################################

source('D:/R-Projects/MyWalks/functions/get_day_routes.R')
source('D:/R-Projects/MyWalks/functions/find_column__position.R')
source('D:/R-Projects/MyWalks/functions/fetch_variable_values.R')
source('D:/R-Projects/MyWalks/functions/tabulate_walks.R')


plot_walk_frequency <- 
    function( this_tibble )
    {   
        #######################################################################
        # We get the values od the walked variables.
        #######################################################################
        
        values    <- fetch_variable_values( data = this_tibble,
                                            variable_name = "walked" )
        
       
        ########################################################################
        # We re-code the walks from binary to an ordered catehorical variable.
        ########################################################################
        
        values <- ifelse( values == 1,
                          "Yes",
                          "No" )
        
        Walked <- factor( values, 
                          ordered = TRUE, 
                          levels = c("Yes", "No" ))
        ########################################################################
        # We build a tibble of the categorical variable and count the number of
        # walks and no walks.
        ########################################################################
        
        temp_tibble  <- tibble( Walked )
        
        tabulation <- tabulate_walks( temp_tibble )
        
        max_y <- max( tabulation$Frequency )
        max_y <- 10* ceiling( max_y /10 )
        
        ggplot( tabulation,
                aes( x = Walked, y = Frequency)) +
            geom_col( width = 0.75,
                      color = "green",
                      fill = "green") +
            geom_text( stat='identity', 
                       aes(label = Frequency ), 
                       vjust= -0.2 ) +
            expand_limits( y = max_y ) +
            ggtitle( "Days walked and not walked" ) +
            theme_cowplot()    
        
    }