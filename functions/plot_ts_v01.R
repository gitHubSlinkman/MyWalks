# plot_ts_v01.R

################################################################################
# This functions plots time series for the MyWalks system.
################################################################################

################################################################################
#  Packages
################################################################################

require( tidyverse )                    # I live in the tidyverse
require( lubridate )                    # For date processing ...
require( smooth )                       # Used to smooth data ...
require( tidyr )                        # So we can pivot thr data ...
require( cowplot )                      # For professional graphics ...


################################################################################
# External functions needed.
###############################################################################

source('D:/R-Projects/MyWalks/functions/find_column_position_v01.R')


################################################################################
# Internal functions
################################################################################

make_title <- 
    function( variable_name, length )
    {
        paste( "Time seies plot of", 
                variable_name,
                "\nLength of time series is", length ) 
    }

###############################################################################
# Function definition.
###############################################################################

plot_ts <- 
    function( data,             # Data frame containing variable ...
              variable,         # variable to plot ...
              variable_name,    # variable name for axis labeling ...
              plot_title )       # Plot title ...
    {
        #######################################################################
        # Find position of desired variable in data source.
        #######################################################################
        
        position <- find_column_position( data,
                                          variable )
        
        #######################################################################
        # Extract variable and date from data frame.
        #######################################################################
        
       Observation <- 
            data %>% 
                pull( position )
       
       
       #######################################################################
       # Extract date_time from data data frame and extract date.
       #######################################################################
       
       date_time <- 
           data %>% 
            pull( date_time )
       Date <- date( date_time )
       
       
       #######################################################################
       # Determine the length of the time series and and create the time 
       # series index.
       #######################################################################
        
       n <- length( values )
       t <- 1:n
       
       #######################################################################
       # Apply the lowess smooth to the time seroes data.
       #######################################################################
       
       smooth <- 
           lowess( Observation ~ t,
                   f = 2/3 )
       
       ##########################################################################
       # We extract the soothed data from the smooth list.
       ##########################################################################
       
       Smoothed <- smooth$y 
       
       
       ##########################################################################
       # Create tibble to be used by ggplot to plot observarions.
       ##########################################################################
       
       working_tibble <- 
           tibble( Date, t, Observation, Smoothed )
       
       
       ##########################################################################
       # Change the plot_tibble to long form to allow multiple lines to be 
       # plotted by on call to ggplot and allow a plot legended to be created.
       ##########################################################################
       
       pivoted_table <- 
           pivot_longer(  working_tibble,
                         cols      = c( Observation, Smoothed ),
                         names_to  = "Source",
                         values_to = "Value" )
       
       
       #########################################################################
       # Define colors for ggplot scale_color_manual
       #########################################################################
       
       colors = c(   "Observation" = "black",
                     "Smoothed"    = "red"    )
       
       
       #########################################################################
       # Create the plot.
       #########################################################################  
       
           ggplot( pivoted_table,
                   aes( x = Date, y = Value, color = Source )) +
           geom_line()  +
           scale_x_date(date_labels = "%Y-%b") +
           scale_color_manual(  values = colors ) + 
           xlab( "Date" ) +
           ylab( variable_name ) +
           ggtitle( make_title( variable_name, n)) +
           theme_cowplot()
       
    }

