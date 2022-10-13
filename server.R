server <- function(input, output) {
  
  
  
  # Data e hora 
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste(" Data e Horário:", Sys.time())
  })
  
  
  
  # Total de votos Apurados
  output$pvv <- renderValueBox(
    valueBox(
      paste(pvv_br,"%",' ' ,'das seções totalizadas'),
      'Ultima Atualização: "Colocar o Dado aqui"',
      icon = icon('glyphicon-home', lib='glyphicon'),
    )
  )
  
  
  
  # % dos votos apurados por Candidato
  output$cand_1_percent <- renderValueBox({
    valueBox(
      paste(pvap_br_1,"%"), df_primeiro$nm[1], icon = icon("hourglass", lib = "glyphicon"),
      color = "green"
    )
  })
  
  output$cand_2_percent <- renderValueBox({
    valueBox(
      paste(pvap_br_2,"%"), df_segundo$nm[1], icon = icon("hourglass", lib = "glyphicon"),
      color = "yellow"
    )
  })
 
  
  
  # Quantidade dos Votos Apurados
  output$qtd_voto1 <- renderInfoBox({
    infoBox(
      "Quantidade de Votos: ", 
      vap_br_1, 
      icon = icon("glyphicon-home", lib ='glyphicon'),
      color = "green",
      fill = T
    )
  })
  
  output$qtd_voto2 <- renderInfoBox({
    infoBox(
      "Quantidade de Votos: ", 
      vap_br_2, 
      icon = icon("glyphicon-home", lib ='glyphicon'),
      color = "yellow",
      fill = T
    )
  })
  
  
  
  # Diferença de votos do 1° para o 2° colocado
  output$diff <- renderText({diff})
  
  
  
  # PLot Gráfico da % de apuração por região
  output$plot_pvv <- renderPlot({
    plot_pvv
  })
  
  
  
  } # FIM
