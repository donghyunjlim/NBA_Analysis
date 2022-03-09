# Table of summary information 

# Jinsu Ha

# Goal of this file:
# You should write code to produce a table of aggregate information about it. 
# It must perform a groupby() operation to show a dimension of the dataset 
# as grouped by a particular feature (column). We expect the included table to:

  # Have well formatted (i.e., human readable) column names (so you'll probably 
  # have to change them)
  # Only contain relevant information (i.e., only select some columns of interest)
  # Be intentionally sorted in a meaningful way
  # Round any quantitative values so they are displayed in a manner that 
  # isn't distracting

# Load the necessary libraries
library("tidyverse")

# Loading dataframe file `nba_final_dataframe.csv` into a variable called `nba`.
nba <- read.csv(file = "../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)
View(nba)

# list of the names of the columns on the original datasets
og_colnames <- colnames(nba)
og_colnames

# create a table or dataframe that contains meaningful datasets
# group by teams
# columns: blocks(BLK), average points per game(PTS), average field goal percentage (FG.),
# Minutes Played (MP), Age(Age), Steals (STL), and turnovers (tov)
# each column will represent the average data for each team

agg_table <- nba %>%
  group_by(Tm) %>% #group by each team
  select(Age, Tm, MP, FG., BLK, STL, PTS, TOV) # select only the information we want to aggregate

# create each column that has the average value of each data
age <- agg_table %>%
  summarize(ave_Age = round(mean(Age), 1))

mp <- agg_table %>%
  summarize(ave_MP = round(mean(MP), 2))

fg <- agg_table %>%
  summarize(ave_FG = round(mean(FG.), 3))

blk <- agg_table%>%
  summarize(ave_BLK = round(mean(BLK), 1))

stl <- agg_table%>%
  summarize(ave_STL = round(mean(STL), 1))

pts <- agg_table %>%
  summarize(ave_PTS = round(mean(PTS), 1))

tov <- agg_table%>%
  summarize(ave_TOV = round(mean(TOV), 1))

# join all the columns with teams to create one dataset
# this table reveals each team's average stats that are important for the teams and their fans:
# average blocks(BLK),average points per game(PTS), average field goal percentage (FG.),
# Minutes Played (MP), Age(Age), Steals (STL), and turnovers (tov)
# final_table <- left_join(age, mp) %>%
  # left_join(fg)%>% left_join(blk)%>% left_join(stl)%>% left_join(pts)%>% left_join(tov)%>% setDT()
final_table <- list(age, mp, fg, blk, stl, pts, tov)%>% #put all data frames into a list
  reduce(full_join, by = "Tm") # merge everything in the lsit by "Tm"

final_table
