# make_test_data.R

make_test_data <- function(){
    set.seed( 11 )
    Number        <- 14
    answer_pk     <-  1:Number
    answer_date   <-  today() - answer_pk
    
    answer_routes  <- c( "One",
                         "Two",
                         "Three",
                         "Four",
                         "Five",
                         "Six",
                         "Seven",
                         "Eight",
                         "Nine",
                         "Ten" )
    
    answer_route <- sample( answer_routes,
                            size = 14, 
                            replace = TRUE )
    
    answer_laps  <-  sample.int( n = 1000,
                                 size = Number,
                                 replace = TRUE )
    
    
    missing <- sample.int( n = Number,
                           size = 2,
                           replace = FALSE )
    
    answer_miles <- round( rnorm(n = Number, mean = 6, sd = 1 ), 2 )
    
    answer_speed <- round( rnorm( Number, mean = 3, sd =0.25 ), 2)
    
    missing <- sample.int( n = Number,
                           size = 2,
                           replace = FALSE )
    answer_laps[missing[1]] <- NA
    answer_miles[missing[2]] <- NA
    answer_hours <- answer_miles /answer_speed 

    temp <-     
        tibble( pk    <-  answer_pk,
                date  <- answer_date,
                 route <- answer_route,
                 laps  <- answer_laps,
                 miles <- answer_miles,
                 hours <- answer_hours,
                 speed <- answer_speed ) 
        
    names(temp) <- c( "pk",
                      "date",
                      "route",
                      "laps",
                      "miles",
                      "hours",
                      "speed" )            
    temp
}