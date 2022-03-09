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
  
  # Load data frame
  NBA <- read.csv("../docs/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)
  
  # Grouping the dataframe by team and summarizing each of them with average games and points. 
  nba1 <- NBA %>%
    group_by(Tm) %>%
    summarize(games = mean(G), points = mean(PTS))
  
  output$chart_1 <- renderPlotly({
    tab_chart1 <- ggplot(nba1 %>% filter(Tm %in% input$team)) + 
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
  
  # Loading in the `nba` dataframe
  nba <- read.csv(file = "../docs/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)
  
  # Comparing the average 3-point percentage (3p%) of each pure position player
  # (e.g., PG, SG, SF, PF, C) in the 2021-22 NBA season using a bar chart.
  
  # Filtering with `dplyr` to get average 3P% by position
  nba_1 <- nba %>%
    filter(Season == max(Season)) %>%
    group_by(Pos) %>%
    summarize(mean(X3P., na.rm = TRUE))
  
  # Renaming columns
  colnames(nba_1) <- c( "Pos", "X3P.")
  nba_2 <- nba_1[-c(2, 4, 6, 8), ]
  
  
  # Rounding 3P% Values
  round_df <- function(nba_2) {
    X3P. <- sapply(nba_2, mode) == 'numeric'
    nba_2[X3P.] <-  round(nba_2[X3P.], 3)
    nba_2
  }
  nba_3 <- round_df(nba_2)
  
  #-------------------------------------------------------------------------------
  # Filtering to get X2P.
  nba_4 <- nba %>%
    filter(Season == max(Season)) %>%
    group_by(Pos) %>%
    summarize(mean(X2P., na.rm = TRUE))
  
  # Renaming columns
  colnames(nba_4) <- c( "Pos", "X2P.")
  nba_5 <- nba_4[-c(2, 4, 6, 8), ]
  
  
  # Rounding 2P% Values
  round_df <- function(nba_5) {
    X2P. <- sapply(nba_5, mode) == 'numeric'
    nba_5[X2P.] <-  round(nba_5[X2P.], 3)
    nba_5
  }
  nba_6 <- round_df(nba_5)
  
  nba_final <- left_join(nba_3, nba_6, by = "Pos")
  #-------------------------------------------------------------------------------
  # Filtering to get FT.
  nba_7 <- nba %>%
    filter(Season == max(Season)) %>%
    group_by(Pos) %>%
    summarize(mean(FT., na.rm = TRUE))
  
  # Renaming columns
  colnames(nba_7) <- c( "Pos", "FT.")
  nba_8 <- nba_7[-c(2, 4, 6, 8), ]
  
  
  # Rounding FT% Values
  round_df <- function(nba_8) {
    FT. <- sapply(nba_8, mode) == 'numeric'
    nba_8[FT.] <-  round(nba_8[FT.], 3)
    nba_8
  }
  nba_9 <- round_df(nba_8)
  
  # Joining all data frames into `final_nba`
  final_nba <- left_join(nba_final, nba_9, by = "Pos")
  
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
  nba <- NBA %>%
    group_by(Season) %>%
    summarize(effective_field_goal = mean(eFG., na.rm = TRUE), 
              field_goal_percent = mean(FG., na.rm = TRUE), 
              three_point_percent = mean(X3P., na.rm = TRUE), 
              two_point_percent = mean(X2P., na.rm = TRUE), 
              free_throw_percent = mean(FT., na.rm = TRUE), 
              minutes_played = mean(MP, na.rm = TRUE), 
              team = "ORL")
  
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
