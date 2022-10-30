server <- function(input, output, session) {
  
  values <- reactiveValues(df = data.frame())
  
  observeEvent(reactiveTimer(200000)(), {
  
    values$df <- isolate({
      values$df <- read_csv('data/df_geral.csv', show_col_types = FALSE)
    })
    
    values$df1 <- isolate({
      values$df1 <- read_csv('data/df_primeiro.csv', show_col_types = FALSE)
    })
    
    values$df2 <- isolate({
      values$df2 <- read_csv('data/df_segundo.csv', show_col_types = FALSE)
    })
    
    values$df3 <- isolate({
      values$df3 <- read_csv('data/results_time.csv', show_col_types = FALSE)
    })
    
  })
  
  source('server/resumo.R', local=TRUE)

  } # FIM
