## server.R ##

##Define global variable for holding database handle
options(
  db <- NULL
)



##Add here calls to each tab
server <- function(input, output) {
  callModule(tabSettings,"tabSettings")
  callModule(tabBattery,"tabBattery")
  callModule(tabDashboard, "tabDashboard")
  callModule(tabDevices, "tabDevices")
}
