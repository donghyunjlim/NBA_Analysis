# Tab Panel for Chart 2 - Interactive Visualization
# INFO 201 AF
# Eric Large
# ------------------------------------------------------------------------------
# Libraries:
library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)

#-------------------------------------------------------------------------------
# Data Wrangling for Chart_2
nba <- read.csv(file = "nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

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
# ------------------------------------------------------------------------------
# Code for interactive visual of Chart 2

# app_ui.R:
tab_panel_chart2 <- tabPanel(
  "Chart 2",
  titlePanel("Analyzing Shooting % by Position"),
    sidebarPanel(
      helpText("2021-2022 Season Averages"),
      selectInput(inputId = "y_var",
                label = "Type of Shot %:",
                choices = list("Two-Point Percentage" = "X2P.",
                               "Three-Point Percentage" = "X3P.",
                               "Free Throw Percentage" = "FT."),
                selected = "Two-Point Percentage")
      ),
    
  # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("plot2")
  ),
  p("Description: The above bar plot aims to showcase the 2021-22 season averages for
    all shot types by starting players in the NBA. Each bar represents one of the five positions
    used in modern basketball: the Point Guard, Shooting Guard, Small Forward, Power Forward,
    and Center. Moreover, the interactive widget located above the plot allows you 
    to browse shot types, including 2-point, 3-point, and free throw percent averages.
    Although in decimal form, these can be converted into real-world percentages used by players
    to analyze their performance. This allows users to easily visualize the different strengths
    possessed at each position. It also provides a snapshot into the current trends on shooting 
    efficiency in the 2021-22 season, setting a standard for athletes of all calibers who might model
    their goals after NBA players, as they are some of the best basektball players in the world.")
  )


# app_server.R
# server <- function(input, output) {
# 
#   # output$plot <- renderPlotly({
#   #   tab_chart2 <- ggplot(final_nba, aes(x = Pos, y = !!as.name(input$y_var)), size = 1) +
#   #     geom_col(fill = "#FFA500") +
#   #     geom_text(aes(label = !!as.name(input$y_var)), vjust = 2, size = 3) +
#   #     labs(
#   #       x = "Position",
#   #       y = "Shooting Percentages (%)",
#   #       title = "Average Shooting Percentages (%) By Position",
#   #       subtitle = "2021-22 NBA Season",
#   #       caption = "A summary of 2-point, 3-point, and free throw percent averages by position in the NBA.",
#   #       alt = "A summary of 2021-22 2-point, 3-point, and free throw percent averages by position in the NBA."
#   #     )
#   #   ggplotly(tab_chart2)
#   })
# }

# shinyApp(ui = tab_panel_chart2, server = server)