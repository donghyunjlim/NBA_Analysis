# Tab Panel: Introduction for P03
# Eric Large
# INFO 201 AF
#-------------------------------------------------------------------------------
# Libraries
library(shiny)
library(tidyverse)

#-------------------------------------------------------------------------------
# Introduction Panel
tab_panel_intro <- tabPanel(
  "Introduction",
  
  # Render an HTML document in an output area
  fluidPage(
    h1("NBA Basketball Analysis"),
    img(src = "nba_logo.png", height = 250, width = 250),
    column(
      12,
      htmlOutput("inc")
    ),
    hr(),
    print("INFO-201 (Winter 2022) AF-2: BBB")
  )
)
#-------------------------------------------------------------------------------
# app_ui.R code
#ui <- fluidPage(
  #tab_panel_intro
#)

# app_server.R function---------------------------------------------------------
server <- function(input, output) {
  getPage<-function() {
    return(includeHTML("tab_panel_intro_doc.html"))
  }
  output$inc<-renderUI({getPage()})
} 
#-------------------------------------------------------------------------------
# Run the application 
#shinyApp(ui = ui, server = server)
