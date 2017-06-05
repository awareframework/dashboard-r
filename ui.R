#####   How things look

ui <- dashboardPage(
  dashboardHeader(title = "AWARE dashboard"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(id="tabs",
                
      #the first item is differnt, because we dynamically update it
      menuItemOutput("menuSettings"),
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



