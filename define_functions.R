# functions.R

###############################################################################
# This function loads my most used packahes and sets the degault ggplo2 theme
# to cowpolut.
###############################################################################

        suppressMessages( library( tidyverse ) )         # I live in the tidyverse ...
        suppressMessages( library( lubridate ) )         # For powerful date processing ...
        suppressMessages( library( readr ) )             # For raw data input ...
        suppressMessages( library( readxl ) )            # To read Excel spreadsheets ...
        suppressMessages( library( purrr ) )             # To allow functional prgramming
        
        suppressMessages( library( glue ))               # A tidyverse improvement to paste ...                                                # loops ...
        suppressMessages( library( Hmisc ))              # To impute missing values ...
        suppressMessages( library( stringr ) )           # Consistent string functions ...
        suppressMessages( library( modelr ) )            # Regression support packages ...
        suppressMessages( library( broom ) )             # Converts regression output to
        # tidy data ...
        suppressMessages( library( GGally ) )            # For scatter plot matrix ...
        suppressMessages( library( Hmisc ) )             # For data imputation ...
        suppressMessages( library( flextable ) )         # For nice table output ...
        suppressMessages( library( officer ) )           # For extensions to flextble 
        # Microsft Word ...
        suppressMessages( library( latex2exp ) )         # Converts laytec notation to
        # R mathemtical exprressions ...
        suppressMessages( library( cowplot ) )           # For better looking graphs with
        
###############################################################################
# We set the defualt theme to them_cowplot to make our graphs publishable
# quality.
###############################################################################        

theme_set( theme_cowplot())                             
        

##############################################################################
# get_days( ) function
##############################################################################

get_days <- 
    function()
      {
        #######################################################################
        # We read the days.xlsx file in the followiung two statements.
        #######################################################################
        
        fp <-                                           # Build file path ...
            file.path( '~/R-Projects/MyWalks/data',
                       'days.xlsx')
        
        days <- read_excel( fp )                       # Read days.xlsx  ...
      
        
        ##########################################*****************************
        # The routes file contains information concerning the route that does
        # not change from route to route.  We rera it now.
        #######################################################################
        
        fp <-                                           # Build file path ...
          file.path( '~/R-Projects/MyWalks/data',
                     'routes.xlsx' )
        routes <- read_excel( fp )
        
        #######################################################################
        # We perform a left join on the days and routes tibbles.
        #######################################################################
        
        days <- 
          left_join( days, routes, 
                     by = "route",
                     copies = FALSE,
                     keep = FALSE )
        
        #######################################################################
        # We add erived data files to the days tibble.  We make thew follwing
        # data conversions:
        #   1. Convert Excel data and time POSIXct data and tine.
        #######################################################################  
        
        days <- 
          days %>% 
            mutate( date_time =  ymd_hms( date_time ))
        
        tz( days$date_time ) <- Sys.timezone( location = TRUE )
              
        #######################################################################
        # We return the tibble to the calling programs'
        #######################################################################
        
        days
    }


###############################################################################
# Function: plot_bar_walks
###############################################################################
# This function draws a bar chart of the number of days where no walk was 
# taken and days when walks were taked.
###############################################################################

plot_bar_walks <- 
    function( days )
    {
       walked  = sum( days$walked ) 
     
        days %>%
            select( date_time,
                    walked ) %>% 
            mutate( walked = ifelse( walked == 0, 
                                     "No", 
                                     "Yes" )) %>% 
            ggplot( aes( x = walked )) +
                geom_bar( fill = "blue",
                          width = 0.5 ) +
            geom_text(stat='count', 
                       aes(label=..count..) ,
                       vjust =-1 ) +
            expand_limits( y = walked + 5 ) +
            scale_x_discrete( "Walked" ) +
            scale_y_continuous( "Days"  ) +
            ggtitle( "MyWalks: Days walked and days not walked" )
   }


###############################################################################
# Function: plot_bar_missed_reasons
###############################################################################
# This function draws a bar-chart of the resons for missing walks. It is 
# rotated 90 degrees so the baar chart categories will show.
###############################################################################

plot_bar_missed_reasons <- 
  function( days ){

  #############################################################################
  # We keep only days with missedd walks.
  #############################################################################  
    
  missed_walks <- 
    days %>% 
      filter( walked == 0 )
  
  ############################################################################
  # We tally the number of missed walks by reason.  We need this to place
  # our counted data above each bar
  ############################################################################
  
    tallied_missed_reasons <-    
      missed_walks %>% 
        group_by( missed_reason ) %>% 
          tally( sort = TRUE, name = "frequency" )
   
     max_y <- max( tallied_missed_reasons$frequency ) + 2 

    ########################################################################
    # Draw barchart of missed_reason.
    ########################################################################
     
    missed_walks %>% 
        ggplot( aes( x = missed_reason )) +
          geom_bar( color = "red",
                    fill = "red" ) +
          geom_text( stat='count', 
                     aes(label=..count..) ,
                     vjust = -1 ) +
          expand_limits( y = max_y ) +
          xlab( "Reason of missed walk" ) +
          ylab( "Frequency" ) +
          theme(axis.text.x=element_text(angle=90,hjust=1)) +
          ggtitle( "MyWalks: Reasons of missing walks" )
  }


###############################################################################
# Function convert_hhmm_hhdd
###############################################################################
# This function converts the time in hh:mm format to the decimal 
# format hh.dd.
###############################################################################
        
convert_hhmm_to_decimal <- 
  function( date_time ){
   h <- hour( date_time )
   m <- minute( date_time )
   round( h + m/60, 2 )
  }
        
        
###############################################################################
