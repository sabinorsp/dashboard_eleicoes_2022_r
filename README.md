# Dashboad para acompanhamento 2º Turno eleição Presidencial Brasil 2022. 
Esse projeto tem como objetivos a criação de uma aplicação web para acompanhamento das apurações do 2° turno da eleição presidencial brasileira de 2022. 
Os dados da apuração foram transmitidos via API pelo Tribunal Superior Eleitoral brasileiro.

## Versões pacotes utilizados:
- R -> Version:4.2.1;
- shinydashboard_0.7.2;
- shiny_1.7.2;
- shinythemes_1.2.0;
- dplyr_1.0.10;
- ggplot2_3.3.6;
- scales_1.2.1;
- readr_2.1.2;

## Scripts/Diretórios: 
- A aplicação Web está estruturada no pacote Shiny através dos arquivos principais ui.R e server.R.
para melhor divisão e organização as páginas e recursos de processamento para cada pagina ficam salvas nos diretórios /ui e /server. 
- O diretório /data contém os arquivos em permanencia dos datasets gerados pela script getdataTSE.R 
- O getdataTSE.R por sua vez é responsável pelo método get() na API do TSE, processamento, organização e permanencia dos dados em estrutura .csv
- O diretório /functions contém funções para plot dos gráficos e permanencia dos resultados por hora de atualização. 
- Por fim o diretório /www contém os arquivos de imagens utilizados no projeto. 

Para mais resultados e exemplos acesse: https://www.sabinorsp.com/single-project
