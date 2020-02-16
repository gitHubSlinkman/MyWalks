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

directories <- list.dirs( path =".",
                          pattern =  "^.*_files$" ) 
directories

glob2rx( "*_files" )
