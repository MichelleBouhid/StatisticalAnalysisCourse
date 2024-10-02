# Tipos Básicos de Dados em R

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/DSAdriveC/LiguagemR/Cap02")
getwd()

# Numeric - Todos os números criados em R são do modo numeric
# São armazenados como números decimais (double)
num1 <- 7
num1
class(num1)
mode(num1) #mode de armazenamento
typeof(num1) #double - numero decimal padrão de armazenamento

num2 = 16.82
num2
mode(num2)
typeof(num2)


# Integer 
# Convertemos tipos numeric para integer
is.integer(num2) #pergunta pro interpretador se a var2 é inteiro
y = as.integer(num2)
y
class(y)
mode(y)
typeof(y)

as.integer('3.17') #string, mesmo assim converteu
as.integer("Joe") #string não conseguiu converter - NA
as.integer('Joe')
as.integer(TRUE) # valor booleano
as.integer(FALSE)
as.integer('TRUE') #atenção: virou string com aspas


# Character ou string
char1 = 'A'
char1
mode(char1)
typeof(char1)

char2 = "cientista"
char2
mode(char2)
typeof(char2)

char3 = c("Data", "Scicence", "Academy") # mesmo sendo uma lista armazena como character
char3
mode(char3)
typeof(char3)


# Complex
compl = 2.5 + 4i
compl
mode(compl)
typeof(compl)

sqrt(-1) 
sqrt(-1+0i)
sqrt(as.complex(-1)) 


# Logic 
# Com ; cria as 2 variaveis ao mesmo tempo
x = 1; y = 2 
z = x > y # z recebo o resultado se x>y , tipo logical
z
class(z)

u = TRUE; v = FALSE #tipo logical
class(u)
u & v
u | v   
!u


# Operações com 0
5/0 #infinito
0/5

# Erro
'Joe'/5 #string não pode dividir

