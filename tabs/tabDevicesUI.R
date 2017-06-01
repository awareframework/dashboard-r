tabDevicesUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    
    h2("Device details"),
    actionButton(ns("devicesRefresh"),"Refresh"),
    fluidRow(
      column(12,
             dataTableOutput(ns("deviceInfo"))
      )
    )
  )
}