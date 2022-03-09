# From Lecture 2/23/22
library(markdown)
source("~/docs/p01-proposal.md")

tab_panel_report <- tabPanel(
  "Report",
  fluidRow(
    column(
      12,
      includeMarkdown("p01-proposal.md")
    )
  )
)
