# NBA Basketball Analysis: Project proposal
### Code Name: **BBB**
### Winter 2022
### Affiliation:
**Info 201: Technical Foundations of Informatics (The Information School)**
**THE UNIVERISITY OF WASHINGTON**

### Authors
| **Name** | **Email** |
|---------------| --------------
| **Steven Tran** | stran01@uw.edu |
| **Jinsu Ha** | jha01@uw.edu |
| **Jason Lim** | Dlim5@uw.edu |
| **Eric Large** | elarge@uw.edu |

### Abstract
Our data analysis project mainly focuses on the success and health of current and former NBA players, with emphasis on the 2021 season as well as the question, "What is the impact of a player's health on their performance?". To accomplish this we will analyze a multitude of player statistics, including but not limited to, All-Star Game appearances (to operationalize success), years played, and injuries, comparing seasonal and career longevity with overall player success. Finally, conducting this insightful analysis is important because it will help shed light on various real-world issues including the mental and physical health of athletes, along with modern day expectations on individual performance in professional basketball.

### Key words
* NBA stats summary
* Player’s performance
* Career Longevity
* Health
* Points

### Introduction to the Project
It seems as though every action, every play, and every call on the basketball court is compiled and recorded as a measurement of the essence of a player. It’s what defines them. Fans might use it to back up their argument that Aleksej Pokuševski is the greatest player alive or NBA teams may use it to gauge the value of players. For our group, we wanted to investigate the relationship between the performance of the players and their physical and mental health. These two metrics deeply impact the **players**, whose income depends on their ability to perform, the **owners**, as the players create the bulk of their revenue, and finally the **NBA fans** that look forward to seeing their favorite players lace up. Some possible ways we can approach this would be to analyze CSV files on each player’s minutes played, fouls drawn, points per game, and efficiency of each shot to determine if there is a relationship. For instance, statistics that indicate health and longevity such as games played and minutes per game would be analyzed with their production of points and how efficiently the players are getting those points. These findings may impact real world athletes and how they can improve their training regimen and our goal is to identify risks that may pop up from our analysis.


### Design situation
* **Framing the topic of concern**

Our main topic of concern is that we want to know the relationship between the success and the health of current and former NBA players in 2021. Key elements of the topic include: taking care of their mental and physical health, and how these relate to their performance. Some questions that we can ask are:

> * **How do NBA players continue to strive for success and not get distracted with always having so much pressure and attention on them**

> * **How does the success of a player and their career longevity correlate?**


* **Human values**

Human values that are connected to the topic of our concern are personal development, mental health, and strength. As we are focusing on each individual player’s health and longevity that lead to successful/unsuccessful performance in the NBA, these values are significant because they have direct correlations to each other.

* **Stakeholders**

The stakeholders of our dataset would be first and foremost the players whom we collect data on, the owners of the NBA teams, and any basketball fan in general. The health and production of these players are fundamentally important to all three of these groups as the NBA is a business at the end of the day. Indirect stakeholders may be athletes of other sports. If there is a correlation with a metric of health and production, it could translate to other sports with similar intensities.

* **Benefits & Harms**

The potential **benefits** of this analysis include increased awareness around (potentially) unrealistic player performance standards and increasingly long careers through load management. By highlighting both injury and subpar performance patterns in players, our analysis supports the health and well-being of professional basketball players. Finally, NBA players must constantly adapt to their aging bodies and dynamic environments associated with the game, which is an aspect that our project seeks to address for their aid.

Unanticipated consequences or **harms** of our analysis might include a deficiency in overall player statistics, as we are narrowing our focus on the 2021 season along with data compiled from the last ten years. Although it’s seemingly unethical to “predict” player injuries, we find it necessary to analyze their minutes, games played, and other stats leading up to previous injuries to prevent future instances. Beyond these factors,  we will attempt to be as unbiased and inclusive as possible in our analysis.**


* **Citations (3)**

The first citation related to this topic of health and basketball comes from the [National Library of Medicine: Effects of age on physical and technical performance in National Basketball Association (NBA) players](https://pubmed.ncbi.nlm.nih.gov/32847370/), where the researchers found a correlation between points per game and age. While this isn't shocking, the more interesting result was that centers tended to decline much more than guards or forwards. In our analysis of the 2021 season, it might be advantageous to see if this is due to the amount of fouls given to the centers compared to the guards.

The second citation is titled [The Effect of Fouls on a Player’s Performance in the NBA by Nikhil Ajjarapu](https://medium.com/@nikhil.ajjarapu/the-effect-of-fouls-on-a-players-performance-in-the-nba-42a0149a1d20). He collected data on player's fouls and their performance measured by points scored before foul and and true shooting percentages before fouls. In particular, he examined Kawhi Leonard's figures, noting a decrease in efficiency as the number of fouls increased. This table is shown below:

![Kawhi's Regular Season True Shooting Percentage](/data/KawhiLeonardTS.png)

The third and final citation is [It's a Hard-Knock Life: Game Load, Fatigue, and Injury Risk in the National Basketball Association, by Melanie Lewis, PhD](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6107769/). Their objective is "to examine the relationship among game load, fatigue, and injuries in NBA athletes". This analysis uses data from a 3 season interval from 2012 to 2015 that analyzes the odds of injury based on fatigue and minutes played. They found that "The odds of injury increased by 2.87% (P < .001) for each 96 minutes played and decreased by 15.96% (P < .001) for each day of rest". This has enormous implications especially in an 82 game regular season.

Finally, while these aren't articles themselves, the next 3 websites tells the story of the raw data of a basketball player:
* [Basketball Reference](https://www.basketball-reference.com )

* [NBA Data Summarized](https://github.com/MattC137/Open_Data/tree/master/Data/Sports/NBA )

* [College basketball summarized data in US](https://www.kaggle.com/andrewsundberg/college-basketball-dataset )


### Research Questions (3-5)

Our group is interested in the area of health and production because we all like sports and seeing our favorite players on the court is something we value and appreciate. That said, another reason for our interest is that there are so many variables measured that we were curious as to what we can do with it. Our research questions are listed down below:

* _**What effect(s) does a conservative approach (e.g., players with high game score playing relatively low minutes; see Kawhi Leonard) have on a player’s overall efficiency for that year? By comparing a players game score (GmSc), minutes played (MP), and field goal percentage (FG%) stats, we can contextualize a star player’s efficiency given their work load.**_


* _**How does average number of fouls affect a player’s performance during the season?**_


We could access the average number of fouls a player has received in a single NBA season and plot that with their true shooting percentages, like in Nikhil Ajjarapu's data set or compare these values with the total points per game in that season. This is a topic of interest since fouls are the main indicator of how rough or strenuous it is in a basketball game. It is assumed that the health of a player that receives on average 3 fouls a game is in more jeopardy than a player who receives 1.


* _**How does the frequency of injury relate to the game performance?**_


Analyzing games played in a season with their efficiency would be a good indicator how their games missed due to injury impacts their play.

* _**What effect does it have on bench players’ performance when they start the game instead of the original starters who are healthy?**_


By comparing bench and starters, we can better understand how much the increased time spent on court impacts their health.

* _**What players have the largest decrease in performance measured by points per game, true shooting percentage, and minutes played?**_


As said in the question, we can analyze the metrics of performance such as points per game, true shooting, with metrics of health such as minutes played or time spent recovering from injury. This is perhaps the crux of our research and something we'd like to draw conclusions from.

### The Dataset

|Dataset Name & URL | Description| Observations (Rows) | Features (Columns) |
|---------------| -------------- | -------------- | -------------- |
| [Basketball Reference](https://www.basketball-reference.com) | This dataset is collected by **_sportradar_**, directly from the NBA. As offical partners, the data is trust worthy and credible. The cite was established in April of 2020. A sample of Lebron's NBA career can be found [Here](/data/Lebron_NBA_stats.csv) | There are 23 rows representing a season's worth of statistics, career statistics, and statistics at each team he's played for. | There are 30 columns or features. |
| [NBA Data Summarized](https://github.com/MattC137/Open_Data/tree/master/Data/Sports/NBA) | This [NBA 2016 Players](/data/NBA2016Statistics.csv) dataset is compiled by MattC137 that was imported from the official NBA website. | There are 400 rows which indicate observations for 400 players in the NBA | There are 18 columns or features.

Since our project requires the compilation of around 300 NBA players, there will be some players with different numbers of rows depending on how long they played in the league. These 2 datasets are the ones we're planning on using the most.

The research questions asked above can be answered with these datasets. Especially since there is so much data available, we'd be able to expand or compress our scope depending on our initial results. Also, since our questions were derived with these statistics in mind, we can group the variables we wish to analyze by player and see if there is a correlation.

For the question, "How does average number of fouls affect a player’s performance during the season?", we could compile the number of fouls a player receives and match that up with their production in points, efficiency, and perhaps assists or rebounds.



### Data provenance

* **Who or what is represented in the data?**

The National Basketball Association's players are represented in the data. The rows represent each season the NBA players had and the 30 columns represents statistics on their on court play such as minutes per game or steals.

* **What is an observation?**

An observation would be each year of an NBA player. If referring to the second dataset from MattC137, each observation would be an individual NBA player.

* **What variables are included and excluded?**

For the first dataset, the variables included are:

| Season | Age | Team | League | Position | Games Played | Games Started | Minutes Played Per Game | Field Goals Per Game | Field Goals Attempted Per Game | Field Goal Percentage | 3-Point Field Goal Per Game | 3-Point Attempted Per Game | 3-Point Percentage Per Game | 2-Point Field Goals Per Game | 2-Point Field Goals Attempted Per Game | 2-Point Percentage Per Game | Effective Field Goal Percentage Per Game | Free Throws Per Game | Free Throw Attempted Per Game | Free Throw Percentage Per Game | Offensive Rebound Per Game | Defensive Rebound Per Game | Total Rebound Per Game | Assists Per Game | Steals Per Game | Blocks Per Game | Turn Overs Per Game | Points Per Game |
|---------------| -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- |

In the actual analysis of this data set, we'd exclude most of these variables and only keep:

| Season | Age | Games Played | Games Started | Minutes Played Per Game | Field Goals Per Game | Field Goal Percentage | 3-Point Field Goal Per Game | 3-Point Percentage Per Game | 2-Point Field Goals Per Game | 2-Point Percentage Per Game | Effective Field Goal Percentage Per Game | Free Throws Per Game | Free Throw Percentage Per Game | Total Rebound Per Game | Assists Per Game | Steals Per Game | Blocks Per Game | Turn Overs Per Game | Points Per Game |
|---------------| -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | -------------- | --------------

In the second dataset, we'd keep all the variables listed and compiled by MattC137. Since we're not sure of what exactly to do with it as a group yet, this is the best method to ensure we're not limiting ourselves.

* **Who collected the data? When? For what purpose?**

The company that collected the data was **_sportradar_**, the official statistical partner of the NBA. They've been collecting data since April 2020. Their core mission statement and values indicate that the datasets they provide are meant to "empower our users to enjoy, understand, and share the sports they love." They actually brush up on some Data Feminism concepts with their values of democratization of sports data and working to have reliable, respected, and credible data.

The second dataset is compiled by MattC137, but it originated from th official NBA website.

* **How was the data collection effort funded?**

Though they don't mention how the data collection was funded, it seems as though they get funding from the NBA as they are partners.

* **Who is likely to benefit from the data or make money?**

The NBA is likely to benefit from the data and the service they provide, which is entertainment in the form of a basketball game, is more likely to boom. The more spectacular the statistics or the more unbelievable the headline, the more fans the NBA would likely attract.  

* **How was the data validated and held secure? Is it trustworthy or credible?**

The data is validated and held secure by the actual organization it comes from: the NBA. It is as trustworthy and credible as any possible dataset can be. Though the NBA would gain a lot to have exaggerated stats, this is unlikely as all games are recorded and the statistics are often recorded live.

* **How did you obtain the data? Do you credit the source of the data?**

I obtained the data through the Basketball-Reference's own CSV to Excel function. I also credited the source of the data in the table above as well as the References section below.

### Expected implications
Our expected implication is that the healthier the players are, meaning less injuries, more years of playing, and more overall successful seasons, the more successful the player can be.

This would ultimately be best for all parties involved as fans get to see their favorite players play for longer, the athletes get more opportunities to earn a salary doing what they love, and NBA owners get to see quality players that attract more fans to their arenas.

If our research question gets answered and we get correlations between minutes played and production, the implications for the NBA regular season are massive. Perhaps it is time to rethink the number of games to preserve the quality of the game.

### Limitations
Though our analysis will consist of the appropriate amount of data points to best support our thesis and come up with results, the variation of players’ performance is expected as their progress is not always linear. For example, players go through injuries, personal matters, or slumps, and later some of those players show good performance in the game but there are also others who struggle to be at the same level as they were before. Thus, we’d like to emphasize that the end result of the project will be based on the probability from the collected data and won’t be entirely accurate in future cases. Additionally, if our group decides to take players’ injuries into consideration for the project, we’ll need to assess the severity of each player’s injury as well as they matter to their future performances, which would be difficult.


### Acknowledgements
* Samuel
* Discord
* Info 201 Teams Page
* Prof. Hendry

A sincere thank you from our group!



### References

Ajjarapu, Nikhil. “The Effect of Fouls on a Player's Performance in the NBA.” Medium, Medium, 6 June 2019, https://medium.com/@nikhil.ajjarapu/the-effect-of-fouls-on-a-players-performance-in-the-nba-42a0149a1d20.

“Basketball Statistics and History.” Basketball, https://www.basketball-reference.com/.

Introduction: Why Data Science Needs Feminism. (2020). In Data Feminism. Retrieved from https://data-feminism.mitpress.mit.edu/pub/frfa9szd

Kalén, Anton, et al. “Effects of Age on Physical and Technical Performance in National Basketball Association (NBA) Players.” Research in Sports Medicine (Print), U.S. National Library of Medicine, https://pubmed.ncbi.nlm.nih.gov/32847370/.

Lewis, Melanie. “It's a Hard-Knock Life: Game Load, Fatigue, and Injury Risk in the National Basketball Association.” Journal of Athletic Training, National Athletic Trainers Association, May 2018, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6107769/.

MattC137. “Open_Data/Data/Sports/NBA at Master · Mattc137/open_data.” GitHub, https://github.com/MattC137/Open_Data/tree/master/Data/Sports/NBA.

Medina, Mark. “How NBA Players and Coaches Navigated This Season a Year after Experiencing the Bubble.” USA Today, Gannett Satellite Information Network, 12 June 2021, https://www.usatoday.com/story/sports/2021/06/11/how-nba-players-coaches-navigated-season-after-bubble-experience/7632303002/.

Sundberg, Andrew. “College Basketball Dataset.” Kaggle, 16 Mar. 2021, https://www.kaggle.com/andrewsundberg/college-basketball-dataset.

### Appendix A: Questions

* How do we git pull and work on accurate versions of the .md file?

* With so much basketball data, what focus should we narrow down on?

* Narrowing in on the 2021 season with stats like career All-Star Game appearances included might be helpful.

* How do we all collaborate and push onto the same GitHub page?

* Is this assignment exclusively dplyr?
