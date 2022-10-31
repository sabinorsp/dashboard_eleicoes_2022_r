library(shinydashboard)
library(shiny) 
library(shinythemes) 
library(dplyr)
library(ggplot2)
library(scales)
library(readr)

source('functions/plot_pvv.R')
source('functions/plot_result_time.R')

#Save requeriments.txt
req <- sessionInfo()

req

write.table(req, 'requeriments.txt')

ui <- dashboardPage(
  
  dashboardHeader(
    title = "Eleições 2° Turno - Presidente"
                  ),
  
  
  dashboardSidebar(
    disable = TRUE,
    sidebarMenu(
      width = 350,
      menuItem("Resultado Geral", tabName = "page_resumo", icon = icon("tachometer-alt"))
    )
  ),
  
  
  dashboardBody(
    tabItems(
      tabItem( tabName = 'page_resumo',
               source('ui/page_resumo.R'))
      
      
    )
  )
)# FIM
