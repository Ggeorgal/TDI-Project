# TDI-Project
 Title: Optimal resource management to reduce the impact of aviation accidents

For this project, I propose to complete a 4-step process that can help optimize available first-responder and employee resources around the country to reduce the impact of aviation accidents. Human life loss and damaged equipment are common outcomes when we hear (or not) about these accidents. Lack of awareness from the public is just the first part of problem. People think such accidents are uncommon or a "one-off" because we only hear them in the news once in a while, but in reality, there are thousands of them happening every year around the 20,000 airports in North America. Most of them are smaller private-type planes. One reason why accidents end with adverse outcome is the lack of or inefficient distribution of resources at these airports. Some airports are untowered, meaning they are completely empty, others have lack of first-responders or equipment. 

I propose the following four steps to come up with an optimized strategy of distributing available resources around the US airports:
1) Extract useful information from historical data
2) Find what are the most important factors when it comes to accident occurrences and map them by location (e.g., by state)
3) Record the types of available resources currently and in future years
4) Optimize the distribution of these resources, based on the information from steps 1+2

The most challenging part of the process is likely step 1. The National Transportation Safety Board (NTSB) has a massive database where they record all the accidents and incidents in the US, but the problem is HOW they do that. Some information is straightforward (e.g., how many engines the plane had), while other types of information are very hard to use in raw format (e.g., a 100,000-word narrative that the investigator wrote after the investigation). It is true though that with such large amount of information, there is likely a pattern that human eye cannot catch, and that is why this project requires some computational approach. It is impossible for us to solve this problem without the tools we have today for data analysis and data understanding.

For this preliminary proposal, I work with a cleaned subset of the whole database.

For the first plot, I produced an interactive graph that allows the user to choose any number of states and see how the accident number has changed over time for that state. Hovering over a line gives the state abbreviation while highlighting it. This plot helps us get an understanding of how accident numbers changed over the years for each state, which plays a critical role in how we manage resources at these states. California has the historically the highest number of accidents. For this plot, you can play the .mp4 where I show a few features of it, or run the R code yourself!

For the second plot, I did a linear regression to see the drop in accident number per year given the assumptions of regression, which is -17.91, meaning every year we have around 18 accidents on average since 1982.

You can find the codes to produce these plots and a copy of this project text in my github
https://github.com/Ggeorgal/TDI-Project.git

As part of the program, I will complete the rest of the steps of the project. I will first do more analysis with the dataset by including more variables (estimated 10 hours of work), use a more complete regression with all the factors of the database (est. 5 hours), do a basic search for resource availability (such as employees per state, est. 4 hours of work), and lastly use optimization to allocate the resources properly within each state (est. 6 hours of work).
