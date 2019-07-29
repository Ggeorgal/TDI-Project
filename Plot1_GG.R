# Load Libraries
library('tidyverse')
library('shiny')
library('ggvis')
library('dplyr')

rm(list=ls())

accidents <- read.csv('accidents_clean.csv',fill=T)


library(lubridate)
accidents$Event.Date <- ymd(accidents$Event.Date)
accidents$Event.Date <- year(accidents$Event.Date)

#Interactive plot of number of accidents, for each state, over time
state_names <- unique(accidents$State)
years <- rev(unique(accidents$Event.Date))

counts_state <- matrix(0, nrow = length(years), ncol = length(state_names)) 
for (i in 1:length(years)){
  for (j in 1:length(state_names)){
    counts_state[i,j] <- sum(accidents$State == state_names[j] & accidents$Event.Date == years[i])
    
  }
}
colnames(counts_state) <- state_names
rownames(counts_state) <- years
counts_state <- as.data.frame(as.table(counts_state))
colnames(counts_state) <- c("Year", "State", "Count")

plt<- counts_state %>% group_by(State) %>% ggvis(x=~Year,y=~Count,stroke=~State)%>%
filter(State %in% eval(input_select(choices =   unique(as.character(counts_state$State)),multiple=TRUE, label='States list'))) %>% 
layer_points(size:=50, fill=~ State, fillOpacity:=.5) %>% add_axis("y", title = "Number of Accidents") %>%
  add_axis("x", properties = axis_props(labels = list(angle = 90, align = "left", fontSize = 9))) %>%
add_tooltip(function(x) {paste(x$State)},'hover')  %>%layer_lines(strokeWidth:=3,stroke.hover:='black') %>%
hide_legend('stroke') %>% hide_legend('fill'); plt


  