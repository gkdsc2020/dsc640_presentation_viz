# Week 11&12 - histograms, box plots, bullet charts, and Violin chart
# Author- Ganesh Kale

library(ggplot2)
library(dplyr)
library(reshape)
library(plotly)

hotdog_path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/hotdog-contest-winners.xlsm'
edu_path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/education.csv'

# load data 
hotdog <- readxl::read_excel(path=hotdog_path)
df <- read.csv(edu_path)

# display top 5 records
head(df,5)



# plot histogram

ggplot(df, aes(x=reading)) + geom_histogram(binwidth=15,fill='blue') +  ggtitle('Distribution of Reading Score across USA States')

# plot box plot
head(hotdog,4)

ggplot(hotdog, aes(x=`Dogs eaten`,y=Country)) + geom_boxplot(fill='blue') +  ggtitle('Distribution of Hot dogs eaten accorss world')


# plot violin plot

ggplot(hotdog, aes(x=`Dogs eaten`,y=Country)) + geom_violin(fill='blue',draw_quantiles = TRUE) +  ggtitle('Distribution of Hot dogs eaten accorss world')


# bullet chart

# load the data

file.path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/perf_test_data.xlsx'

df <- readxl::read_excel(path=file.path)

head(df,2)

bullet_colors <- c("#E9FFE3", "#A3D694", "#61AB40", "#318100")
names(bullet_colors) <- c("poor", "ok", "good", "excellent")

ggplot() +
  geom_bar(data = df, 
           aes(x = Employee, y = goal,fill=Rank), stat = "identity",
           position = "stack") +
  geom_bar(data = df, 
           aes(x = Employee, y = sale), fill = "black", width = .2,
           stat = "identity") +
  scale_fill_manual(values = bullet_colors) +
  coord_flip(expand = FALSE) + ylab('Sale Measure') +   ggtitle('Sales Representatives Performance')

