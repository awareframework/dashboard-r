## app.R ##


#### Analysis & data generation

##global variable for holding database credentials
(mysql = list(
  "host" = "theawareframework.com",
  "port" = 3306,
  "user" = "user_goes_here",
  "password" = "password_goes_here",
  "database" = "database_name_here"
))


server <- function(input, output) {
  callModule(tabSettings,"tabSettings")
  callModule(tabBattery,"tabBattery")
  callModule(tabDashboard, "tabDashboard")
  callModule(tabDevices, "tabDevices")
  
}
