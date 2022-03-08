#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("C:/Users/ericl/Documents/INFO-201/Project/final-project-starter-OrangeCowz/docs/tab_panel_chart2.R")
# Define UI for application that draws a histogram
ui <- fluidPage(
  tab_panel_chart2
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$chart_2 <- renderPlotly({
 chart2
  })
}
# Run the application 
shinyApp(ui = ui, server = server)