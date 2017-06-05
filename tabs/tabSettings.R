tabSettings <- function(input, output, session, parameter, parameter2) {
  
  #By default, the status is offline when we first load the app
  parameter$menuSettings <- renderMenu({
    menuItem("Settings", tabName = "settings", icon = icon("gear"), badgeLabel = "disconnected", badgeColor = "teal")
  })
  #Select the menu (bug with shiny does not automatically select the first menu if it is dynamic)
  isolate({updateTabItems(parameter2, "tabs", "settings")})
  
  
  #This event is fired when the user presses the "Connect" actionbutton on the UI  
  observeEvent(input$settingsConnect, {
    
   
    result = tryCatch({
      #connect to the server
      #need to catch errors due to invalid password/wrong data
      conn = dbConnect(MySQL(), dbname = input$database, host = input$host,
                       port = input$port, user = input$user,
                       password = input$password)
      
      #Update global variable with database handle
      options(db = conn)
      #Update UI to indicate we are connected
      parameter$menuSettings <- renderMenu({
        menuItem("Settings", tabName = "settings", icon = icon("gear"), badgeLabel = "online", badgeColor = "green")
      })
      #update some of the tabs
      #here we can add code to update tabs
      
      
    }, warning = function(w) {
      return(NA)
    }, error = function(e) {
      parameter$menuSettings <- renderMenu({
        menuItem("Settings", tabName = "settings", icon = icon("gear"), badgeLabel = "error", badgeColor = "red")
      })
      return(NA)
    }, finally={}
    )
    
    
  })
}
