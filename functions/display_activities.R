# display_activities.R

display_activities <- 
    function( tabulation )
        {
          tabulation %>% 
            flextable() %>% 
                 fontsize( size = 20, part = "all" ) %>% 
                 width( j = 1,1.75 ) %>%
                 bold( i = 3, bold = TRUE, part = "body" )
        }