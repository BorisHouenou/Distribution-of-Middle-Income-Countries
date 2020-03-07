##############Distribution of MICs MAP###################
# Data preparation

setwd("/Users/borishouenou/Documents/IEO_doc")# Setting the working directory
# Loading packages and data
library(ggplot2)
library(gridExtra)
library(grid)
library(ggpubr)
library(plotly)
library(reshape2)
library(sqldf)
library(sf)
library(raster)
library(dplyr)
library(spData)
library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(mapview) # for interactive maps
library(ggplot2) # tidyverse vis package
library(shiny)   # for web applications
library(mapdata)
world<-map_data("world")
income<-read.csv("income_wb.csv")
map<-sqldf("select * from world join income on world.region=income.Country")# Merging map data and income level data
write.csv(map,file ="/Users/borishouenou/Documents/IEO_doc/map.csv")
ditch_the_axes <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank()
)
map1<-ggplot() + geom_polygon(data = map, aes(x=long, y = lat, group = group, fill=Income), color = "white") + 
  coord_fixed(1.3)+theme_bw() +
  ditch_the_axes + scale_fill_manual(values=c("yellow", "orange", "grey", "green")) # Colours of the fills
map1<-map1+ labs(title="Figure xxx: DISTRIBUTION OF MIDDLE-INCOME COUNTRIES - MAP")   #Labels


map2<-ggplot() + geom_polygon(data = map, aes(x=long, y = lat, group = group, fill=Income), color = "white") + 
  coord_fixed(1.3)+theme_pubclean()+
  #theme_pubr(base_size = 12, base_family = "",border=FALSE, margin=TRUE, legend=c("bottom", "none"), x.text.angle=0) +
  ditch_the_axes + scale_fill_manual(values=c("blueviolet", "darkorange", "bisque", "brown2")) # Colours of the fills
map2<-map2+ labs(title="Figure xxx: DISTRIBUTION OF MIDDLE-INCOME COUNTRIES - MAP")+ guides(fill=guide_legend(title="GNI per Capita:"))  #Labels
map2


map3<-ggplot() + geom_polygon(data = map, aes(x=long, y = lat, group = group, fill=Income), color = "white") + 
  coord_fixed(1.3)+theme_pubclean()+
  #theme_pubr(base_size = 12, base_family = "",border=FALSE, margin=TRUE, legend=c("bottom", "none"), x.text.angle=0) +
  ditch_the_axes + scale_fill_manual(values=c("blueviolet", "firebrick", "darkorange", "darkorchid")) # Colours of the fills
map3<-map3+ labs(title="Figure xxx: DISTRIBUTION OF MIDDLE-INCOME COUNTRIES - MAP")+ guides(fill=guide_legend(title="GNI per Capita:"))  #Labels
