# Introdução simples de Machine Learning em C 

Neste projeto, foi desenvolvida uma implementação simples de uma rede neural com regressão linear, utilizando a linguagem de programação C. O objetivo desta implementação é compreender os conceitos fundamentais de redes neurais e otimização sem depender de bibliotecas ou frameworks de aprendizado de máquina prontos.

## Técnicas Utilizadas

### Regressão Linear
- A implementação é baseada no modelo de regressão linear, onde tentamos ajustar uma linha reta à relação entre uma única entrada (x) e uma única saída (y), representada por `y = x * w`.

### Gradiente Descendente
- A otimização é realizada com a técnica de gradiente descendente, que visa encontrar o valor ideal do parâmetro `w` minimizando uma função de custo. No entanto, em vez de calcular o gradiente com derivadas, a técnica da diferença finita é empregada para estimar o gradiente.
- Eu escolhi usar a diferença finita em vez de derivadas neste código porque a diferença finita é uma abordagem mais simples e flexível para calcular o gradiente da função de custo. No usei derivadas analíticas por meu código se tratar de introdução e focar em ser simples, embora menos eficiente em termos de velocidade computacional, especialmente em problemas complexos de aprendizado de máquina.

### Função de Custo
- A função de custo utilizada é uma medida de erro quadrático médio, que compara as saídas previstas com os valores reais dos dados de treinamento. O objetivo é minimizar essa função para ajustar corretamente a reta aos dados.

### Treinamento
- O treinamento é realizado por meio de iterações, onde o valor de `w` é atualizado repetidamente em direção ao mínimo da função de custo. O número de iterações é fixo em 500 neste exemplo, mas em cenários reais, critérios de parada dinâmicos seriam preferíveis.

## Resultado
Após a execução do código, o valor ótimo de `w` é obtido, ajustando a reta aos dados de treinamento. Este projeto fornece uma base sólida para compreender os princípios básicos de aprendizado de máquina e redes neurais, embora seja um exemplo extremamente simplificado para fins de aprendizado.
