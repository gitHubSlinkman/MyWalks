# set_expansion_v01.R

###############################################################################
# The function is used to set the expansion on a barchart to ensure that the
# frequency counts can be seen on the plot.  
################################################################################

set_expansion <- 
    function( n )
    {
        if( n <= 7){
            return( n + 1 ) 
        } else if( n <= 31){
            return( n + 3  ) 
        } else if( n <= 60 ){
            return( n + 5 )
        } else if( n <= 90 ){
            return(105 )
        } else if( n <= 180 ){
            return( 200 )
        } else return( 375 )
    }
   
     