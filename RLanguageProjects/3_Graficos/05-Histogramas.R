# Histogramas 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap04")
getwd()

# Definindo os dados
?cars
View(cars)
dados = cars$speed # extraindo a variavel speed do dataset pra construir o histograma

# Construindo um histograma - contagem de frequencia
?hist
hist(dados)

# define o tamanho da caixa de distribuição no grafico
# Conforme consta no help, o parâmetro breaks pode ser um dos itens abaixo:
# Um vetor para os pontos de quebra entre as células do histograma
# Uma função para calcular o vetor de breakpoints
# Um único número que representa o número de células para o histograma
# Uma cadeia de caracteres que nomeia um algoritmo para calcular o número de células 
# Uma função para calcular o número de células.
hist(dados, breaks = 10, main = "Histograma das Velocidades") # 10 faixas de frequencia = 10 breaks
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades")


# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados)) # cria dist normal usando eixo X como parâmetro
yaxis = yaxis*diff(grafico$mids)*length(dados)
#calcula a diferneca entre os eixos x e Y

lines(xaxis, yaxis, col = "red") # representa a linha da normal



