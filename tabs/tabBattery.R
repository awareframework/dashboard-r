tabBattery <- function(input, output, session) {

#This event is fired when the user presses the "Refresh" actionbutton on the UI  
observeEvent(input$batteryRefresh, {
  db <- options()$db
  batteryStats <- dbGetQuery(db,
                             "select _id as device_id, date, count from aware_device left join
                             (select date(FROM_UNIXTIME(timestamp/1000)) as date, device_id, count(*) as count from
                             battery group by date, device_id) as stats
                             on aware_device.device_id = stats.device_id")
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
