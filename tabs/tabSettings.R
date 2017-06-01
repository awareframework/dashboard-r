tabSettings <- function(input, output, session) {
  
  #This event is fired when the user presses the "Connect" actionbutton on the UI  
  observeEvent(input$settingsConnect, {
    
    #Update global variable with database handle 
    options(db = dbConnect(MySQL(), dbname = input$database, host = input$host,
                            port = input$port, user = input$user,
                            password = input$password)
            )
 
    output$menuitem <- renderMenu({
      menuItem("Menu item", icon = icon("calendar"))
    })
    isolate({updateTabItems(session, "menuitem", "dashboard")})
    
  }
  )
}
