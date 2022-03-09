# Libraries
# Load in libraries

library("plotly")
library("shiny")
library("shinythemes")
library("lintr")
library("styler")

# Source Documents
source("app_server.R")
source("tab_panel_intro.R")
source("tab_panel_chart1.R")
source("tab_panel_chart2.R")
source("tab_panel_chart3.R")
source("tab_panel_summary.R")
source("tab_panel_report.R")

ui <- navbarPage(
  title = "BBB: A Basketball Analysis",
  position = "fixed-top",
  tab_panel_intro,
  tab_panel_chart1,
  tab_panel_chart2,
  tab_panel_chart3,
  tab_panel_summary,
  tab_panel_report
)
