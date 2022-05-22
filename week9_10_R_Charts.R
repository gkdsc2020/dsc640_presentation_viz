# Week 9&10 -bar charts, stacked bar charts, pie charts, and donut charts
# Author- Ganesh Kale

library(ggplot2)
library(treemapify)
library(dplyr)
library(reshape)
library(maps)
library(mapdata)
library(plotly)

file.path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/ppg2008.csv'

# load data 
df <- read.csv(file.path)

# display top 5 records
head(df,5)

# plot heat map

df0 <- df %>% select(Name,Game,Minutes,Points,Field_Goals_Made,Field_Goal_Attempts,Defensive_Rebounds,Total_Rebounds,Turnovers,Free_Throws_Attempts,Free_Throws_Made,Assists,Blocks)

df0 <- df0[order(df0$Game,decreasing = TRUE),] [1:15,]

df1 <- melt(df0)

head(df1)

plt0 <- ggplot(df1,aes(x=variable, y=Name,fill=value)) + geom_tile() + ggtitle('Top 15 NBA Players Games Stats')
plt1 <- plt0 + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
plt1

# Plot contour plot

ggplot(df0, aes(x=Minutes, y=Points,fill = ..level..)) +  stat_density_2d(geom = "polygon")


# plot spatial chart

# load the data 

file.path <- '/Users/ganeshkale/work/virtual_envs/DSC640_Present_Viz/dsc640_presentation_viz/data/costco_stroes.csv'

# load data 
costco <- read.csv(file.path)

# display top 5 records
head(costco,5)

g <- list(scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

fig <- plot_ly()
fig <- fig %>% add_trace(
    type="choropleth",
    locations=costco$state_code,
    z=costco$Address,
    locationmode = "USA-states",
    colorscale="oranges",
    zmin=0,
    zmax=115,
    marker=list(line=list(
      width=0)
    )
  )

fig <- fig %>% colorbar(title = "Store Density")
fig <- fig %>% layout(
  title = "Costco Store Count"
)

fig <- fig %>% layout(
  geo = g
)

fig



