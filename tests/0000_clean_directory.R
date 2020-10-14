old_directory <- getwd()
new_directory <- file.path( old_directory, "tests")
before <- dir()
before
unlink("*.html")
after <- dir()
after
delta <- setdiff( before, after )
delta
directories <- list.dirs( recursive=FALSE)
library( stringr )
to_delete <- directories[grepl( pattern, directories )]
unlink( to_delete, recursive=TRUE )
dir()
setwd( old_directory )

