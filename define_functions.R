# functions.R

###############################################################################
# This function loads my most used packahes and sets the degault ggplo2 theme
# to cowpolut.
###############################################################################

load_packages <- 
    function() { 
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
        # ggplot2 ....
        #
        theme_set( theme_cowplot())                      # Sets cpowplot theme to be the  
        # default theme ...
    }


get_days <- 
    function()
      {
        fp <-                                           # Build file path ...
            file.path( '~/R-Projects/MyWalks/data',
                       'days.xlsx')
        
        days <- read_excel( fp )                       # Read days.xlsx  ...
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
            select( date,
                    walked ) %>% 
            mutate( walked = ifelse( walked == 0, 
                                     "No", 
                                     "Yes" )) %>% 
            ggplot( aes( x = walked )) +
                geom_bar( fill = "blue",
                          width = 0.5 ) +
            geom_text( stat='count', 
                       aes(label=..count..) ,
                    vjust=-1 ) +
            expand_limits( y = walked + 5 ) +
            
            scale_x_discrete( "Walked" ) +
            scale_y_continuous( "Days"  ) +
            ggtitle( "MyWalks: Days walked and das not walked" )
   }


###############################################################################