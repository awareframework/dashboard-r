tabBatteryUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    h2("Battery data collected so far"),
    actionButton(ns("batteryRefresh"),"Refresh"),
    fluidRow(
      plotOutput(ns("batteryStats"))
    )
  )
}