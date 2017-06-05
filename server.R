## server.R ##

##Define global variable for holding database handle
options(
  db <- NULL
)



##Add here calls to each tab
server <- function(input, output, session) {
  #You need to read the documentation to understand how modules work.
  #We call modules so that the code is more readable.
  #However, we need to use the "ns" function within modules, which complicates things a bit.
  callModule(tabSettings,"tabSettings", output, session)
  callModule(tabDashboard, "tabDashboard")
  callModule(tabBattery,"tabBattery")
  callModule(tabDevices, "tabDevices")
}
