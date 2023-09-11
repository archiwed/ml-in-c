#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Definição dos dados de treinamento
float train[][2] = {
  {0, 0},
  {1, 2},
  {2, 4},
  {3, 6},
  {4, 8},
};
#define train_count (sizeof(train) / sizeof(train[0]))

// Função para gerar números aleatórios em ponto flutuante
float rand_float(void)
{
  return (float) rand() / (float) RAND_MAX;
}

// Função de custo (ou função de perda)
float cost(float w)
{
  float result = 0.0f;
  for (size_t i = 0; i < train_count; ++i)
  {
    float x = train[i][0];
    float y = x * w;
    float d = y - train[i][1];
    result += d * d;
  }
  result /= train_count;
  return result;
}

int main(){
  // Definição da relação esperada: y = 2x
  srand(70);
  float w = rand_float() * 10.0f;
  // Taxa de aprendizado e valor de epsilon para cálculos de gradiente
  float eps = 1e-3;
  float rate = 1e-3;

  // Treinamento - Atualização de w iterativamente
  for (size_t i = 0; i < 500; ++i)
  {
    // Cálculo do gradiente usando a técnica da diferença finita
    float dcost = (cost(w + eps) - cost(w)) / eps;
    // Atualização de w usando o gradiente descendente
    w -= rate * dcost;
    printf("Custo: %f\n", cost(w));
  }
  
  printf("Valor otimizado de w: %f\n", w);

  return 0;
}

