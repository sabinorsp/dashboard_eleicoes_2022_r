page_regional <- fluidRow(
  box(div(class = "my-class", "Div content")),

  
  box(
    uiOutput('img1'),
    title = 'Primeiro colocado',
    
  ),
  
  uiOutput(outputId = 'img2'),
  
  
  )# FIM
