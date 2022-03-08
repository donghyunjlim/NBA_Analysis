# Tab Panel for Chart 2 - Interactive Visualization
# INFO 201 AF
# Eric Large
# ------------------------------------------------------------------------------
# Libraries:
library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)
source("C:/Users/ericl/Documents/INFO-201/Project/final-project-starter-OrangeCowz/source/Chart_2.R")
# source("../source/Chart_2.R")
# ------------------------------------------------------------------------------
# Code for interactive visual of Chart 2
chart_2 <- ggplotly(chart2)
select_values <- colnames(nba_final)

# app_ui.R:
tab_panel_chart2 <- tabPanel(
  "Chart 2",
  titlePanel("Analyzing Shooting % by Position"),
  sidebarPanel(
    selectInput(inputId = "y_var", label = strong("Type of Shot%:"),
                choices = select_values,
                selected = "X3P.")

  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotlyOutput("chart_2")
  ),
p("Description: ")
)

# app_server.R
server <- function(input, output) {
  
  output$chart_2 <- renderPlot({
    ggplot(nba_final, aes(x = Pos, y = X3P.)) +
      geom_col(fill = "#FFA500") +
      geom_text(aes(label = X3P.), vjust = 2, size = 3) +
      labs(
        x = "Position",
        y = "Shot Percentage (%)",
        title = "Average Shooting % By Position",
        subtitle = "2021-22 NBA Season",
        caption = "A summary of 2P% and 3P% averages by position in the NBA.",
        alt = "A summary of 2021-22 2P% and 3P% averages by position in the NBA."
        )
  })
}
