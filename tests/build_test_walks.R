# Build test file

require(tidyverse)                              # We live in the tidyverse
require(lubridate)                              # For more date functionality ...

source('~/R-Projects/MyWalks4/functions/get_walks.R') 
 
six_month_walks <- get_walks()
FP <- '~/R-Projects/MyWalks4/data/test-walks.csv'

write.table( six_month_walks,
             file = FP, 
             append = FALSE, 
             quote = TRUE, sep = ",",
            eol = "\n", 
            row.names = FALSE,
            col.names = TRUE )