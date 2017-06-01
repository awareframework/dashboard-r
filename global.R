#check if pacman package exists, if not install it
if (!require("pacman")) install.packages("pacman")

#use pacman to automatically load  or install requried packages.
#NOTE:
#add required pacakages here
pacman::p_load(shinydashboard, RMySQL, parallel, dplyr, ggplot2)

#load all .R files in the tabs folder
lapply(list.files(pattern = "tabs/[.]R$", recursive = TRUE), source)
