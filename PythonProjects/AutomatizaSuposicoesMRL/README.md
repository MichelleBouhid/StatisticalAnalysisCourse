# Projeto: Inferência sobre os Fatores que Influenciam na Taxa de Ocupação de Residências usando Regressão Linear

O objetivo deste projeto é responder à seguinte pergunta: **Quais fatores mais influenciam na taxa de ocupação de residências?**

## Objetivo Final

Ao final, vamos checar e automatizar as validações das suposições do MRL: linearidade, independência, homocedasticidade, normalidade dos erros, e multicolinearidade.

## Descrição do Projeto

Este projeto traz um extenso e detalhado trabalho de modelagem estatística e demonstra na prática como validar as suposições para a regressão linear, como interpretar os resultados, as decisões que devem ser tomadas durante o processo de análise e como automatizar algumas tarefas. Ele aborda na prática todo o processo de ciência de dados, com ênfase na modelagem estatística.

Trabalharemos com dados reais disponíveis publicamente sobre atributos de residências de uma cidade norte-americana. Passaremos por todo o processo de ciência de dados, com ênfase na modelagem estatística e diversas técnicas de análise e interpretação serão usadas. Por fim, criaremos funções em Python para automatizar a validação das suposições da regressão linear.

## Sobre a Regressão Linear

A regressão linear é um método estatístico usado para modelar a relação linear entre uma variável dependente e uma ou mais variáveis independentes. Para usar a regressão linear de forma eficaz, certas suposições devem ser satisfeitas sobre os dados e o modelo que está sendo usado.

### Suposições da Regressão Linear

1. **Linearidade:** A relação entre a variável dependente e as variáveis independentes é linear.
2. **Independência dos Erros:** Os erros (resíduos) são independentes entre si e não estão correlacionados com as variáveis independentes.
3. **Homocedasticidade:** A variância dos erros é constante em todas as variáveis independentes.
4. **Normalidade:** Os erros são normalmente distribuídos.
5. **Não Multicolinearidade:** As variáveis independentes não são altamente correlacionadas umas com as outras.

É importante verificar se essas suposições são satisfeitas antes de usar um modelo de regressão linear, pois a violação dessas suposições pode levar a resultados incorretos ou tendenciosos.

## Automação das Validações

Vamos automatizar essas validações através de testes com funções Python.
Resumo dos Resultados das Técnicas de Validação
1. Linearidade
Teste: Gráficos de dispersão e teste linear_rainbow.
Explicação:
Gráficos de Dispersão: Visualização da relação entre a variável dependente 
𝑌
Y e as variáveis independentes 
𝑋
X para verificar a linearidade.
Teste linear_rainbow: Verifica a linearidade da regressão usando uma divisão dos dados em segmentos e testando a variação dos resíduos.
Interpretação:
p-valor < 0.05: Rejeitamos a hipótese nula de linearidade. A relação pode não ser linear.
p-valor >= 0.05: Falhamos em rejeitar a hipótese nula de linearidade. A relação provavelmente é linear.
2. Independência dos Erros
Teste: Teste de Durbin-Watson.
Explicação:
Teste de Durbin-Watson: Verifica a presença de autocorrelação nos resíduos da regressão. Valores próximos de 2 indicam independência dos erros.
Interpretação:
0 < d < 1.5: Evidência de autocorrelação positiva nos erros. Suposição não satisfeita.
1.5 <= d <= 2.5: Não há evidência de autocorrelação. Suposição satisfeita.
2.5 < d < 4: Evidência de autocorrelação negativa nos erros. Suposição não satisfeita.
3. Homocedasticidade
Teste: Teste de Goldfeld-Quandt ou teste de Breusch-Pagan.
Explicação:
Teste de Goldfeld-Quandt: Divide os dados em dois grupos e compara a variância dos resíduos para verificar homocedasticidade.
Teste de Breusch-Pagan: Avalia se a variância dos resíduos é constante usando uma regressão auxiliar.
Interpretação:
p-valor < 0.05: Rejeitamos a hipótese nula de homocedasticidade. A variância dos erros não é constante.
p-valor >= 0.05: Falhamos em rejeitar a hipótese nula de homocedasticidade. A variância dos erros é constante.
4. Normalidade dos Erros
Teste: Histogramas, QQ plots, e teste de Shapiro-Wilk.
Explicação:
Histograma: Visualização da distribuição dos resíduos.
QQ Plot: Compara os quantis dos resíduos com os quantis de uma distribuição normal.
Teste de Shapiro-Wilk: Teste estatístico que verifica se os resíduos seguem uma distribuição normal.
Interpretação:
p-valor < 0.05: Rejeitamos a hipótese nula de normalidade. Os resíduos não seguem uma distribuição normal.
p-valor >= 0.05: Falhamos em rejeitar a hipótese nula de normalidade. Os resíduos seguem uma distribuição normal.
5. Ausência de Multicolinearidade
Teste: Fator de Inflação da Variância (VIF).
Explicação:
VIF: Mede quanto a variância de um coeficiente de regressão é inflada devido à correlação entre as variáveis independentes.
Interpretação:
VIF = 1: Não há correlação entre a variável independente e as outras variáveis independentes.
1 < VIF < 5: Correlação moderada, geralmente aceitável.
VIF > 5: Correlação alta, pode indicar multicolinearidade.
VIF > 10: Correlação muito alta, indica problemas sérios de multicolinearidade.
