library(shinydashboard)
library(shiny) 
library(shinythemes) 
library(dplyr)
library(ggplot2)
library(scales)
library(readr)
source('functions/plot_pvv.R')
source('functions/plot_result_time.R')
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Eleições 2° Turno - Presidente"
                  ),
  
  
  dashboardSidebar(
    sidebarMenu(
      width = 350,
      menuItem("Resultado Geral", tabName = "page_resumo", icon = icon("tachometer-alt")),
      menuItem("Resultados Regionais", tabName = "page_regional", icon = icon("th"))
    )
  ),
  
  
  dashboardBody(
    tabItems(
      tabItem( tabName = 'page_resumo',
               source('pages/page_resumo.R')),
      
      tabItem(tabName = 'page_regional',
              source('pages/page_regional.R'))
      
    )
  )
)# FIM
