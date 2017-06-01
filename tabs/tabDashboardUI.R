tabDashboardUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    h2("Overview of all data"),
    actionButton(ns("dashboardRefresh"),"Refresh"),
    fluidRow(
      valueBoxOutput(ns("totalDevices")), valueBoxOutput(ns("totalAppLaunches")), valueBoxOutput(ns("totalBatteryEvents"))
    )
    
  )
}
