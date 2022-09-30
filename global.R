#import library
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(plotly)
library(readr)
library(reshape2)

studpf <- read_csv("StudentsPerformance.csv")
studpf <- studpf %>% 
  mutate_if(is.character, as.factor)

#score distribution
score <- melt(studpf[,6:8])

theme_algoritma <- theme(legend.key = element_rect(fill="black"),
                         legend.background = element_rect(color="white", fill="#263238"),
                         plot.subtitle = element_text(size=6, color="white"),
                         panel.background = element_rect(fill="#dddddd"),
                         panel.border = element_rect(fill=NA),
                         panel.grid.minor.x = element_blank(),
                         panel.grid.major.x = element_blank(),
                         panel.grid.major.y = element_line(color="darkgrey", linetype=2),
                         panel.grid.minor.y = element_blank(),
                         plot.background = element_rect(fill="#263238"),
                         text = element_text(color="white"),
                         axis.text = element_text(color="white")
)


source("ui.R")
source("server.R")

shinyApp(ui=ui, server=server)