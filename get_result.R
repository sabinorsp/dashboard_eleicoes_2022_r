get_result <- function(df, df1, df2){
  
  hg_check <- read_csv('results.csv', col_names = F)
  hg <- (select(df, hg) %>% filter(df$cdabr == 'br'))[1,1]
  
  if(hg != as.character(tail(hg_check$X1, n=1)) ){
    result_cand1 <- select(df1, pvap)[1,1]  
    nm_cand1 <- select(df1, nm)[1,1]
    result_cand2 <- select(df2, pvap)[1,1]
    nm_cand2 <- select(df2, nm)[1,1]
    df_plot_result <- data.frame(
      'HAtualizacao' <- hg,
      '%Cand1' <- result_cand1,
      'NomeCand1' <- nm_cand1,
      '%Cand2' <- result_cand2,
      'NomeCand2' <- nm_cand2
    )
    colnames(df_plot_result) <- c('Hora_Atualizacao', 'R_Cand1', 'Nome_Cand1', 'R_Cand2', 'Nome_Cand2')
    df_plot_result['R_Cand1'] <- gsub(',', '.', df_plot_result$R_Cand1)
    df_plot_result['R_Cand1'] <- sapply(df_plot_result$R_Cand1, as.numeric)
    df_plot_result['R_Cand2'] <- gsub(',', '.', df_plot_result$R_Cand2)
    df_plot_result['R_Cand2'] <- sapply(df_plot_result$R_Cand2, as.numeric)
    write_csv(df_plot_result, 'results.csv', append= TRUE)
  } # FIM if 
  return(df_plot_result)
} # Fim Function