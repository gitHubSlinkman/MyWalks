# 999_impute_missing_values.R

# This code segments loads the required libraries for the MapWalks system.
# This code segment musy be soueced prior to any other code segment that 
# uses any of the libraries.

suppressMessages( library( tidyverse ) )         # I live in the tidyverse ...
suppressMessages( library( lubridate ) )         # For powerful date processing ...
suppressMessages( library( readr ) )             # For raw data input ...
suppressMessages( library( readxl ) )            # To read Excel spreadsheets ...
suppressMessages( library( modelr ) )            # Regression support packages ...
suppressMessages( library( broom ) )             # Converts regression output to
                                                 # tidy data ...
suppressMessages( library( GGally ) )            # For scatter plot matrix ...
suppressMessages( library( 'blankDiag') ))             # Plot regression diagnostics ...
suppressMessages( library( Hmisc ) )             # For data imputation ...
suppressMessages( library( flextable ) )         # For nice table output ...
suppressMessages( library( officer ) )           # For extensions to flextble 
                                                 # Microsft Word ...
suppressMessages( library( latex2exp ) )         # Converts laytec notastion to
                                                 # R mathemtical exprressions ...
suppressMessages( library( cowplot ) )           # For better looking graphs with
                                                 # ggplot2 ....
#
theme_set( theme_cowplot())                      # Sets cpowploy theme to be the 
                                                 # default theme ...

###############################################################################
# The code below is from get_walks.  Ecentually we will modify get_walks to
# use this function.
##############################################################################

source( "functions/get_walks_v004.R" )
source( "functions/plot_qq_norm.R" )

file_path <- file.path("data","walks.csv")

walks_all     <- get_walks( file_path )

#############################################################################
# Remove walks thaat are over 180 days old ...
#############################################################################
#
date_today     <- as.Date( today() )
date_partition <- date_today - 180

walks_180 <-                                     # Extract the last 180 days walks ...
    walks_all %>% 
        filter( date > date_partition ) %>%      
        filter( walked == 1 )                    # And then remove all days not 
                                                 # walked 

ggpairs( walks_180, 
         columns = c( "miles", 
                      "ksteps",
                      "mph",
                      "pace",
                      "gain" ),
         axisLabels = "show",
         cardinality_threshold = 36,
         title = "Basic walking performance data" )
     



data_1 <- walks_180 
fit_1 <- lm(  ksteps ~ miles, data=walks_180 )
summary(fit_1)
data_1 <- add_predictions( data_1, 
                 model=fit_1,
                 var = "pred" )
data_1 <- add_predictions( data_1, 
                           model=fit_1,
                           var="resid")


gg_diagnose(fit_1, 
            theme = NULL, 
            ncol = 2, 
            plot.all = TRUE,
            scale.factor = 0.5, 
            boxcox = TRUE,
            max.per.page = 4 )




