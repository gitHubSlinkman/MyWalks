# report_fit_coefficients.R

report_fit_coefficients <- 
     function( model_fit )
    {
        tidy( model_fit ) %>% 
             flextable() %>% 
                width( j = 1, 1.25 ) %>% 
                width( j = 2:5, 1.00 ) %>% 
         colformat_num( j = 2:5, digits = 4 )
    }


        

        
   

