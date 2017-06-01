#####   How things look

ui <- dashboardPage(
  dashboardHeader(title = "AWARE dashboard"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItemOutput("menuitem"),
      menuItem("Settings", tabName = "settings", icon = icon("gear"), badgeLabel = "offline", badgeColor = "red"),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Devices", tabName = "devices", icon = icon("mobile")),
      menuItem("Battery", tabName = "tabBattery", icon = icon("battery-half")),
      menuItem("Screen", tabName = "screen", icon = icon("power-off"))
    )
  ),
  dashboardBody(
    tabItems(

      tabItem(tabName = "settings" ,
              tabSettingsUI("tabSettings")
      ),
      
      tabItem(tabName = "dashboard",
              tabDashboardUI("tabDashboard")
      ),
      
      tabItem(tabName = "devices", 
              tabDevicesUI("tabDevices")
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



