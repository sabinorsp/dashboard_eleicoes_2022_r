plot_result_time <- function(df){
  data <- read_csv('data/results_time.csv', col_names = F)
  cand_1 <- filter(data, data$X3 == 'CANDIDATO 9999')
  cand_2 <- filter(data, data$X3 =='CANDIDATO 9997')
  
  pp <- ggplot() +
    geom_line(data = cand_1, aes(X1,  X2, group = 1, colour = 'CANDIDATO 9999' ))+
    geom_point(data = cand_1, aes(X1, X2), colour = 'blue', size= 2)+
    geom_line(data = cand_2, aes(X1, X2, group=1, colour = 'CANDIDATO 9997'))+
    geom_point(data = cand_2, aes(X1, X2), colour = 'red', size= 2)+
    scale_colour_manual("", breaks = c('CANDIDATO 9999', 'CANDIDATO 9997'),
                          values = c('blue', 'red'))+
    xlab('Hora Atualização') +
    ylab('Resultado %')+
    theme(
      legend.text = element_text(size= 14),
      axis.text = element_text(size=12),
      axis.title.x = element_text(size= 14),
      axis.title.y = element_text(size= 14)
    ) 
  return(pp)
}# FIM Function

