# get_routes_ver_01.R
#
#------------------------------------------------------------------
# This function reads the routes that I walk in Arlington and    
# Kailua-Kona.
#------------------------------------------------------------------
#
#
#------------------------------------------------------------------
# Load required packages suprressing pacckage load messages ...
#------------------------------------------------------------------
suppressMessages(library(tidyverse))    
suppressMessages(library(readxl))                
#
get_routes <- function(){
    #
    #--------------------------------------------------------------
    # read the eoutes from an Excel spreadsheetm and retrun file
    # to the calling script ...
    #--------------------------------------------------------------
    read_excel( "Data/Routes.xlsx" )
    }
#