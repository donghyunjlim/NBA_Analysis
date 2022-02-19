# Chart_3
# 
# INFO 201 AF
# Code Name: BBB
# Steven Tran
#
# Purpose of Chart 3:
# The purpose of Chart 3 is to analyze the most injured team this season and to 
# identify the correlation between the average minutes played by each player on 
# the Orlando Magic Vs. the average effective field goal percentage for the team
# that season. This would help us understand the effect of health and injuries 
# on the effectiveness of NBA players. Since the Orlando Magic was the most 
# injured team, it made sense to understand how those injuries impacted their 
# play.  
# We chose a line graph because the position of the dots and the direction
# of the lines make it easier to understand this correlation. 
#
#
# Observations & Insights:
# It seems as though the team is most effective when players average from 27 to 
# 30 minutes per game. The effective field goal percentages start to plateau and 
# then dip to a low of 0.425 when players average about 40 minutes. 
# This is staggering because the more players get injured, the less effective 
# they are on court, and this may lead to even more injuries. 
# 
# Load packages
library(ggplot2)

library(tidyverse)

# Load dataframe
NBA <- read.csv("../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

# Use dplyr to group the dataframe by season and then summarize the average 
# minutes played and average effective field goal percentage. 

nba <- NBA %>%
  group_by(Season) %>%
  summarize(effective_field_goal = mean(eFG., na.rm = TRUE), minutes_played = mean(MP, na.rm = TRUE), team = "ORL")

# Create a line graph
chart_3 <- ggplot(nba, aes(x = minutes_played, y = effective_field_goal)) + 
  geom_line() + 
  geom_point() + 
  labs(
    x = "Average Minutes Played",
    y = "Average Effective Field Goal Percentage",
    title = "The Average Effective Field Goal Percentage Vs. Average Minutes played",
    subtitle = "Grouped By Individual Orlando Magic Season"
  )


chart_3
