# Chart_3
# 
# INFO 201 AF
# Code Name: BBB
# Steven Tran
#
# Purpose of Chart 3:
# 
#
#
# Observations & Insights:
#
# 
# 


library(ggplot2)
library(tidyverse)


NBA <- read.csv("nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

nba <- NBA %>%
  group_by(Season) %>%
  summarize(effective_field_goal = mean(eFG., na.rm = TRUE), minutes_played = mean(MP, na.rm = TRUE), team = "ORL")

chart_3 <- ggplot(nba, aes(x = minutes_played, y = effective_field_goal)) + 
  geom_line() + 
  geom_point() + 
  labs(
    x = "Average Minutes Played By the Orlando Magic Each Season",
    y = "Average Effective Field Goal Percentage",
    title = "The Average Effective Field Goal Percentage Vs. Minutes played Per Team",
    subtitle = "Grouped By Each Orlando Magic Season"
  )


chart_3
