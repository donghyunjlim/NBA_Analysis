# tab_panel_chart3
# 
# INFO 201 AF
# Code Name: BBB
# Steven Tran

library("dplyr")
library("tidyverse")
library("ggplot2")
library("maps")
library("mapproj")
library("leaflet")
library("DT")
library("knitr")
library("stringr")
library("plotly")

# Load dataframe & Create Line chart
NBA <- read.csv("../docs/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

# Use dplyr to group the dataframe by season and then summarize the average 
# minutes played and average effective field goal percentage. 

nba <- NBA %>%
  group_by(Season) %>%
  summarize(effective_field_goal = mean(eFG., na.rm = TRUE), 
            field_goal_percent = mean(FG., na.rm = TRUE), 
            three_point_percent = mean(X3P., na.rm = TRUE), 
            two_point_percent = mean(X2P., na.rm = TRUE), 
            free_throw_percent = mean(FT., na.rm = TRUE), 
            minutes_played = mean(MP, na.rm = TRUE), 
            team = "ORL")

# Create a line graph
chart_3 <- ggplot(nba, aes(x = minutes_played, y = effective_field_goal)) + 
  geom_line() + 
  geom_point() + 
  labs(
    x = "Average Minutes Played",
    y = "Average Effective Field Goal Percentage",
    title = "The Average Effective Field Goal Percentage Vs. Average Minutes played",
    subtitle = "Grouped By Individual Orlando Magic Season"
  )


chart_3


# Creating server

server <- function(input, output) {
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
}


# Creating the tab panel for the UI


tab_panel_chart3 <- tabPanel(
  "Chart 3",
  titlePanel("The Average Y-Variable Percentage Vs. Years"),
  sidebarLayout(
    sidebarPanel(
      helpText("Select Y-Variable"),
      selectInput("y_var",
                  label = "Choose to display different Y-Variables",
                  choices = list("Effective Field Goal Percentage" = "effective_field_goal",
                                 "Field Goal Percentage" = "field_goal_percent",
                                 "Three Point Percentage" = "three_point_percent",
                                 "Two Point Percentage" = "two_point_percent",
                                 "Free Throw Percentage" = "free_throw_percent"),
                  selected = "eFG."
      ),
    
    mainPanel(
      plotlyOutput("plot")
    )
  ),
  p("The average percentages of a player's free throws, two pointer, three pointers,
    field goals, and effective field goals were plotted against the average minutes played by the Orlando 
    magic to help find a correlation between a player's effectiveness and the
    level of load management they do. By this, we mean if there is a healther 
    amount of physical play that would allow the players to play at their maximum
    without decreasing in efficiency. This has been a debate in regards to a 
    player's health and so it was an important task for us to tackle. In the end, 
    we found that in all categories except for three point percentage and free throw percentages, the 
    effectiveness of Orlando magic players seem to decrease around the 37 to 38 mark.
    This is interesting because many players have been cited to 'load managment', a 
    term used to critisize players not playing more than they need to. However, 
    with this data, it seems as though these comments weren't justified. There is 
    a health and efficiency reason as to why this occurs")
  ))


# Testing if it works on shinyApp
shinyApp(ui = tab_panel_chart3, server = server)
  
  
  
  
  