# Info 201 AF
# Jinsu Ha
# Summary panel for group project

# load library
library("shiny")



summary_tab <- tabPanel(
  "Conclusion",
  titlePanel("Conclusion"),
  
  # server output requirement
  # Summary Takeaways
  # Presents **3+** *specific takeaways* from the analysis, tying the project 
  # back to the intention set out in the introduction.
  # (1pt each) A description of the notable data-insight or pattern discovered 
  # in your project
  # (2pts) Overall clarity and interest of the page. 
  
  fluidPage(
    h1("Conclusion"),
    
    h2("Recap of Our Research Questions and Expected Implications"),
    
    p("In the beginning of my team's research, our focus was to study the realtionships
      between the", em("health"), "of basketball players in NBA and their", em("performance"),
      ". So some of our research questions were focused on the different variations of 
      the player's performace compared to their experiences, how long they have played
      within each game, and how many games they have played in their career. Therefore,
      our expected implications of the research was that the healthier the players are, 
      the more years of playing, overall successful seasons, and the more successful
      the player can be."),
    
    h2("Findings"),
    
    p("Here are some key takeaways from our analysis and graphs."),
    
    p("In the chart 1, our team wanted to find the realtionship (correlation) between",
      strong("the number of games played by each team and the points made by each team."),
      "Our general expectation was that if they have played more games, they would have
      gotten more points. However, that was not the case."),
    
    p("Looking at the chart 1, we can derive that most of the higesht avaerge points
      were spread around average of 55 to 60 games and there is a stiff decline as
      the number of average games increases from the average of 70 games to 80 games.
      From here, one take away is that", strong("more games played do not alaways increase
      the average points"), "and", strong("highest average points by each team happens when
      the average games played is around 55 to 60 games"), "."),
    
    p("In the cart 2, we have created a bar graph to show", strong("the average 3 points made in percentage
      by position."), "The purpose of this graph was to highlight the modern 3-point efficiency
      of each position type in the NBA."),
    
    p("The key takeaway from chart 2 analysis is that there is a tendency of each player,
      especially in positions such as SF and PF, having to have a", em("high level of skills"),
      "to be considered average due to the emphais placed on the 3-point efficiency
      since the start of century."),
    
    p("Lastly, in the chart 3, we analyzed", strong("the average effective field goal percentage
      VS. average minutes played."), "Here we wanted to emphasize on the relationship
      between the performance and the time that each player played. Because we believed
      that if a player were to play for a longer time, he should be able to point more
      field goals"),
    
    p("The key takeaway from the chart 3 was very similar to the key finding from the chart 1.
      Because the highest average effective field goal was at its", strong("highest"), "when the
      average minutes played were around 27.5 to 30 minutes and showed a stiff decline
      as the average minutes played went from 37.5 minutes to 40 miutes. This was very interseting
      because it was complete opposite of what we expected in the beginning."),
    
    h2("Overall Findings"),
    
    p("After conducting our resaerch on the NBA data set and analzying different data to
      find the relationship between the player's health and performance, we have come
      to a conclusion that the healtier the player is, the better performace the player
      bring to the game. However, the minutes they played or the number of games they played,
      actually have a negative correlation with the player or the team's performance. It is
      because as the average minutes played and games played increase to its maximum number,
      the performance tends to decrease significantly.")
  )
)



# create the shiny server
server <- function(input, output) {
  
}

# shinyApp(ui = summary_tab, server = server)