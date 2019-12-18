before <- dir()
before
unlink("*.html")
unlink( "010_walks_categotical_analysis_005_files", recursive=TRUE )
unlink( "020_list_last_seven_days_v004_files", recursive=TRUE )
unlink( "040_global_analysis_miles",
        recursive=TRUE )
after <- dir()
after
delta <- setdiff( before, after )
delta
