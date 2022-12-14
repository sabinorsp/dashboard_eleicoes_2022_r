# Função para o plot_pvv regional
plot_pvv <- function(df){
  
  UF_pvv <- select(
    df,
    cdabr,
    pst
  ) 
  UF_pvv <- UF_pvv[-1,]
  
  median_region_pvv <- function(reg){
    pvv_sum <- 0
    for(uf in reg){
      var <- (select(df, cdabr, pst) %>% filter(cdabr == uf))[1,2]
      pvv_sum = pvv_sum + var
    }
    return(pvv_sum/length(reg))
  }
  
  norte <- c('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO')
  nordeste <- c('AL', 'BA', 'CE', 'MA', 'PB', 'PI', 'PE', 'RN', 'SE')
  centro_oeste <- c('DF', 'GO', 'MT', 'MS')
  sudeste <- c('ES', 'MG', 'RJ', 'SP')
  sul <- c('PR', 'RS', 'SC')
  
  mean_pvv <- c(
    median_region_pvv(norte),
    median_region_pvv(nordeste),
    median_region_pvv(centro_oeste),
    median_region_pvv(sudeste),
    median_region_pvv(sul))
  
  regional_pvv <- data.frame(
    "Regioes" = c('Norte', 'Nordeste', 'Centro Oeste', 'Sudeste', 'Sul'),
    "median_pvv" = mean_pvv
  )
  colnames(regional_pvv) <- c('Regioes', 'median_pvv')
  
  plot_pvv <- ggplot(regional_pvv, aes(x=Regioes, y=median_pvv, fill = Regioes)) + 
    geom_bar(stat = 'identity')+
    geom_col(position='fill' )+
    scale_fill_brewer(palette = "Pastel1")+
    geom_text(aes(label=paste0(round(median_pvv, 2),'%')), vjust=0.5, color="black",
              position = position_dodge(0.9), size=6)+
    ylab('% das apurações') + 
    xlab('Regiões da Federação')+
    theme(
      legend.text = element_text(size= 12),
      legend.title  = element_text(size = 16),
      axis.text = element_text(size=12),
      axis.title.x = element_text(size= 14),
      axis.title.y = element_text(size= 14)
    ) + 
    coord_flip()
  
  return(plot_pvv)
  
}