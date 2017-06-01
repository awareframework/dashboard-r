

tabBattery <- function(input, output, session) {
  
observeEvent(input$batteryRefresh, {
  db <- dbConnect(MySQL(), dbname = options()$mysql$database, host = options()$mysql$host, 
                  port = options()$mysql$port, user = options()$mysql$user, 
                  password = options()$mysql$password)
  batteryStats <- dbGetQuery(db,
                             "select _id as device_id, date, count from aware_device left join
                             (select date(FROM_UNIXTIME(timestamp/1000)) as date, device_id, count(*) as count from
                             battery group by date, device_id) as stats
                             on aware_device.device_id = stats.device_id")
  dbDisconnect(db)
  batteryStats$device_id <- factor(batteryStats$device_id)
  output$batteryStats <- renderPlot({
    p <- batteryStats %>% ggplot(aes(
      x = date, y = device_id, fill = count)) +
      geom_tile() + theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1))
    print(p)
  })
}
)
}
