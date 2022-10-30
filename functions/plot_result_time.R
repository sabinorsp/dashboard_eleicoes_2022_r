plot_result_time <- function(df){
  data <- read_csv('data/results_time.csv', col_names = F)
  cand_1 <- filter(data, data$X3 == 'LULA')
  cand_2 <- filter(data, data$X3 =='JAIR BOLSONARO')
  
  pp <- ggplot() +
    geom_line(data = cand_1, aes(X1,  X2, group = 1, colour = 'LULA' ))+
    geom_point(data = cand_1, aes(X1, X2), colour = 'blue', size= 2)+
    geom_line(data = cand_2, aes(X1, X2, group=1, colour = 'JAIR BOLSONARO'))+
    geom_point(data = cand_2, aes(X1, X2), colour = 'red', size= 2)+
    scale_colour_manual("", breaks = c('LULA', 'JAIR BOLSONARO'),
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

