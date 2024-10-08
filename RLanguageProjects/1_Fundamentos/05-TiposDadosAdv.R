# Tipos Avançados de Dados em R

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/DSAdriveC/LiguagemR/Cap02")
getwd()

# Vetor: possui 1 dimensão e 1 tipo de dado, uma lista

vetor1 <- c(1:20) # funçao c cria lista range de 1 a 20
vetor1
length(vetor1)
mode(vetor1) # padrao: numeric
class(vetor1) # integer
typeof(vetor1) # integer


# Matriz: possui 2 dimensões e 1 tipo de dado  
# Para representar uma planilha excel

matriz1 <- matrix(1:20, nrow = 2)
matriz1
length(matriz1)
mode(matriz1)
class(matriz1) # padrao: matrix, array 2 dimensoes
typeof(matriz1)


# Array: possui 2 ou mais dimensões e 1 tipo de dado 

array1 <- array(1:5, dim = c(3,3,3)) 
array1
length(array1)
mode(array1)
class(array1)
typeof(array1)


# Data Frames: dados de diferentes tipos
# Maneira mais fácil de explicar data frames: é uma matriz com diferentes tipos de dados

View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)


# Listas: coleção de diferentes objetos
# Diferentes tipos de dados são possíveis e comuns

lista1 <- list(a = matriz1, b = vetor1)
lista1
length(lista1) #2 elementos
mode(lista1)
class(lista1)
typeof(lista1)


# Funções também são vistas como objetos em R

func1 <- function(x) {
  var1 <- x * x
  return(var1)
}

func1(5)
class(func1)


# Removendo objetos # mas a vassourinha limpou 
objects()
rm(array1, func1)
objects()




