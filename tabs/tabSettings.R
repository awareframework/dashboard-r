

tabSettings <- function(input, output, session) {
  
  #This event is fired when the user presses the "Connect" actionbutton on the UI  
  observeEvent(input$settingsConnect, {
    
    #update the global variable with the cerdentials that the user entered
    #IMPORTANT:
    #To update the global variable, make sure to use <<- notation
    mysql$host <<- input$host
    mysql$port <<- input$port
    mysql$user <<- input$user
    mysql$password <<- input$password
    mysql$database <<- input$database

    
  }
  )
}
