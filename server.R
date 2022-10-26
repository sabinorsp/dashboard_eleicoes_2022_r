server <- function(input, output, session) {
  
  values <- reactiveValues(df = data.frame())
  
  observeEvent(reactiveTimer(360000)(), {
  
    values$df <- isolate({
      values$df <- read_csv('data/df_geral.csv')
    })
    
    values$df1 <- isolate({
      values$df1 <- read_csv('data/df_primeiro.csv')
    })
    
    values$df2 <- isolate({
      values$df2 <- read_csv('data/df_segundo.csv')
    })
    
    values$df3 <- isolate({
      values$df3 <- read_csv('data/results_time.csv')
    })
    
  })
  

  # Data e hora 
  output$currentTime <- renderText({
    Sys.setenv(TZ='GMT3')
    invalidateLater(1000, session)
    paste0(format(Sys.time(), "%X "))
  })
  
  
  # (select(values$df, pst) %>% filter(values$df$cdabr == 'br'))[1,1]
  # Total de votos Apurados
  output$pvv <- renderValueBox({
    valueBox(
      paste(
        (select(values$df, pst) %>% filter(values$df$cdabr == 'br'))[1,1],
        "%",' ' ,'das seções totalizadas'),
      paste('Ultima Atualização:', 
            ((select(values$df, dg)) %>% filter(values$df$cdabr == 'br'))[1,1],
            as.character(data.frame((select(values$df, hg)) %>% filter(values$df$cdabr == 'br'))[1,1])),
      icon = icon('glyphicon-home', lib='glyphicon'),
      color ='blue'
    )
  })
  
  #(select(values$df1, vap))[1,1])
  # % dos votos apurados por Candidato
  output$cand_1_percent <- renderValueBox({
    valueBox(
      paste((select(values$df1, pvap))[1,1], '%'), 
      paste('Qtd.Voto:',
            formatC(data.frame((select(values$df1, vap))[1,1])[1,1],
                    format='d',
                    big.mark=',')), 
      icon = icon("hourglass", 
      lib = "glyphicon"),
      color = "light-blue"
    )
  })
  
  output$cand_2_percent <- renderValueBox({
    valueBox(
      paste((select(values$df2, pvap))[1,1], '%'), 
      paste('Qtd.Voto:',
            formatC(data.frame((select(values$df2, vap))[1,1])[1,1],
                    format='d',
                    big.mark=',')), 
      icon = icon("hourglass", 
      lib = "glyphicon"),
      color = "light-blue"
    )
  })

  
  # Quantidade dos Votos Apurados
  output$qtd_voto1 <- renderText({
    paste0((select(values$df1, nm))[1,1])
  })
  
  output$qtd_voto2 <- renderText({
    paste0((select(values$df2, nm))[1,1])
  })
  
  
  # Diferença de votos do 1° para o 2° colocado
  output$diff <- renderText({
    formatC(
    as.integer((select(values$df1, vap))[1,1]) - as.integer((select(values$df2, vap))[1,1]),
    format= 'd',
    big.mark=','
    )
    })
    
  
  # sqcand - número fixo do candidato para primeiro e segundo colocado
  
  output$num_cand1 <- renderImage({
    filename <- normalizePath(file.path(paste('www/',(select(values$df1, sqcand))[1,1],'.jpg', sep='')))
    list(
      src= filename,
      height = 100,
      width=90
      )
  }, deleteFile = F)
  
  output$num_cand2 <- renderImage({
    filename <- normalizePath(file.path(paste('www/',(select(values$df2, sqcand))[1,1],'.jpg', sep='')))
    list(
      src=filename,
      height = 100,
      width=90
    )
  }, deleteFile = F)
  
  
  # PLot Gráfico da % de apuração por região
  output$plot_pvv <- renderPlot({
    plot_pvv(values$df)
  })
  
  
  # PLot Gráfico Resultado % apuração por tempo
  output$plot_result_time <- renderPlot({
    plot_result_time(values$df3)
  })
  
  } # FIM
