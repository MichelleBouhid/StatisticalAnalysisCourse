# Remodelagem de Dados com tidyr 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap07")
getwd()


# Instalando os pacotes
# install.packages("tidyr")
library(tidyr)
library(ggplot2)

# Dados de notas em disciplinas
# o dataframe foi construindo de uma maneira que confunde oq são as variaveis
# são 3, nota , regiao, nome da disciplina
dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84), #regiao A e B representam a mesma variavel
  Regiao_B = c(86, 90, 91)
)
dados

#extrai regiao e nota final em 2 colunas separadas
# tem que separar a variaveis e colocas cada uma em uma coluna diferente
dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B)


# Criando dados
set.seed(10) #para reprozir os mesmos exemplos
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4), #gerando valores aleatorios de uma dist uniforme
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

df2

# Reshape 1
df2_organizado1 <- df2 %>%
  gather(key, time, -id, -acao) # pega todas as colunas, menos(-) a col id e a coluna acao

df2_organizado1 %>% head(8)

# Reshape 2
df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c("localidade", "tempo"), sep = "\\.") 

df2_organizado2 %>% head(8)

# Mais um exemplo
set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"), 
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15), 
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

print(df3)

# Reshape dos dados
df3 %>%
  gather(day, score, c(day1score, day2score)) #separou dayscore em 2 colunas


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  spread(day, score) #voltou ao original, opostp do gather


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  unite(infoAgain, group, gender)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) + 
  geom_point() + 
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)















