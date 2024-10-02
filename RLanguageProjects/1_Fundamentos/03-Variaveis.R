# Variáveis em R

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/DSAdriveC/LiguagemR/Cap02")
getwd()

# Criando Variáveis
var1 = 100
var1
mode(var1) #numeric
help("mode")
sqrt(var1)


# Podemos atribuir o valor de uma variável a outra variável
var2 = var1
var2
mode(var2) #numeric
typeof(var2)
help("typeof") #double


# Uma variável pode ser uma lista de elementos, fç 'c' cria um vetor
var3 = c("primeiro", "segundo", "terceiro")
var3
mode(var3) #character


# Uma variável pode ser uma função, chama a palavra reservada function 
# e atribui a uma variavel no caso var4
var4 = function(x) {x+3}
var4
mode(var4)


# Podemos também mudar o modo do dado
# Var1 foi criada como numerica, mas as.character, mudou o modo da variavel
# e atribuiu a var5
var5 = as.character(var1)
var5
mode(var5) #character, aparece entre aspas "100"


# Atribuindo valores a objetos por usar = ou <-, tem diferneça interna 
# A ling armazena diferente
x <- c(1,2,3)
x
x1 = c(1,2,3)
x1
c(1,2,3) -> y
y
assign("x", c(6.3,4,-2)) #sobrescreveu a variavel x
x


# Verificando o valor em uma posição específica
# Busque a variavel x que é uma (lista) e traga o 1º elemento
x[1]


# Verificar objetos
ls()
objects()


# Remover objetos
rm(x)
x

