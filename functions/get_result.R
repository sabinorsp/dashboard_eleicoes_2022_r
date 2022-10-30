get_result <- function(df, df1, df2){
  hg <- (select(df, hg) %>% filter(df$cdabr == 'br'))[1,1]
  result_cand1 <- select(df1, pvap)[1,1]  
  nm_cand1 <- select(df1, nm)[1,1]
  result_cand2 <- select(df2, pvap)[1,1]
  nm_cand2 <- select(df2, nm)[1,1]
  df_result <- data.frame(
    'HAtualizacao' <- hg,
    'Result_%' <- result_cand1,
    'Nome_Cand' <- nm_cand1
  )
  
  df_result <- rbind(df_result, c(hg, result_cand2, nm_cand2))
  colnames(df_result) <- c('Hora_Atualizacao', 'Result_%', 'Nome_Cand')
  
  if(file.exists('data/results_time.csv')){
    hg_check <- read_csv('data/results_time.csv',show_col_types = FALSE, col_names = F)
    if(hg != as.character(tail(hg_check$X1, n=1)) ){
      
      write_csv(df_result, 'data/results_time.csv', append= TRUE)
    } # FIM if 
  }else{
    write_csv(df_result, 'data/results_time.csv')
  }
} # Fim Function


