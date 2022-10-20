
# Link antigo
#set_link1 <- 'https://resultados.tse.jus.br/oficial/ele2022/544/dados-simplificados/'
#set_link2 <-'-c0001-e000544-r.json'

# Carrega dados estados
estados <- read.table('estados.txt', sep = ';', header = T)

#

getdata_url <- function(){
  # Configura link de acesso ao TSE
  set_link1 <- 'https://resultados-sim.tse.jus.br/teste/ele2022/9722/dados-simplificados/'
  set_link2 <-'-c0001-e009722-r.json'
  
  for(uf in estados['Sigla']) {
    links <- paste(set_link1, uf, '/', uf, set_link2, sep = '')
  }
  #link 1 simulação 'https://https://resultados-sim.tse.jus.br/teste/ele2022/9724/dados-simplificados/'
  #link 2 simulação '-c0001-e009724-r.json'
  # Faz o Get dos arquivos JSON e configura dataframes
  df_geral <- data.frame()
  df_primeiro <- data.frame()
  df_segundo <- data.frame()
  for(link in links) {
    data_UF <- httr::GET(link) |> httr::content()
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
  df_list <- list(df_geral, df_primeiro, df_segundo)
  return(df_list)
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



