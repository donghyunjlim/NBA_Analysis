# app_server.R file
# INFO 201 AF-2: BBB
# Libraries

#-------------------------------------------------------------------------------
server <- function(input, output) {
  
  #Intro
  getPage<-function() {
    return(includeHTML("tab_panel_intro_doc.html"))
  }
  output$inc<-renderUI({getPage()})
  
  # Chart 1
  output$chart_1 <- renderPlotly({
    tab_chart1 <- ggplot(nba %>% filter(Tm %in% input$team)) + 
      geom_point(mapping = aes(x = games, y = points, colour = Tm, size = 0.5)) +
      xlim(40, 90) +
      ylim(0, 20) +
      labs(
        x = "Games",
        y = "Points",
        title = "Average # Games vs Average # of Points",
        subtitle = "2021-22 NBA Season")
  })

  # Chart 2
  output$plot <- renderPlotly({
    tab_chart2 <- ggplot(final_nba, aes(x = Pos, y = !!as.name(input$y_var)), size = 1) +
      geom_col(fill = "#FFA500") +
      geom_text(aes(label = !!as.name(input$y_var)), vjust = 2, size = 3) +
      labs(
        x = "Position",
        y = "Shooting Percentages (%)",
        title = "Average Shooting Percentages (%) By Position",
        subtitle = "2021-22 NBA Season",
        caption = "A summary of 2-point, 3-point, and free throw percent averages by position in the NBA.",
        alt = "A summary of 2021-22 2-point, 3-point, and free throw percent averages by position in the NBA."
      )
    ggplotly(tab_chart2)
  })
  
  # Chart 3
  output$plot <- renderPlotly({
    tab_chart3 <- ggplot(nba) +
      geom_line(aes(x = minutes_played, y = !!as.name(input$y_var)), size = 1) +
      labs(
        x = "Average Minutes Played",
        y = "Production on Court measured by Percentages",
        title = "The Average Y-Variable Percentage Vs. Average Minutes played",
        subtitle = "Grouped By Individual Orlando Magic Season"
      ) 
    ggplotly(tab_chart3)
  }) 
  
  # Summary
  
  # Report
  
  
}
