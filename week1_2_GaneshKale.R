# Week 1&2 -bar charts, stacked bar charts, pie charts, and donut charts
# Author- Ganesh Kale

library(ggplot2)
library(scales)

file.path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/hotdog-contest-winners.xlsm'

df <- readxl::read_excel(path=file.path)

# display top 5 records
head(df,5)

# display data type

str(df)

# plot bar chart

plt1 <- ggplot(data=df,aes(x=as.factor(Year),y=as.factor(`Dogs eaten`))) + geom_bar(stat = "identity", fill='blue',show.legend = TRUE)
plt <- plt1 + coord_flip() +ggtitle('Hot Dogs eaten by Year') + ylab('# Hot Dogs Eaten') + xlab('Year')
print(plt)

# plot stacked bar chart

df0 <-  count(df,c("Country","`New record`"))
#df0 <- df0 %>% arrange(desc(Country)) %>% mutate(ypos = (freq)-0.5*freq)
df0


df0$New.record <- as.factor(df0$New.record)

plt1 <- ggplot(data=df0,aes(x=Country,y=freq)) + geom_bar(aes(fill=New.record),stat='identity')
plt <- plt1 + coord_flip() +labs(title='Hot Dogs Contest winner Country & New Record',x='Country')  + geom_text(aes(label=freq),size=4)
print(plt)


# plot pie chart

library(plyr)
df1 <- count(df,c("Country"))
df1$perc <- round(df1$freq/sum(df1$freq),4)
df1 <- df1 %>% arrange(desc(Country)) %>% mutate(ypos1 = cumsum(freq)-0.5*freq) %>% mutate(percent = percent(perc))
df1 <- df1 %>% arrange(desc(Country)) %>% mutate(ypos2 = cumsum(freq)-0.5*freq)
df1


plt1 <- ggplot(data=df1,aes(x="",y=freq,fill=Country)) + geom_bar(width=1,stat='identity')
plt <- plt1 + labs(title='Hot Dogs Contest winner by Country')  + coord_polar("y") + geom_text(aes(y=ypos1,label=percent),size=4,x=1.1) + geom_text(aes(y=ypos2,label=freq),size=4,x=0.8)  + theme_void()
print(plt)


# plot donut chart


plt1 <- ggplot(data=df1,aes(x=2,y=freq,fill=Country)) + geom_bar(width=1,stat='identity')
plt <- plt1 + labs(title='Hot Dogs Contest winner by Country')  + coord_polar("y") + geom_text(aes(y=ypos1,label=percent),size=4,x=2.2) + geom_text(aes(y=ypos2,label=freq),size=4,x=1.7)  + theme_void() + xlim(0.5, 2.5)
print(plt)

