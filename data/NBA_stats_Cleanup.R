library(dplyr)
## Remove NA for Tm Lg, and Pos before you run this
## Don't run until you have all your players in the dataframe
df <- read.csv("~/Documents/Info201Assignments/final-project-starter-OrangeCowz/data/NBA_stats_data_final.csv")
## Put dataframe above ^^

## Run this 
df[which(array(grepl("Did Not Play", as.matrix(df)), dim(df)), T)] <- NA
## View to make sure its not messed up, and it makes sense
View(df)

## Testing function
df_test <- df %>% 
  group_by(NAME) %>% 
  summarise(max_pts = max(PTS,na.rm=T))

View(df_test)

nrow(df)
## Writes out .csv file to your computer
directory <- write.csv(df,"nba_final_dataframe.csv")
