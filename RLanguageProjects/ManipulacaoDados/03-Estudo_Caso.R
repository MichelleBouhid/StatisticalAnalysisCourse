# Estudo de Caso - Limpando, Transformando e Manipulando Dados de Voos 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap07")
getwd()


# Instalando pacote hflights (Dados de voos de Houston)
install.packages("hflights")
library(hflights)
library(dplyr)
?hflights


# Criando um objeto tbl
?tbl_df
flights <- tbl_df(hflights)
flights
View(flights)


# Resumindo os dados
str(hflights)
glimpse(hflights)


# Visualizando como dataframe
data.frame(head(flights))


# Filtrando os dados com slice
flights[1,1]
flights[flights$Month == 1 & flights$DayofMonth == 1, ]# condição para as colunas, e todas as linhas
# pode fazer o slice com um condição

# Aplicando filter
filter(flights, Month == 1, DayofMonth == 1) #pode usar o filter regra logica! e dar as condições como no slice
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA")) # valor de uniquecarrier esteja dentro dp vetor c com os valores AA ou Ua 


# Select
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay")) # pode selecionar um range de colunas
# e colunas que contem a palavra Taxi ou Delay! nem precisa saber o nome da coluna toda


# Organizando os dados
flights %>%
  select(UniqueCarrier, DepDelay) %>% #selciona 2 colunas
  arrange(DepDelay) # organiza por DepDelay

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))
head(aggregate(ArrDelay ~ Dest, flights, mean))

flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)










