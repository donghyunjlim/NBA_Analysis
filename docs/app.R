# Load in Library
library("dplyr")
library("ggplot2")
library("plotly")
library("shiny")
library("Rcpp")
library("rsconnect")
library("lintr")
library("styler")

# The source of the files
source("app_ui.R")


source("app_server.R")


# Final Shiny App
shinyApp(ui = ui, server = server)