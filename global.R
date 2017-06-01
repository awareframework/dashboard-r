if (!require("pacman")) install.packages("pacman")
pacman::p_load(shinydashboard, RMySQL, parallel, dplyr, ggplot2)
source("tabs/tabBatteryUI.R")
source("tabs/tabBattery.R")
