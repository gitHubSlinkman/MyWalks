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


###############################################################################
# Function definition.
###############################################################################

plot_ts <- 
    function( data,             # Data frame containing variable ...
              span = 90/260,    # Fraction of data used in fit  
              variable,         # variable to plot ...
              label,            # variable name for axis labeling ...
              title             # Plot title ...
                        )
    {
        ########################################################################
        # If label and title are missing set them to default values.
        ########################################################################
        
        if( is.null( label ))label <- variable
        if( is.null( title ))title <-  paste("Time series plot of", 
                                             label )
        
        
        
        ########################################################################
        # Find position of desired variable in data source.
        #######################################################################
        
        position <- find_column_position( data,
                                          variable )
        
        #######################################################################
        # Extract variable and date from data frame.
        #######################################################################
        
       Observations <- 
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
        
       n <- length( Observations )
       t <- 1:n
       
       loess_smooth <- 
           tibble( Date, t, Observations )
       
       #######################################################################
       # Apply the lowess smooth to the time seroes data.
       #######################################################################
       
      fit <- 
           loess( Observations ~ t,
                  data = data,
                  family = "sym",
                  method = "loess" )
       
       
       ##########################################################################
       # We extract the soothed data from the smooth list.
       ##########################################################################
       smoothed <-fit$fitted
       residual <- fit$residuals
       
       
       
       ##########################################################################
       # Create tibble to be used by ggplot to plot observarions.
       ##########################################################################
       
      loess_smooth <- 
           tibble( Date, t, Observations, Smooths )
       
       
       ##########################################################################
       # Change the plot_tibble to long form to allow multiple lines to be 
       # plotted by on call to ggplot and allow a plot legended to be created.
       ##########################################################################
       
       long_form <- 
           pivot_longer(  working_tibble,
                         cols      = c( Observations, Smoothed ),
                         names_to  = "Source",
                         values_to = "Values" )
       
       
       #########################################################################
       # Define colors for ggplot scale_color_manual
       #########################################################################
       
       colors = c(   "Observations" = "black",
                     "Smooths"      = "red"    )

       
       #########################################################################
       # Create the plot.
       #########################################################################  
       
           ggplot(long_form,
                   aes( x = Date, y = Values, color = Source )) +
           geom_line()  +
           scale_color_manual( values = colors ) +
           scale_x_date(date_labels = "%Y-%b-%d") +
           ylab( label ) +
           ggtitle( title ) +
           theme_cowplot() +
           theme( axis.text.x = 
                      element_text( angle = 90, 
                                    vjust = 0.5,
                                    hjust=1 ))
    }

