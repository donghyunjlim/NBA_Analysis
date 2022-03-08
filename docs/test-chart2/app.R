#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
tab_panel_chart2 <- tabPanel(
  "Chart 2",
  titlePanel("Analyzing Shooting % by Position"),
    sidebarPanel(
      helpText("2021-2022 Season Averages"),
      selectInput(inputId = "y_var",
                  label = "Type of Shot%:",
                  choices = list("Two-Point Percentage" = "X2P.",
                                 "Three-Point Percentage" = "X3P.",
                                 "Free Throw Percentage" = "FT."),
                  selected = "X2P.")
      
    ),
    
    # Main Panel
    mainPanel(
      plotlyOutput("plot")
    ),
  # Description
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

# Define server
server <- function(input, output) {
  
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
}
# Run the application 
shinyApp(ui = tab_panel_chart2, server = server)