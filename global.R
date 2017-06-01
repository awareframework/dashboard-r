#check if pacman package exists, if not install it
if (!require("pacman")) install.packages("pacman")

#use pacman to automatically load  or install requried packages.
#NOTE:
#add required pacakages here
pacman::p_load(shinydashboard, RMySQL, parallel, dplyr, ggplot2)

#load all files in the tabs folder
lapply(dir("tabs",full.names = TRUE), source)
