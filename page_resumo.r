page_resumo <- fluidRow(
  includeCSS("www/css.css"),

  # Current time
  h2(textOutput('currentTime')),
  
  
  # Apuração % Total 
  h2(infoBoxOutput("pvv", width = NULL)),
  
  
  
  # Primeiro Colocado
  #imageOutput('cand_1'),
  box(
    title = '1° Colocado:',
    status = 'success',
    solidHeader = TRUE,
    collapsible = F,
    imageOutput("num_cand1"),
    div(class='inline-block',infoBoxOutput("qtd_voto1", width = NULL)),
    valueBoxOutput("cand_1_percent", width = NULL),
    ),

  
  
  # Segundo Colocado
  box(
    title = '2°- Colocado', 
    status = 'warning',
    solidHeader = TRUE,
    collapsible = FALSE,
    height = 4,
    imageOutput('num_cand2'),
    div(class='inline-block',infoBoxOutput("qtd_voto2", width = NULL)),
    valueBoxOutput("cand_2_percent", width = NULL)),

  
  
  # Plot % de apuração por região
  box(
    title = 'Relação de apurações por região',
    width = 10,
    solidHeader = TRUE,
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
