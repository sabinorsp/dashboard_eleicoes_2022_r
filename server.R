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
  
  source('server/resumo.R', local=TRUE)

  } # FIM
