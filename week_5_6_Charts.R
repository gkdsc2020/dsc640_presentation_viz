# Week 1&2 -bar charts, stacked bar charts, pie charts, and donut charts
# Author- Ganesh Kale

library(ggplot2)
library(treemapify)
library(dplyr)

file.path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/expenditures.txt'

# load data 
df <- read.csv(file.path,sep = '\t')

# display top 5 records
head(df,5)

# display data type

str(df)

# plot tree maps

tree <- df %>% group_by(category) %>% summarise(expenditure = sum(expenditure))  %>% arrange(desc(expenditure))


head(tree)

lables <- paste(tree$category,tree$expenditure,sep="\n")

treemap0 <- ggplot(tree, aes(area=expenditure,fill=expenditure,label=lables)) + geom_treemap(show.legend = T) 
treemap1 <- treemap0 +  geom_treemap_text(place = 'top', grow = F, alpha = 0.5, color = 'white', min.size = 0)
treemap2 <- treemap1 + ggtitle('Category wise expenditure')
treemap2

# plot area chart

edu <- df %>% filter(category=='Education')

ggplot(edu,aes(x=as.factor(year),y=expenditure,group = category)) + geom_area(fill=4) + ggtitle('Expenditures on Education')


# plot stacked area chart

edu <- df %>% filter(category=='Food'| category=='Apparel'| category == 'Personal Care'| category == 'Entertainment') %>% group_by(year,category) %>% summarise(expenditure = sum(expenditure))

ggplot(edu,aes(x=as.factor(year),y=expenditure,group = category,fill=category)) + geom_area() + ggtitle('Expenditures on Personal Luxury')









