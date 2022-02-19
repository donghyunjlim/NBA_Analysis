# Summary Information

# Libraries
library("tidyverse")

# Loading dataframe file `nba_final_dataframe.csv` into a variable called `nba`.
nba <- read.csv(file = "../data/nba_final_dataframe.csv", header = TRUE, stringsAsFactors = FALSE)
View(nba)

# Summarizing Values from the `nba` dataframe


# 1. What is the average points per game (PTS) among all players 
# this season (2021-2022)? Store the value in a variable called `avg_ppg`.
avg_ppg <- nba %>%
  filter(Season == max(Season)) %>%
  select(PTS) %>%
  summarize(mean(PTS))
print(avg_ppg)

## Returns '14.96265' PTS

# 2. What is the average field goal percentage (FG.) among all players
# in the NBA this season? Store in a variable called `pg_fg`.
avg_fg <- nba %>%
  filter(Season == max(Season)) %>%
  select(FG.) %>%
  summarize(mean(FG.))
print(avg_fg)

## Returns '0.474...' FG. (FG%)

# 3. Which NBA player has had the worst efficiency (lowest FG%) 
# as of the most recent season? Store in a variable called `worst_fg`.
worst_fg <- nba %>%
  filter(Season == max(Season)) %>%
  filter(FG. == min(FG.)) %>%
  pull(NAME)
print(worst_fg)

## Returns "Holiday, Ju" or Justin Holiday

# 4. As of the most recent season, which player averages the most
# minutes played (MP) per game? Store in a variable called `max_mp`.
max_mp <- nba %>%
  filter(Season == max(Season)) %>%
  filter(MP == max(MP)) %>%
  pull(NAME)
print(max_mp)
  
## Returns "Hield, B" or Buddy Hield

# 5. As of the most recent season, who is the oldest player in the NBA?
# Store the result in a variable called `oldest_player`.
oldest_player <- nba %>%
  filter(Season == max(Season)) %>%
  filter(Age == max(Age)) %>%
  pull(NAME)
print(oldest_player)

## Returns "James, L" or LeBron James
