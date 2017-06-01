#####   How things look

ui <- dashboardPage(
  dashboardHeader(title = "AWARE dashboard"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Settings", tabName = "settings", icon = icon("gear")),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Devices", tabName = "devices", icon = icon("mobile")),
      menuItem("Battery", tabName = "tabBattery", icon = icon("battery-half")),
      menuItem("Screen", tabName = "screen", icon = icon("power-off"))
    )
  ),
  dashboardBody(
    tabItems(

      
      tabItem(tabName = "settings" ,
              h2("Connection settings"),
              p("Please enter the details of your database server, and click CONNECT."),
              textInput(options()$mysql$host, "Host", value = "awareframework.com", width = NULL, placeholder = ""),
              textInput(options()$mysql$port, "Port", value = "3306", width = NULL, placeholder = ""),
              textInput(options()$mysql$user, "Username", value = "Hosio_235", width = NULL, placeholder = ""),
              passwordInput(options()$mysql$password, "Password", value = "", width = NULL, placeholder = ""),
              textInput(options()$mysql$database, "Database", value = "Hosio_235", width = NULL, placeholder = "")
      ),
      
      
      # First tab content
      tabItem(tabName = "dashboard",
              h2("Overview of all data"),
              fluidRow(
                valueBoxOutput("totalDevices"), valueBoxOutput("totalAppLaunches"), valueBoxOutput("totalBatteryEvents")
              )
      ),
      
      tabItem(tabName = "devices", 
              h2("Device details"),
              fluidRow(
                column(12,
                       dataTableOutput("deviceInfo")
                )
              )
      ), 
      
      tabItem(tabName = "tabBattery",
              tabBatteryUI("tabBattery")
      ), 
      
      tabItem(tabName = "screen" ,
              h2("Here we visualise data from the screen table")
      )
      
    )
  )
)



