# link para o dia 30/10/22
# 'https://resultados.tse.jus.br/oficial/ele2022/545/dados-simplificados/br/br-c0001-e000545-r.json'
# set_link1 <- 'https://resultados.tse.jus.br/oficial/ele2022/545/dados-simplificados/'
# set_link2 <-'-c0001-e000545-r.json'


# Carrega dados estados
estados <- read.table('estados.txt', sep = ';', header = T)
teste <- read.table('teste.txt', sep = ';')



# Define os dataframes
df_list <- getdata_url()
df_geral <- df_list[[1]]
df_primeiro <- df_list[[2]]
df_segundo <- df_list[[3]]


# % de apuraçao Federação + UF
pvv_br <- (select(df_geral, pvv) %>% filter(df_geral$cdabr == 'br'))[1,1]
pvv_br 

UF_pvv <- select(
  df_geral,
  cdabr,
  pvv
) 
UF_pvv <- UF_pvv[-1,]
UF_pvv['pvv'] <- gsub(',', '.', UF_pvv$pvv)
UF_pvv["pvv"] <- sapply(UF_pvv$pvv, as.numeric)

median_region_pvv <- function(reg){
  pvv_sum <- 0
  for(uf in reg){
    var <- (select(df_geral, cdabr, pvv) %>% filter(cdabr == uf))[1,2]
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
  


# % voto por candidato pvap Federação
pvap_br_1 <- (select(df_primeiro, pvap))[1,1]
pvap_br_2 <- (select(df_segundo, pvap))[1,1]



# Quantidade de votos por candidato vap Federação
vap_br_1 <- (select(df_primeiro, vap))[1,1]
vap_br_2 <- (select(df_segundo, vap))[1,1]



# Diferença de votos entre o 1° e 2° colocado: 
diff <- as.integer(vap_br_1) - as.integer(vap_br_2)



#sqcand - número fixo do candidato para primeiro e segundo colocado
cod_1 <- (select(df_primeiro, sqcand))[1,1]
cod_2 <- (select(df_segundo, sqcand))[1,1]
num_cand1 <- paste(cod_1,'.jpg', sep='')
num_cand2 <- paste(cod_2, '.jpg', sep='')

