tabDevices <- function(input, output, session) {

#This event is fired when the user presses the "Refresh" actionbutton on the UI  
observeEvent(input$devicesRefresh, {
  
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
  
  output$deviceInfo <- renderDataTable(database()$deviceInfo, options = list(scrollX = TRUE))
  
  
}
)
}
