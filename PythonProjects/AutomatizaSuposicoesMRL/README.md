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
