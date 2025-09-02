# Trabalho de Arquitetura de Computadores - Rede Neural em Assembly

Este projeto é uma implementação de uma rede neural simples, desenvolvida como parte do trabalho da disciplina de Arquitetura de Computadores. O código foi escrito em Assembly e demonstra o funcionamento básico de um processo de aprendizado de máquina.

## Vídeo de Apresentação

Assista ao vídeo abaixo para uma explicação detalhada do projeto e do código:

[![Vídeo do Projeto](https://img.youtube.com/vi/vSkHACkFyjs/0.jpg)](https://www.youtube.com/watch?v=vSkHACkFyjs)

## Como funciona

O programa segue os seguintes passos para simular o comportamento de uma rede neural:

1.  **Inicialização de Variáveis:** Diversas variáveis são inicializadas, incluindo os pesos `P1` e `P2`, a taxa de aprendizado e a variável de erro.
2.  **Entrada de Dados:** O programa solicita que o usuário insira dois números de entrada e o valor de saída desejado.
3.  **Cálculo:** Os pesos são multiplicados e o peso total é calculado. Em seguida, o erro é calculado para determinar a diferença entre a saída atual e a saída desejada.
4.  **Ajuste dos Pesos:** Com base no erro, novos pesos são calculados para a próxima iteração.
5.  **Loop de Aprendizagem:** O processo é repetido em um loop infinito, exibindo o erro a cada iteração, até que o usuário encerre o programa.

## Estrutura do Código

O código é estruturado da seguinte forma:

* **Inicialização:** Atribuição de valores iniciais para as variáveis de peso e taxa de aprendizado.
* **Entrada do Usuário:** Captura dos números de entrada e do valor de saída desejado.
* **Cálculo da Rede Neural:** Multiplicação dos pesos, cálculo do peso total e do erro.
* **Ajuste:** Cálculo dos novos pesos com base no erro.
* **Loop:** O programa é executado em um loop para demonstrar o processo de aprendizado contínuo.
