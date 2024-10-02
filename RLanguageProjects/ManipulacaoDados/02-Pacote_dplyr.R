# Limpeza, Formatação e Manipulação de Dados em R  
# dplyr - Transformação de Dados

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap07")
getwd()


# Instalando os pacotes, eles usam SQL mas ndetro do R
# install.packages("readr")
# install.packages("dplyr")
library(readr)
library(dplyr)


# Carregando o dataset
sono_df <- read_csv("sono.csv")
View(sono_df)
head(sono_df) # importa no formato tibble, usando read_csv
class(sono_df) #tabela df => tbl
str(sono_df)


# Função glimpse() pode ser usada no lugar da função str()
# usando a familia R, o DF tem um formato diferente como tbl df
glimpse(sono_df)


# Aplicando mutate
# Não cria a coluna chamada peso_libras, mas permite visualização
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))


# Contagem e histograma
count(sono_df, cidade)
hist(sono_df$sono_total)


# Amostragem
sample_n(sono_df, size = 10)


# select()
sleepData <- select(sono_df, nome, sono_total) #selecionou e colocou no objeto sleepData
head(sleepData)
class(sleepData)
select(sono_df, nome)
select(sono_df, nome:cidade) #range de colunas de nome a cidade
select(sono_df, nome:pais)


# filter()
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >= 80)
filter(sono_df, cidade %in% c("Recife", "Curitiba")) #operador in
# %in% - retorna na coluna cidade onde os valores forem REcife e Curitiba

# arrange()
sono_df %>% arrange(cidade) %>% head #operador de concatenação
# Concatenou arrange com head, usando o operador %>%

sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  head

sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% #organiza pela cidade e sono total
  filter(sono_total >= 16)

sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>% # em ordem decrescente
  filter(sono_total >= 16)


# mutate() criou a coluna em tempo de execução, não mudou o sono_df
head(sono_df)
sono_df %>% 
  mutate(novo_indice = sono_total / peso) %>%
  head

head(sono_df)


sono_df %>% 
  mutate(novo_indice = sono_total / peso, 
         peso_libras = peso / 0.45359237) %>%
  head
# Obs não altera o Df original, se achar que vale a pena tem que criar a variavel

# summarize()
# mas primeiro calcula a media, grava na variavel media_sono
sono_df %>% 
  summarise(media_sono = mean(sono_total))

sono_df %>% 
  summarise(media_sono = mean(sono_total), 
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())


# group_by()
# mesmo resumo, mas agrupado por cidade
sono_df %>% 
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total), 
            min_sono = min(sono_total), 
            max_sono = max(sono_total),
            total = n())


# Operador: %>%
head(select(sono_df, nome, sono_total))

sono_df %>% 
  select(nome, sono_total) %>% 
  head
# mesmo comando, usando o operador de concatenação e escrevendo a fç

sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>% # função dentro de função
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)


sono_df
View(sono_df) # fez todas as operações e não mudou o df original


# Se quiser criar outro objeto e salvar as operações, ex sono_df2
sono_df2 <- sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

View(sono_df2)



