rm(list=ls())

accidents <- read.csv('accidents_clean.csv',fill=T)


library(lubridate)
accidents$Event.Date <- ymd(accidents$Event.Date)
accidents$Event.Date <- year(accidents$Event.Date)

accidents_year <- accidents %>% group_by(Event.Date) %>% tally(sort = TRUE)
accidents_year$N_fatal <- 0
accidents_year$N_Amateur <- 0

for (i in 1:dim(accidents_year)[1]){
  temp2 <- accidents[accidents$Amateur.Built == " Yes " & accidents$Event.Date == accidents_year$Event.Date[i],]

  accidents_year$N_Amateur[i] <- nrow(temp2)
  
}

accidents_year$Amateur_ratio <- accidents_year$N_Amateur/accidents_year$n


library(ggplot2)

lm(n ~ Event.Date + Amateur_ratio, data = accidents_year)


ggplot(accidents_year, aes(Event.Date, n)) + geom_point() +
  geom_smooth(method="lm", se=TRUE)

plot2 <- ggplot(data = accidents_year, aes(x=Event.Date, y= n)) + scale_x_continuous(expand = c(0.02,0.02),breaks = accidents_year$Event.Date) + scale_y_continuous(expand = c(0,0),limits = c(0,1300),breaks = seq(0,1300,250)) +
  geom_point(size = 4) + geom_line(size = 2)+   geom_smooth(method="lm", se=TRUE) + ylab('Number of accidents') + 
  theme(panel.grid.major.x = element_blank(), legend.title = element_blank(), legend.position = "bottom", plot.title = element_text(hjust = 0.5),text = element_text(size=14, face="bold"), axis.title.y = element_text(margin = margin(r = 20),size=14, face="bold"), legend.text=element_text(size=14),panel.background = element_blank(),panel.grid.major = element_line(size = 0.25, linetype = 'solid',
                                                                                                                                                                                                                                                                                                                                                                            colour = "black"), axis.title.x = element_text(margin = margin(t = 20)),axis.text.x = element_text(angle = 90, hjust = 1))
png(filename="plot2.png",
    type="cairo",
    units="in",
    width=8,
    height=6,
    pointsize=12,
    res=400)
plot2
dev.off()