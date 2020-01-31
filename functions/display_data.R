# display_days.R

display_selected <- function( df,               # data.frame or tibble
                              row_start = 1,    # First row to ddisplay
                              row_last = 5,     # Last_row to display 
                              column_first = 1   # First column number to display 
                              column_last = 10 )
{
    df <- as_tibble( df )  
    
    df[row_start:row_last:column_first:column_last]  
}