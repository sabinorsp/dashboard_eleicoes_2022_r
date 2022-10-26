plot_result_time <- function(df){
  data <- read_csv('data/results_time.csv', col_names = F)
  cand_1 <- filter(data, data$X3 == 'CANDIDATO 9999')
  cand_2 <- filter(data, data$X3 =='CANDIDATO 9997')
  
  pp <- ggplot() +
    geom_line(data = cand_1, aes(X1,  X2, group = 1, colour = 'CANDIDATO 9999' ))+
    geom_line(data = cand_2, aes(X1, X2, group=1, colour = 'CANDIDATO 9997'))+
    scale_colour_manual("", breaks = c('CANDIDATO 9999', 'CANDIDATO 9997'),
                          values = c('blue', 'red'))+
    xlab('Hora Atualização') +
    ylab('Resultado %')
  return(pp)
}# FIM Function

