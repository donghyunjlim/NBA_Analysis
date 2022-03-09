# Chart 2 
# 
# INFO 201 AF
# Code Name: BBB
# Eric Large
#
# Purpose of Chart 2:
# The purpose of including this bar chart in our report
# is to highlight the modern 3-point efficiency (3P%) of each 
# position type in the NBA. Although our data set includes
# only active starters for all 30 teams during the 2021-22 season,
# it still provides a large sample of current 3-point efficiency 
# ratings at each of the major five positions. 
#
#
# Observations & Insights:
#
# From this visualization, we capture a snapshot on the current standard
# of 3-point shooting efficiency as it relates to every position. As we have
# seen since the turn of the century, the modern NBA has adapted to the long-range
# shooting style-of-play more than ever, reflected in these averages. Despite not 
# having insight into the center (C) position (due to a lack of data from the 
# 2021-22 season), we can still infer that the wing positions (SF, PF) having 
# relatively similar averages (33.1% and 33.3%) to the point guard (PG) position
# (35.1%) means there has been an emphasis placed on this aspect of the game for
# every player, regardless of position. This shows the high level of skill each
# individual must have to even be considered "average" for their position in the
# modern NBA. When considering the context of the 3-point shot,it is hard to 
# imagine a time where the 3-point line did not exist.
# 
# 



# Libraries
library("tidyverse")

# Loading in the `nba` dataframe
# nba <- read.csv(file = "../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)
nba <- read.csv(file = "../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)

# Comparing the average 3-point percentage (3p%) of each pure position player
# (e.g., PG, SG, SF, PF, C) in the 2021-22 NBA season using a bar chart.

# Filtering with `dplyr` to get average 3P% by position
nba_1 <- nba %>%
  filter(Season == max(Season)) %>%
  group_by(Pos) %>%
  summarize(mean(X3P., na.rm = TRUE))

# Renaming columns
colnames(nba_1) <- c( "Pos", "X3P.")
nba_2 <- nba_1[-c(2, 4, 6, 8), ]


# Rounding 3P% Values
round_df <- function(nba_2) {
  X3P. <- sapply(nba_2, mode) == 'numeric'
  nba_2[X3P.] <-  round(nba_2[X3P.], 3)
  nba_2
}
nba_3 <- round_df(nba_2)

#-------------------------------------------------------------------------------
# Filtering to get X2P.
nba_4 <- nba %>%
  filter(Season == max(Season)) %>%
  group_by(Pos) %>%
  summarize(mean(X2P., na.rm = TRUE))

# Renaming columns
colnames(nba_4) <- c( "Pos", "X2P.")
nba_5 <- nba_4[-c(2, 4, 6, 8), ]


# Rounding 2P% Values
round_df <- function(nba_5) {
  X2P. <- sapply(nba_5, mode) == 'numeric'
  nba_5[X2P.] <-  round(nba_5[X2P.], 3)
  nba_5
}
nba_6 <- round_df(nba_5)

nba_final <- left_join(nba_3, nba_6, by = "Pos")
#-------------------------------------------------------------------------------
# Filtering to get FT.
nba_7 <- nba %>%
  filter(Season == max(Season)) %>%
  group_by(Pos) %>%
  summarize(mean(FT., na.rm = TRUE))

# Renaming columns
colnames(nba_7) <- c( "Pos", "FT.")
nba_8 <- nba_7[-c(2, 4, 6, 8), ]


# Rounding FT% Values
round_df <- function(nba_8) {
  FT. <- sapply(nba_8, mode) == 'numeric'
  nba_8[FT.] <-  round(nba_8[FT.], 3)
  nba_8
}
nba_9 <- round_df(nba_8)

# Joining all data frames into `final_nba`
final_nba <- left_join(nba_final, nba_9, by = "Pos")

#-------------------------------------------------------------------------------
# Plotting the visualization (bar chart)
chart_2 <- ggplot(final_nba, aes(x = Pos, y = X3P.)) +
  geom_col(fill = "#FFA500") +
  geom_text(aes(label = X3P.), vjust = 2, size = 3) +
  labs(
    x = "Position",
    y = "3-Point Percentage (%)",
    title = "Average 3P% By Position",
    subtitle = "2021-22 NBA Season",
    caption = "A summary of 3P% averages by position in the NBA.",
    alt = "A summary of 2021-22 3P% averages by position in the NBA."
  )

# Final Visualization
chart_2
