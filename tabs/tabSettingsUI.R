tabSettingsUI <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    h2("Connection settings"),
    p("Please enter the details of your database server, and click CONNECT."),
    textInput(options()$mysql$host, "Host", value = "awareframework.com", width = NULL, placeholder = ""),
    textInput(options()$mysql$port, "Port", value = "3306", width = NULL, placeholder = ""),
    textInput(options()$mysql$user, "Username", value = "Hosio_235", width = NULL, placeholder = ""),
    passwordInput(options()$mysql$password, "Password", value = "", width = NULL, placeholder = ""),
    textInput(options()$mysql$database, "Database", value = "Hosio_235", width = NULL, placeholder = ""),
    actionButton(("settingsConnect"),"Connect")
  )
}