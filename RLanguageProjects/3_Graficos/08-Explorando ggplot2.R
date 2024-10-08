# ggplot2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap04")
getwd()

# Um sistema gráfico completo, alternativo ao sistema básico de gráficos do R.
# Oferece mais opções de modificação, legendas prontas e formatação mais sólida.

# https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# Instalando e carregando o pacote
install.packages("ggplot2")
library(ggplot2)

# Plotando um gráfico básico com qplot()
data(tips, package = 'reshape2')
View(tips)
qplot(total_bill, tip, data = tips, geom = "point") #scatterplot


# Camada 1
camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = sex),#aes define a estetica - escala
  data = tips,
  size = 3
)
ggplot() + camada1 #chamando a função ggplot, o nome do pacote é ggplot2!

?aes #mapeamento de estética/escala
??aes # com 2 pontos busca mais coisa que com 1 ponto de ?

# Contruindo um modelo de regressão
modelo_base <- lm(tip ~ total_bill, data = tips) # (x) variavel preditora total_bill ; (Y) variavel alvo tips
modelo_fit <- data.frame(
  total_bill = tips$total_bill, 
  predict(modelo_base, interval = "confidence")
)

head(modelo_fit) # apresenta o modelo o conjunto de dados


# Camada 2
camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit),
  data = modelo_fit, #colocou o modelo na camada 2, linha de regressão
  color = "darkred"
)
ggplot() + camada1 + camada2


# Camada 3 #ribbon faixa cinza pro intervalo de confianca
camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.3
)
ggplot() + camada1 + camada2 + camada3


# Versão final otimizada # juntando as camadas que fizemos acima de maneira didatica num unico comando
# nem precisa criar o modelo! Ele cria sozinho
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')


# Gravando o gráfico em um objeto
myplot <- ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

class(myplot) # gravando o grafico numa variável
print(myplot) 


# ScatterPlot com linha de regressão

# Dados criados de maneira aleatória
data = data.frame(cond = rep(c("Obs 1", "Obs 2"), 
                           each = 10), var1 = 1:100 + 
                           rnorm(100,sd = 9), var2 = 1:100 + 
                           rnorm(100,sd = 16))


# Plot que ja cria a linha de regressão, que nada mais é que um modelo preditivo
ggplot(data, aes(x = var1, y = var2)) +    
  geom_point(shape = 1) +  
  geom_smooth(method = lm , color = "red", se = FALSE)  

?lm

# Bar Plot

# Dados
data = data.frame(grupo = c("A ","B ","C ","D ") , 
                  valor = c(33,62,56,67) , 
                  num_obs = c(100,500,459,342))
 
# Gerando a massa de dados
data$right = cumsum(data$num_obs) + 30 * c(0:(nrow(data)-1))
data$left = data$right - data$num_obs 
 
# Plot
ggplot(data, aes(ymin = 0)) + 
    geom_rect(aes(xmin = left, xmax = right, 
                  ymax = valor, colour = grupo, fill = grupo)) +
                  xlab("Número de Observações") + ylab("Valor") #lab = label dos eixos
  
 

# Usando mtcars

head(mtcars)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point() #geom point grafico de disperssão


# Outro aspecto que pode ser mapeado nesse gráfico é a cor dos pontos
ggplot(data = mtcars, 
       aes(x = disp, y = mpg, 
           colour = as.factor(am))) + geom_point() #converte a variável am, para o tipo fator


# No entanto, tambem podemos mapear uma variável contínua à cor dos pontos:
View(mtcars)
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl)) + geom_point()


# Também podemos mapear o tamanho dos pontos à uma variável de interesse:
# A legenda é inserida no gráfico automaticamente
# size = wt muda o tamnho dospontos no graf
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) + geom_point()


# Os geoms definem qual forma geométrica será utilizada para a visualização dos dados no gráfico. 
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + geom_boxplot()


# Histogramas
ggplot(mtcars, aes(x = mpg), binwidth = 30) + geom_histogram()


# Gráfico de Barras
ggplot(mtcars, aes(x = as.factor(cyl))) + geom_bar()


# Personalizando os gráficos
colors()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, 
                   colour = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, 
                   fill = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, 
       aes(x = as.factor(cyl), y = mpg)) + 
  geom_boxplot(color = "blue", fill = "seagreen4")


# Podemos alterar os eixos
ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() + 
  xlab("Milhas por galão") + ylab("Frequência")


# Legendas
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")

# Trocando a posição da legenda
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl") +
  theme(legend.position = "top")


# Sem legenda
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  # guides(fill = FALSE)
  guides(fill = "none")


# Facets
ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) + 
  geom_point() + 
  facet_grid(am~.) #~relaciona a variavel am com todas as outras

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() + 
  facet_grid(.~am)


# Plots diferentes juntos (diferente de Facet)
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)
 
# Dataset diamonds
data(diamonds)


# Histograma como plot1
plot1 <- qplot(price, data = diamonds, binwidth = 1000)
 
# ScatterPlot como plot2
plot2 <- qplot(carat, price, data = diamonds, colour = cut)
 
# Combina os 2 plots na mesma área
grid.arrange(plot1, plot2, ncol = 1)


# Gráficos de Densidade - Muito legal!!

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) + 
    geom_density(adjust = 1.5)
 
ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) + 
    geom_density(adjust = 1.5 , alpha = 0.2)
 
ggplot(data = diamonds,aes(x = price, group = cut, fill = cut)) + 
    geom_density(adjust = 1.5, position = "fill")


# Facets com reshape
install.packages("reshape2")
install.packages("plotly") #plotly publica online, pago mas legal
library(reshape2)
library(plotly)

sp <- ggplot(tips, aes(x = total_bill, y = tip/total_bill)) + geom_point(shape = 1)
sp + facet_grid(sex ~ .)
ggplotly()
sp + facet_grid(. ~ sex)
ggplotly()
sp + facet_wrap( ~ day, ncol = 2)
ggplotly() #cria o grafico interativo que pode ser publicado online


ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~manufacturer)
ggplotly()
