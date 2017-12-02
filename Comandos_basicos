%% 1 - Área de trabalho do Matlab

%% 2 - Comandos básicos: 
%clear, close, help, tipos de variáveis: single,
%double, int8, uint8, int16, uint16, int32, uint32, int64, uint64
clear;
x = single(12348);
y = double(123548);
z = int16(123);
whos x;
whos y;
whos z;


%% 3 - Operações:
% +, -, *, /, ^, (). 
% Funções importantes: sin, sind, cos,cosd,tan,tand,abs, fix, floor, 
% ceil, round, mod, rem, sign, sqrt,nthroot, log, log2, log10, exp
clear;
x = 12 +5; % adição
y = 12-5; % subtração
z = 12*5; % multiplicação
w = 12/5; % divisão
w1 = 5\12; % outra divisao
a = 12^2; % elevado ao quadrado
b = 12^3; % elevado ao cubo
c = 1 + 2*(5+3); % prioridade
d = sin(pi); seno em radianos
d = sind(90); % seno em graus
e = cos(pi); % cosseno em radianos
e = cosd(180); % cossseno em graus
t = tan(pi/4); % tangente em radianos
t = tand(45); % tangente em graus
f = round(pi); % arredondando, pode utilizar a função fix também
g = round(pi,2); % arredondando com duas casa decimais
chao = floor(pi); % aproximando para baixo
ceu = ceil(pi); % aproximando para cima
h = int8(pi); % convertendo pi para inteiro de 8 bits
i = mod(12,5); % resto da divisão
j = mod(12,4); % resto da divisão, pode utilizar o mod também
k = sign(-5000); % sinal(1 ou -1)
l = sign(-k); % sinal(1 ou -1)
m = sqrt(x); % raiz quadrada
n = nthroot(625,4); % raiz enésima
E = exp(1);   %e^1 = e;
o = log(E); % ln(e)
absoluto = abs(-5); % modulo

%% 4 - Números aleatórios: rand, randi, randn
clear;
x = rand; % numero aleatorio entre 0 e 1
z = randi([0 100]); % numero aleatorio entre 0 e 100
y = randi([100,-100]); % numero aleatório entre -100 e 100
y1 = randi([-100,100],1,5); % vetor com 5 numeros aleatório entre 100 e -100
y2 = randi([-100,100],5,5); % matriz 5x5 com numeros aleatório entre 100 e -100


%% 5 - Vetores e matrizes (Array)
clear;
vetor = [1,2,3,4]; % criando um vetor
tamanho_vetor = length(vetor); % tamanho do vetor
vetor1 = 1:4; % forma diferente de criar vetor
vetor3 = 1:0.5:4; % espaçado em 0.5 cada elemento
v1_vetor = vetor(1); % podemos declarar um vetor igual a outro
v3_vetor1 = vetor1(3); % igual ao elemento de terceira posicao do vetor
v8_vetor2 = vetor2(8); % igual ao elemento de oitava posicao do vetor
% Ah é, aqui a indexação começa com 0, o que faz mais sentido na cabeça de algumas pessoas ;)
matriz = [1:4;1:4]; % matriz com 4 elementos em cada linha
[M,N] = size(matriz); % verificando o numero de linhas e colunas da matriz
% OBS: para criarmos um vetor, basta separar por virgula cada coluna
% para criar uma matriz, para separar as linhas, bas separa por ponto e virgula
% no caso [1,2;4,5] temos na primeira linha: 1 e 2; e na segunda linha: 4 e 5.
L = size(matriz,1); % tamanho da matriz na primeira dimensao: numero de linhas
C = size(matriz,2); % tamanho da matriz na segunda dimensão: numero de colunas
matriz2 = [vetor1;vetor2]; % podemos criar uma matriz concatenando dois vetores, basta colocar ponto e virgula
% OBS: a dimensão dos vetores deve ser a mesma
% outra forma de criar uma matriz:
coluna1 = [1;2;3];
coluna2 = [4,7,9];
colunas = [coluna1,coluna2];
% O que acha que aconteceria se clocasse ponto e virgula?
m_transposto = matriz'; % matriz transposta
% A indexação no matlab é muito facil, basta chamar uma matriz e pedir uma linha e uma coluna
%EX: matriz(1,3) -> Nesse caso estamos acessando a linha 1 e coluna 3
elemento13_matriz = matriz(1,3); % linha 1 e coluna 3
elemento22_matriz = matriz(2,2); % linha 2 e coluna 2
matriz(1,1) = 0; % podemos tambem acessar uma posicao e igualar a um valor. Nesse caso, linha 1 coluna 1 recebe 0
% Podemos também acessar todos os elementos de uma dimensao de uma só vez, através de dois pontos ":"
% Exemmplo: quero acessar a primeira todas as colunas na primeira linha da matriz -> matriz(1,:)
% Exemmplo: Agora quero acessar a todas as linhas da primeira coluna da matriz -> matriz(:,1)

matriz(:,1) = 0; % Todas a linhas da primeira coluna recebem 0
matriz(:,:) = 1; % a matriz inteira recebe 1
% as vezes é necessário iniciar uma matriz ou um vetor com zeros ou uns. Ex: para somar algo dentro de um loop
% Temos entao o comando zeros e ones
matriz_de_1 = ones(5,5); % criando uma matriz de UM com 5 linhas e 5 colunas
matriz_de_0 = zeros(1,5); % criando um vetor de ZERO com 5 elementos
matriz_identidade = eye(5,5); % Para alguns cálculos de estatistica é necessário utilizar a matriz identidade. Nesse caso criamos uma matriz identidade 5x5
diagonal = diag([1 2 3]); % Criando uma matriz com os elementos na diagonal apenas
numero_elementos = numel(diagonal); % aqui encontramos o numero de elementos de uma matriz ou vetor
ultimo_elemento = diagonal(end); % aqui encontamos o ultimo elemento de uma matriz ou vetor
% Exemplo: queremos acessar a ultima linha de uma matriz
matriz = [1,2,3;4,9,8;7,6,5];
ultima_linha = matriz(end,:);
penultima_linha = matriz(end-1,:);
ultima_coluna = matriz(:,end);
penultima_coluna = matriz(:,end-1);
% Legal né?

% Com o que vimos montar uma matriz 10x10 de valores aleatórios
% acessar o elemento da quinta linha e quinta coluna
% trocar o valor da primeira linha inteira para 0
% transpor a matriz

%% 6 - Operações com Vetores e matrizes
% Esse é um topico que acho muito importante, porque as opeações com vetores e 
% matrizes facilitam muito a resolução de um problema. Aqui podemos multiplicar
%  elementos matrizes de forma facil
clear;
x = 1:50;
y = 1:2:100;
soma = x+y;
subtracao = x-y;
multiplicacao = x.*y;
divisao = x./y;
potencia = x.^2;
produto_escalar = x*y';
produto_vetorial = cross(x,y);

%% 7 - Vetores e matrizes logicas
% Outro tópico importante. Com isso, podemos acessar posições de matrizes
% sem necessitar de loops para encontrar essas posições
clear;
x = [1 2 3; 4 5 6; 7 8 9];
x_maior_5 = x>5;
% Deeem uma conferida no valor retornado, pode perceber que sua classe é logical, ou seja, logico
y = x(x_maior_5);
% Comandos importantes
resposta1 = any(x>5);
resposta2 = any(x<0);
resposta3 = all(x == 5);
resposta4 = find(x>5);
% O find retorna os valores desejados, ao inves das posicoes

%% 8 - Operadores lógicos
% Outro tópico importantissimo. Os operadores lógicos sãos os famosos E e OU
% E (AND) retorna alto apenas quando as duas entradas são altas
% OU (OR) retorna altor quando pelo menos uma das entradas é alta
clear;
x = 1:50;
y = find(x>10 & x<50);
z = find(x<0 | x<20);

%% 9 - Programação básica
% Escreva um script no editor
% Um programa para calcular area de uma circunferencia, um triangulo e um quadrado
% funções input, disp e fprintf
% Quando aprendemos c ou outras linguagens normalmente usamos o scanf como input
clear;
numero1 = input('Digite um numero:');
disp('Voce digitou:');
disp(numero1);
numero2 = input('Digite outro numero:');

%% Funções de estatistica
x = 1:10
media = mean(x);

y = repmat(x,2,1); %apenas repetindo o vetor na linha de baixo gerando uma matriz de duas linhas
media = mean(x,1); % media das linhas
media = mean(x,2); % media das colunas

mediana = median(x);
moda = mode(x);
variancia = var(x)
variancia = var(y,1)
variancia = var(y,2)
covariancia = cov(x)
correlacao = corr(x)
somatorio = sum(x)
somatorio = sum(x,1)
somatorio = sum(x,2)
produtorio = prod(x)
soma_acumulada = cumsum(x)
produto_acumulado = cumprod(x) % eu acho que existe isso

% O que mais gosta nesse tipo de linguagem é a forma de indexação de vetores e matrizes
% No caso x = 1:10
% Eu posso usar x(x>5) para acessar os valores maiores que 5
% Justamente porque x>5 são valores lógicos true e false
% Então é algo que acho facil observar

