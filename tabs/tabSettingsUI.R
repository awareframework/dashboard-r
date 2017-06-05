tabSettingsUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    h2("Connection settings"),
    p("Please enter the details of your database server, and click CONNECT."),
    textInput(ns("host"), "Host", value = "awareframework.com", width = NULL, placeholder = ""),
    numericInput(ns("port"), "Port", value = 3306),
    textInput(ns("user"), "Username", value = "Hosio_235", width = NULL, placeholder = ""),
    passwordInput(ns("password"), "Password", value = "", width = NULL, placeholder = ""),
    textInput(ns("database"), "Database", value = "Hosio_235", width = NULL, placeholder = ""),
    actionButton(ns("settingsConnect"),"Connect")
  )
}