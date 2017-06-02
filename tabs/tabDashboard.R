tabDashboard <- function(input, output, session) {

#This event is fired when the user presses the "Refresh" actionbutton on the UI  
observeEvent(input$dashboardRefresh, {
  
  if(is.null(options()$Db)){
    return(NULL)
  }
  
  
  database <- reactive({
    # invalidateLater(10000) #This command is used to refresh the data & propagate changes to UI
    #by enabling the command above, the dashboard will auto-refresh every x/1000 seconds
    db <- options()$db
    result <- c()
    result$totalDevices <- dbGetQuery(db, "select count(*) from aware_device")[1,1]
    result$totalAppLaunches <- dbGetQuery(db, "select count(*) from applications_foreground")[1,1]
    result$totalBatteryEvents <- dbGetQuery(db, "select count(*) from battery")[1,1]
    result$deviceInfo <- dbGetQuery(db, "select * from aware_device")
    result
  })
  
  
  output$totalDevices <- renderValueBox({
    valueBox(
      database()$totalDevices, "Total devices", icon = icon("mobile"),
      #icons found at: http://fontawesome.io/icons/
      color = "purple"
    )
  })
  
  output$totalAppLaunches <- renderValueBox({
    valueBox(
      database()$totalAppLaunches, "Total application launches", icon = icon("play"),
      color = "yellow"
    )
  })
  
  output$totalBatteryEvents <- renderValueBox({
    valueBox(
      database()$totalBatteryEvents, "Total battery events", icon = icon("battery-half"),
      color = "green"
    )
  })
  
  
  
  
  
}
)
}

