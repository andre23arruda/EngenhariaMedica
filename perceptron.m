function [n_i, w] = perceptron(m1,m2,max_i,p)

% FUNCAO PARA CALCULAR O CLASSIFICADOR PERCEPTRON 
% O Perceptron eh um vetor W em L+1 dimensoes que atribui uma classe Pk ao padrao Xk

%INPUTS: 
%  - m1: matriz com os dados da classe 1
%  - m2: matriz com os dados da classe 2
%  - max_i: numero maximo de iteracores a serem realizadas
%  - p: parametro de aprendizado do classificador
  
%OUTPUTS:
%  - n_i: numero de iteracoes realizadas para obter a convergencia
%  - w = perceptron
  
L = size(m1,1); % numero de caracteristicas dos dados da classe 1
N1 = size(m1,2); % numero de padroes dos dados da classe 1
N2 = size(m2,2); % numero de padroes dos dados da classe 2

if(L ~= size(m2,1)) % se o numero de caracteristicas das classes for diferente
  print('Numero de caracteristicas diferentes');
else
  m1(end+1,:) = 1; % colocando 1 no vetor
  m2(end+1,:) = 1; % colocando 1 no vetor
  y = [m1,m2]; % y é a juncao das classes
  sinal = [ones(1,N1),-1*ones(1,N2)]; % identificao quem eh positivo e quem eh negativo (classe 1 ou classe 2)
  
  cont_erro = length(sinal); % Nesse momento o numero de erro eh maximo
  w = rand([1,L+1]); % criando w0 aleatorio
  cont_i = 1; % contador de iteracoes, inicia igual a 1 pois eh a primeira iteracao
  while(cont_erro > 0 || n_i < max_i) % enquanto contador de erro for maior que zero ou numero de iteracoes passar do maximo
    pk = w*y; % classificar
    pk(pk>0) = 1; % se pk maior que zero, faz parte da classe 1
    pk(pk<0) = -1; % se pk menor que zero, faz parte da classe 2
    Ye = sinal ~= pk; % Ye posicao de quem é diferente da classifcacao verdadeira
    w = w - p * sum(pk * y(Ye)); % atualizando w
    cont_erro = sum(Ye); % contador de erro eh o numero de divergencias
    n_i = n_i + 1; % contador de erro ++
  end
  
  % No caso de duas caracteristicas, vamos plotar o perceptron
  %vetor_perceptron = [w(1), -(w(1)*w(1)/w(2))];
  
  
end

