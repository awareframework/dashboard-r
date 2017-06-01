## app.R ##

##establish connection to server

options(mysql = list(
  "host" = "awareframework.com",
  "port" = 3306,
  "user" = "user_goes_here",
  "password" = "password_goes_here",
  "database" = "database_name_here"
))





#### Analysis & data generation


server <- function(input, output) {
  
  database <- reactive({
    # invalidateLater(10000) #This command is used to refresh the data & propagate changes to UI
    db <- dbConnect(MySQL(), dbname = options()$mysql$database, host = options()$mysql$host, 
                    port = options()$mysql$port, user = options()$mysql$user, 
                    password = options()$mysql$password)
    
    result <- c()
    result$totalDevices <- dbGetQuery(db, "select count(*) from aware_device")[1,1]
    result$totalAppLaunches <- dbGetQuery(db, "select count(*) from applications_foreground")[1,1]
    result$totalBatteryEvents <- dbGetQuery(db, "select count(*) from battery")[1,1]
    result$deviceInfo <- dbGetQuery(db, "select * from aware_device")
    dbDisconnect(db)
    result
  })
  
  output$deviceInfo <- renderDataTable(database()$deviceInfo, options = list(scrollX = TRUE))
  
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
      color = "purple"
    )
  })
  
  output$totalBatteryEvents <- renderValueBox({
    valueBox(
      database()$totalBatteryEvents, "Total battery events", icon = icon("battery-half"),
      color = "green"
    )
  })
  
  
  callModule(tabBattery,"tabBattery")
  
  
}
