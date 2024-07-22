## Descrição Geral

Os notebooks neste repositório são divididos em três partes principais:

1. **Parte 1: Decomposição de Séries Temporais**
2. **Parte 2: Estacionaridade**
3. **Parte 3: Técnicas para Tratar a Estacionaridade**

Cada notebook inclui exemplos práticos e código comentado para facilitar a compreensão dos conceitos.

## Detalhes dos Notebooks

### 1. ASTLab1Parte1Decomposicao_MichelleBouhid.ipynb

**Título:** Decomposição de Séries Temporais

**Conteúdo:**
- **Introdução à Decomposição de Séries Temporais:** 
  - Explicação dos conceitos básicos de séries temporais.
  - Definição de decomposição aditiva e multiplicativa.
- **Decomposição Aditiva:**
  - Aplicação prática da decomposição aditiva usando a biblioteca `statsmodels`.
  - Análise dos componentes de tendência, sazonalidade e ruído.
- **Decomposição Multiplicativa:**
  - Aplicação prática da decomposição multiplicativa usando `statsmodels`.
  - Análise comparativa dos componentes.
- **Visualização dos Componentes:**
  - Uso de `matplotlib` para plotar os componentes de tendência, sazonalidade e ruído.
- **Conclusão:**
  - Discussão sobre as diferenças entre decomposição aditiva e multiplicativa.
  - Interpretação dos resultados obtidos.

### 2. ASTLab1Parte2Estacionaridade_MichelleBouhid.ipynb

**Título:** Análise de Estacionaridade em Séries Temporais

**Conteúdo:**
- **Introdução à Estacionaridade:**
  - Definição de estacionaridade em séries temporais.
  - Importância da estacionaridade para modelagem de séries temporais.
- **Testes de Estacionaridade:**
  - Explicação dos testes de Dickey-Fuller aumentado (ADF) e KPSS.
  - Aplicação prática do teste ADF usando `statsmodels`.
  - Aplicação prática do teste KPSS usando `statsmodels`.
- **Análise dos Resultados:**
  - Interpretação dos resultados dos testes de estacionaridade.
  - Discussão sobre como determinar se uma série temporal é estacionária.
- **Exemplos Práticos:**
  - Análise de séries temporais reais para verificar a estacionaridade.
  - Uso de `pandas` e `numpy` para manipulação de dados.

### 3. ASTLab1Parte3EstacionaridadeTecnicas_MichelleBouhid.ipynb

**Título:** Técnicas para Tratar a Estacionaridade em Séries Temporais

**Conteúdo:**
- **Introdução às Técnicas de Transformação:**
  - Importância de transformar séries temporais não estacionárias.
  - Descrição das técnicas de diferenciação e transformação de log.
- **Diferenciação de Séries Temporais:**
  - Explicação da técnica de diferenciação.
  - Aplicação prática da diferenciação usando `pandas`.
  - Análise dos resultados e visualização da série diferenciada.
- **Transformação Logarítmica:**
  - Explicação da técnica de transformação de log.
  - Aplicação prática da transformação de log usando `numpy`.
  - Análise dos resultados e visualização da série transformada.
- **Combinação de Técnicas:**
  - Aplicação combinada de diferenciação e transformação de log para estabilizar a variância e remover tendência.
  - Análise comparativa dos resultados.
- **Conclusão:**
  - Discussão sobre a eficácia das técnicas de transformação.
  - Interpretação dos resultados obtidos.

## Requisitos

Para executar os notebooks, você precisará dos seguintes pacotes Python:

- numpy
- pandas
- matplotlib
- statsmodels
- seaborn
- jupyter




