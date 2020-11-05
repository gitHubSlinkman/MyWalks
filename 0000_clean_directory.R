before <- dir()
before
unlink("*.html")
unlink( "010_impute_missing_files", recursive=TRUE )
unlink( pattern = glob2rx( "*_files" ),
        recursive=TRUE )
after <- dir()
after
delta <- setdiff( before, after )
delta

directories <- list.dirs( recursive=FALSE)

pattern <- glob2rx( pattern = "*_files" )

library( stringr )

to_delete <- directories[grepl( pattern, directories )]

unlink( to_delete, recursive=TRUE )

before

delta

after

