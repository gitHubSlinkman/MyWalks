before <- dir()
before
unlink("*.html")
unlink( "010_impute_missing_files", recursive=TRUE )
unlink( "020_categorical_variables_files", recursive=TRUE )
after <- dir()
after
delta <- setdiff( before, after )
delta