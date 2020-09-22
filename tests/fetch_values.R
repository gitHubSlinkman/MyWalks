---
title: "R Notebook"
output: html_notebook
---

## Test find_column_podition

## Load required packages

```{r}
require( tidyverse )                    # Load required packAGES ...
require( lubridate )                    # For data processing ...
```

## Create test data

```{r}
number <- 7
set.seed( 11 )                          # Set seed for consistent answers.
walk_id <- 1:number                         # Create walkd identifiers.
date    <- today()                      # Create seed date.    
for( i in 1:number )                    # One walk per day
    date <- today() + walk_id

routes <- c( "One",                     # Sefine 6 route names.
             "Two", 
             "Three", 
             "Four", 
             "Five",
             "Six" )

route <- sample( routes,                # Sample 7 waks from 6.
                 size = number,
                 replace = TRUE )

miles <- round( rnorm( number,mean = 6.00, sd = 1 ), 2) 
speed <- round( rnorm( number, mean = 3.25, sd = 0.50  ), 2)
hours <-round( miles /speed, 2 )

test <- 
    tibble( walk_id, date, route, miles, hours, speed  ) %>% 
    arrange( walk_id ) 
test
```

## tests 