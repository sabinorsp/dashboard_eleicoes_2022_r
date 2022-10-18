# Função para o plot_pvv regional
plot_pvv <- function(df){
  
  UF_pvv <- select(
    df,
    cdabr,
    pvv
  ) 
  UF_pvv <- UF_pvv[-1,]
  UF_pvv['pvv'] <- gsub(',', '.', UF_pvv$pvv)
  UF_pvv["pvv"] <- sapply(UF_pvv$pvv, as.numeric)
  
  median_region_pvv <- function(reg){
    pvv_sum <- 0
    for(uf in reg){
      var <- (select(df, cdabr, pvv) %>% filter(cdabr == uf))[1,2]
      var <- gsub(',','.', var)
      pvv_sum = pvv_sum + as.numeric(var)
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
    "Regiões " = c('Norte', 'Nordeste', 'Centro Oeste', 'Sudeste', 'Sul'),
    "median_pvv" = mean_pvv
  )
  colnames(regional_pvv) <- c('Regiões', 'median_pvv')
  
  plot_pvv <- ggplot(regional_pvv, aes(x=`Regiões`, y=median_pvv, fill = `Regiões`)) + 
    geom_bar(stat = 'identity')+
    geom_text(aes(label=paste0(median_pvv,'%')), vjust=0.5, color="black",
              position = position_dodge(0.9), size=6)+
    ylab('% das apurações') + 
    xlab('Regiões da Federação')+
    coord_flip()
  return(plot_pvv)
  
}