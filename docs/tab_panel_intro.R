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
  titlePanel("NBA Basketball Analysis"),
  fluidPage(
    # Use the column function to "divide up" the row
    # Here the row comprises ONE column (which takes up 12 column units)
    column(
      12,
      
      h1("NBA Basketball Analysis"),
      p(strong("This is a fluid row that takes up all 12 columns")),
      p(para1),
      
    ),
    hr(),
    print("INFO-201 (Winter 2022) AF-2: BBB")
  )
)