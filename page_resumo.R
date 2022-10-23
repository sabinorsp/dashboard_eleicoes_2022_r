page_resumo <- fluidRow(
  #includeCSS("www/css.css"),
  
  # Current time
  box(
    title = 'Horário Atual:',
    width = NULL,
    solidHeader = T,
    status = 'primary',
    collapsible = T,
    color = 'aqua',
    div(h2(textOutput('currentTime')), style= 'text-aling:center')
  ),
  
  # Apuração % Total 
  h2(infoBoxOutput("pvv", width = NULL)),
  
  
  
  # Primeiro Colocado
  box(
    title = div(textOutput('qtd_voto1'), style= 'font-size:36px; bold'),
    status = 'primary',
    solidHeader = TRUE,
    collapsible = F,
    imageOutput("num_cand1", inline=T),
    valueBoxOutput("cand_1_percent", width = NULL),
    ),
  
  
  # Segundo Colocado
  box(
    title = div(textOutput('qtd_voto2'), style= 'font-size:36px; bold'), 
    status = 'primary',
    solidHeader = TRUE,
    collapsible = FALSE,
    imageOutput('num_cand2', inline = T),
    valueBoxOutput("cand_2_percent", width = NULL)),

  
  
  # Plot % de apuração por região
  box(
    title = 'Relação de apurações por região',
    width = 10,
    status = 'primary',
    solidHeader = TRUE,
    background = 'aqua',
    collapsible = T,
    plotOutput("plot_pvv", height = 380)
  ),
  
  
  
  # Diferença de Votos entre 1° e 2°
  box(
    title = 'Diferença de Votos entre o 1° E 2° Colocado:',
    status = 'primary',
    solidHeader = T,
    background = 'aqua',
    width = 6,
    collapsible = T,
    h3(textOutput("diff"))
  )
  
  
  )# FIM
