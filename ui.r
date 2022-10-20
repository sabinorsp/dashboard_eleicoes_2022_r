library(shinydashboard)
library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)
library(ggplot2)
library(scales)

source('getdataTSE.r')
#source('processing_data.r')


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
               source('page_resumo.r')),
      
      tabItem(tabName = 'page_regional',
              source('page_regional.R'))
      
    )
  )
)# FIM
