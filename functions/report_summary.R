# print.R

#' Print summary
#'
#' @param summary is a summary object of  walks
#'
#' @return a formatted report of the summary line.

report_summary <- 
    function( summary ){
        summary %>% 
            flextable() %>% 
            width( j = 1, 2.0 ) %>% 
            colformat_int( j = 2,
                           na_str = "" ) %>% 
            colformat_num( j = 3:13,
                           digits = 2,
                           na_str = "" ) %>% 
            set_header_labels( label    = "Statistics",
                               walked   = "Walks",
                               miles    = "Miles",
                               steps    = "Steps(k)",
                               hours    = "Hours",
                               mph      = "MPH",
                               pace     = "Pace",
                               gain     = "Gain",
                               kcal     = "KCal",
                               avg_hr   = "Mean\nhr",
                               max_hr   = "Maximum\nhr",
                               breaks   = "Breaks",
                               shuffles = "Shuffles") %>% 
            theme_zebra() %>% 
            autofit()
    }