# Chart 1
# INFO 201 AF
# Code Name:BBB
# Jason Lim

# Purpose of Chart 1:
# The purpose of this dot plot is to demonstrate the relationship between
# the number of games and points scored by each team in the NBA. As it's 
# hard to show all data points, which is approximately over 750 data points, the 
# new data frame is grouped by team which makes it easier to plot. Also,
# by grouping the players by team, we are able to see the differences among these teams. 


# Observation & Insights:
# From this visualization, we have come to a conclusion that the more games the
# players played, less average points were recorded. Looking at the maximum
# of the smooth line from the plot, the highest points were observed around 
# 55 games and 68 games. However, as the number of average games increase, there was
# somewhat rapid decrease towards the total number of games in one season. 


library(ggplot2)
library(tidyverse)
NBA <- read.csv("../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

# Data frame with mean value of games played and points by Team
nba <- NBA %>%
  group_by(Tm) %>%
  summarize(games = mean(G), points = mean(PTS))

# (dot plot)
chart_1 <- ggplot(nba, aes(x = games, y = points)) + 
      geom_point(aes(colour = factor(Tm), size = 0.5)) + 
      geom_smooth() + 
      labs(
        x = "Average Games",
        y = "Average Points",
        title = "Correlation Between # of Games and Points by Team",
        subtitle = "Grouped by Team of Starters in the NBA"
      )

# Visualization
chart_1

