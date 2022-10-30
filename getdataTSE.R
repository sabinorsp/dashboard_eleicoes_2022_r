source('functions/get_result.R')
library(dplyr)
library(readr)
# Carrega dados estados
estados <- read.table('data/estados.txt', sep = ';', header = T)

# Configura link de acesso ao TSE
set_link1 <- 'https://resultados.tse.jus.br/oficial/ele2022/545/dados-simplificados/'
set_link2 <-'-c0001-e000545-r.json'
for(uf in estados['Sigla']) {
  links <- paste(set_link1, uf, '/', uf, set_link2, sep = '')
}


while(TRUE){
  getdata_url <- function(){
    # Faz o Get dos arquivos JSON e configura dataframes
    df_geral <- data.frame()
    df_primeiro <- data.frame()
    df_segundo <- data.frame()
    for(link in links) {
      data_UF <- httr::content(httr::GET(link))
      df_geral <- rbind(df_geral, as.data.frame(data_UF)[1,1:64])
      
      for(i in 1:2){
        if(data_UF$cand[[i]]$seq =='1'){
          df_primeiro <- rbind(df_primeiro, as.data.frame(data_UF$cand[[i]]))
        }
        if(data_UF$cand[[i]]$seq =='2'){
          df_segundo <- rbind(df_segundo, as.data.frame(data_UF$cand[[i]]))
        }
      }
    }
    return(list(df_geral, df_primeiro, df_segundo))
  }
  
  # Create a df_geral
  df_get_geral <- function(){
    df_geral <- getdata_url()
    return(df_geral[[1]])
  }
  
  # Create a df_primeiro colocado
  df_get_primeiro <- function(){
    df_primeiro <- getdata_url()
    return(df_primeiro[[2]])
  }
  # Create a df_segundo colocado
  df_get_segundo <- function(){
    df_segundo <- getdata_url()
    return(df_segundo[[3]])
  }
  
  # Tratamento dados df_geral -> Variáveis de interesse: pst - gd - cdabr - hg
  df_geral <- df_get_geral()
  df_geral <- select(df_geral, cdabr, hg, dg, pst)
  df_geral['pst'] <- gsub(',', '.', df_geral$pst)
  df_geral["pst"] <- sapply(df_geral$pst, as.numeric)
  
  # Tratamento dados df_primeiro -> Variáveis de interesse: pvap - vap - nm - sqcand
  df_primeiro <- df_get_primeiro()
  df_primeiro <- select(df_primeiro, pvap, vap, nm, sqcand)
  df_primeiro['pvap'] <- gsub(',', '.', df_primeiro$pvap)
  df_primeiro['pvap'] <- sapply(df_primeiro$pvap, as.numeric)
  
  # Tratamento dados df_segundo -> Variáveis de interesse: pvap - vap - nm - sqcand
  df_segundo <- df_get_segundo()
  df_segundo <- select(df_segundo, pvap, vap, nm, sqcand)
  df_segundo['pvap'] <- gsub(',', '.', df_segundo$pvap)
  df_segundo['pvap'] <- sapply(df_segundo$pvap, as.numeric)
   
  # Permanecer datasets em csv
  get_result(df_geral, df_primeiro, df_segundo)
  write_csv(df_geral, 'data/df_geral.csv')
  write_csv(df_primeiro,'data/df_primeiro.csv')
  write_csv(df_segundo,'data/df_segundo.csv')
  
  Sys.sleep(200)
} # Fim While  

