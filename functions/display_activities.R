# display_activities.R

display_activities <- 
    function( tabulation )
        {
          tabulation %>% 
            flextable() %>% 
                fontsize( size = 20, part = "all" ) %>% 
                 width( j = 1, 2 ) %>%
                 bold( i = 3, bold = TRUE, part = "body" )
        }