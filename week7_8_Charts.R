# Week 7&8 - Scatter, bubble and density plots
# Author- Ganesh Kale

library(ggplot2)


file.path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/expenditures.txt'

df <- read.csv(file=file.path,stringsAsFactors=FALSE )

# display top 5 records 
head(df,5)


# display data type

str(df)

# plot scatter chart

plt1 <- ggplot(data=df,aes(x=population,y=robbery)) + geom_point(color='blue')
plt <- plt1 +ggtitle('Relation of Robbery with Population') + ylab('Robbery') + xlab('Population (Log)') + scale_x_continuous(trans='log2')
print(plt)

# plot bubble chart

plt1 <- ggplot(data=df,aes(x=population,y=robbery)) + geom_point(aes(color=murder, size=murder),alpha=0.5)
plt <- plt1 +ggtitle('Relation of Robbery with Population, Size=Murder') + ylab('Robbery') + xlab('Population (Log)') + scale_x_continuous(trans='log2')
print(plt)


# plot density chart

plt1 <- ggplot(data=df,aes(x=motor_vehicle_theft)) + geom_density(color='blue')
plt <- plt1 +ggtitle('Density of motor_vehicle_theft') + ylab('Density') + xlab('motor_vehicle_theft')  + xlim(-10, 1500)
print(plt)
