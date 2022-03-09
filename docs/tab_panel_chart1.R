# tab_panel_chart1
# INFO 201 AF
# Code Name: BBB
# Jason Lim

library(ggplot2)
library(tidyverse)
library(plotly)
library(shiny)


# Load data frame
NBA <- read.csv("../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

# Grouping the dataframe by team and summarizing each of them with average games and points. 
nba <- NBA %>%
  group_by(Tm) %>%
  summarize(games = mean(G), points = mean(PTS))

# Creating a dot plot
chart_1 <- ggplot(nba, aes(x = games, y = points)) + 
  geom_point(aes(colour = factor(Tm), size = 0.5)) + 
  geom_smooth() + 
  labs(
    x = "Average Games",
    y = "Average Points",
    title = "Correlation Between # of Games and Points by Team",
    subtitle = "Grouped by Team of Starters in the NBA"
  )
chart_1
# Creating a UI
tab_panel_chart1 <- tabPanel(
  "chart 1",
  titlePanel("Average # of Games vs Average # of Points"),
  sidebarPanel(
    selectInput(inputId = "team",
                label = "Choose the team",
                choices = nba$Tm,
                multiple = TRUE,
                selected = "OKC")
      ),
      mainPanel(
        plotlyOutput("chart_1")
      ),
    p("Description")
)

# Creating a server
server <- function(input, output) {
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
}

shinyApp(ui = tab_panel_chart1, server = server)
