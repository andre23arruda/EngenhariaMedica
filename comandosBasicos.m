%% 1 - Área de trabalho do Matlab ---------------------------------
% A área de trabalho do Matlab ou do Octave consiste em:
% - Editor: Onde você escreve seu script
% - Command Window: Onde você programa em tempo real, testa funções, usa como calculadora, brinca, o que quiser
% - Workspace: Onde aparece o nome, valor e tipo das variáveis. A área que eu mais gosto, pois prefiro programar em tempo real e ver o que está acontecendo ao decorrer do programa
% - Janela de arquivos: Onde você pode visualizar quais arquivos estão contudos na sua pasta atual
% - Histórico: Onde você visualiza seus comandos anteriores
% - Se quiser, personalize do seu jeito, tente deixar o mais fácil para você utilizar. Eu gosto da janela da seguinte maneira:
%% ---------------------------------------------------------------

%% 2 - Comandos básicos -------------------------------------
%clear, close, help, tipos de variáveis: single,
%double, int8, uint8, int16, uint16, int32, uint32, int64, uint64
clear all; % Limpa todas as variáveis
clear; % Limpa todas as variáveis
close all; % Fecha todas as figuras;
clc; % Limpa sua janela de comando
% No octave podemos usar Ctrl + L para limpar a janela de comandos ambém
x = single(12348); % Declarando uma variável do tipo single
y = double(123548); % Declarando uma variável do tipo double
z = int16(123); % Declarando uma variável do tipo int de 16 bits.
% Teste double, int8, uint8, int16, uint16, int32, uint32, int64, uint64
whos x; % Com o comando whos, podemos obter informações sobre uma variável
whos y;
whos z;

% HELP
% Mas é muita coisa, onde posso encontrar informação sobre uma função ou comando?
% O HELP do MATLAB e do OCTAVE é repleto de informações.
% Se quiser informação de algo escreva doc "nome da função"
% EX:
doc mean; % Verificando informação sobre a função que retorna a média dos dados
% Ou voce pode ir no canto superior direito e procirar o que deseja. Eu prefiro desse jeito.
% Então é algo muito fácil, vamos lá?
%% -------------------------------------------------------------------

%% 3 - Operações ---------------------------------------------------
% Nesses programas é muito fácil realizar uma operação
% Você já pode testar na sua janela de comando:
1 + 1
% Se colocar sem ponto e vírgula, a próxima linha retornará o resultado da operação
1 + 1
2
% Se colocar ponto e vírgula no fim, o resultado não será exibido e estará guardado em uma variável denominada ans
1 + 1;
% No seu workspace aparecerá uma variável chamada ans
% Digite ans na sua janela de comando:
ans
2
% Entendeu?
% Sempre que quiser conferir o valor de uma variável, pode chamá-la na janela de comando ou procurá-la no workspace
% Isso facilita muito, você vai ver.
% Agora vamos ver algumas operações
% +, -, *, /, ^, (). 
% Funções importantes: sin, sind, cos,cosd,tan,tand,abs, fix, floor, 
% ceil, round, mod, rem, sign, sqrt,nthroot, log, log2, log10, exp
clear; % Limpando para deixar visualmente bonito
clc; % Lipando a janela de comandos para deixar bonito

x = 12 + 5; % adição
y = 12 - 5; % subtração
z = 12 * 5; % multiplicação
w = 12/5; % divisão
w1 = 5\12; % outra divisao
a = 12^2; % elevado ao quadrado
b = 12^3; % elevado ao cubo
a1 = 12^0.5; % raiz quadrada
c = 1 + 2*(5+3); % prioridade
% Aquela prioridade de sempre, parenteses primeiro, multiplicação e divisão, adição e subtração
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
%% ------------------------------------------------------------------------------

%% 4 - Números aleatórios: rand, randi, randn ----------------------------------------
% É possível gerar valores aleatórios de forma rápida também
% Valores aleatórios são bom para testes
clear; % Acho que já percebeu que sempre vou utilizar o comando clear para iniciar algo novo né?
% Sugiro que faça o mesmo para ficar mais fácil de enxegar as variáveis criadas
% Ah é, esqueci. Por enquanto, rode tudo na janela de comandos.
% Mais para frente utilizaremos o Editor (onde fazemos nossos scripts)
% Mas se já sabe usar o Editor, tudo bem. Vamos continuar

x = rand; % numero aleatorio entre 0 e 1
z = randi([0 100]); % numero aleatorio entre 0 e 100
y = randi([-100,100]); % numero aleatório entre -100 e 100
y1 = randi([-100,100],1,5); % vetor com 5 numeros aleatório entre 100 e -100
y2 = randi([-100,100],5,5); % matriz 5x5 com numeros aleatório entre 100 e -100
y3 = randn(5); % matriz 5x5 com numeros aleatorios normalmente distribuidos
%% ------------------------------------------------------------------------------------

%% 5 - Vetores e matrizes (Array) ------------------------------------------------------
% Acho que essa é parte que me fez enxergar o mundo de outra forma
% Antes eu achava muito custoso calcular algum valor referente a uma matriz
% Agora é rápido e fácil.
% O que é um vetor? Um conjunto de dados de uma dimensão, ou linha ou coluna.
% O que é uma matriz? De forma básica é um conjunto de vetores.
% Vamos visualizar isso?

clear;
vetor = [1,2,3,4]; % criando um vetor
tamanho_vetor = length(vetor); % tamanho do vetor
vetor1 = 1:4; % forma diferente de criar vetor
vetor3 = 1:0.5:4; % espaçado em 0.5 cada elemento
v1_vetor = vetor(1); % podemos declarar um vetor igual a outro
v3_vetor1 = vetor1(3); % igual ao elemento de terceira posicao do vetor
v8_vetor2 = vetor2(8); % igual ao elemento de oitava posicao do vetor
% Ah é, aqui a indexação começa com 1. Ou seja, a primeira posição de um vetor é 1, o que faz mais sentido na cabeça de algumas pessoas ;)
% outra forma de criar vetor de forma fácil
vetor = linspace(1,4,8); % vetor de 1 a 4 contendo 8 elementos

matriz = [1:4;1:4]; % matriz com 4 elementos em cada linha
[M,N] = size(matriz); % verificando o numero de linhas e colunas da matriz
% OBS: para criarmos um vetor, basta separar por virgula cada coluna
% para criar uma matriz devemos separar as linhas com ponto e virgula
% no caso [1,2;4,5] temos na primeira linha: 1 e 2; e na segunda linha: 4 e 5.
L = size(matriz,1); % tamanho da matriz na primeira dimensao: numero de linhas
C = size(matriz,2); % tamanho da matriz na segunda dimensão: numero de colunas
matriz2 = [vetor1;vetor2]; % podemos criar uma matriz concatenando dois vetores, basta colocar ponto e virgula
% OBS: a dimensão dos vetores deve ser a mesma
% outra forma de criar uma matriz:
coluna1 = [1;2;3];
coluna2 = [4;7;9];
colunas = [coluna1,coluna2];
% O que acha que aconteceria se colocasse ponto e virgula? Faz o teste
m_transposto = matriz'; % matriz transposta
% A indexação no matlab é muito facil, basta chamar uma matriz e pedir uma linha e uma coluna
%EX: matriz(1,3) -> Nesse caso estamos acessando a linha 1 e coluna 3
elemento13_matriz = matriz(1,3); % linha 1 e coluna 3
elemento22_matriz = matriz(2,2); % linha 2 e coluna 2
matriz(1,1) = 0; % podemos tambem acessar uma posicao e igualar a um valor. Nesse caso, linha 1 coluna 1 recebe 0
% Podemos também acessar todos os elementos de uma dimensao de uma só vez, através de dois pontos ":"
% Exemplo: quero acessar a primeira todas as colunas na primeira linha da matriz -> matriz(1,:)
% Exemplo: Agora quero acessar a todas as linhas da primeira coluna da matriz -> matriz(:,1)
matriz(1,:); % visualizar todos os valores que estão na primeira linha da matriz
matriz(:,1); % visualizar todos os valores que estão na primeira coluna da matriz
matriz(:,1) = 0; % Todos os elementos da primeira coluna recebem 0
matriz(:,:) = 1; % a matriz inteira recebe 1
% as vezes é necessário iniciar uma matriz ou um vetor com zeros ou uns. Ex: para somar algo dentro de um loop
% Temos entao o comando zeros e ones
matriz_de_1 = ones(5,5); % criando uma matriz de UM com 5 linhas e 5 colunas
vetor_de_0 = zeros(1,5); % criando um vetor de ZERO com 5 elementos
matriz_de_0 = zeros(5,5); % criando uma matriz de ZERO com 5 linhas e 5 colunas

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

% Com o que vimos até agora, vou sugerir alguns exercicios na própria linha de comando
% Para aquecer: 
% montar uma matriz 10x10 de valores aleatórios
% acessar o elemento da quinta linha e quinta coluna
% trocar o valor da primeira linha inteira para 0
% transpor a matriz

% Agora valendo:
% 1 - Criar um vetor de 1 a 100
% 2 - Subtrair todos os elementos por 5
% 3 - Cirar uma matriz com duas linhas, na qual suas linhas são iguais ao vetor do item 2. Consegue?
% 4 - Criar uma matriz com 5 colunas, na qual suas colunas são iguais ao vetor do item 2. Consegue?
% 5 - Mudar os valores das bordas da matriz do item 4 para 0. Consegue?
% 6 - Gerar uma matriz 100x100 de numeros aleatorios e bla bla bla
% Por enquanto é só. Se quiser, pode procurar mais sobre as funções utilizadas até agora.


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
% que merda é essa de .* ?
% Isso se chama array operator.
% Com isso podemos fazer operações com cada elemento da matriz. Agiliza muito os calculos.
% Imagina que voce deseja multiplicar apenas os valores do vetor [1,2,3] pelo vetor [6,4,9]
% Entao fazemos: [1,2,3].*[6,4,9]
% Esse ponto significa que está sendo feita a operação em cada valor da matriz ou vetor
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
x_maior_5; % Para visualizar os valores obtidos, são zeros e uns. 
% O que isso significa? Significa que 0 é falso (numeros que não são maiores que 5) e 1 é verdadeiro (numeros que são maiores que 5)
% E se eu quiser guardar os numeros que são maiores que 5 desse vetor?
y = x(x_maior_5); % Ou seja, gaurdar os valores de x onde x é maior que 5, entendeu?

% Comandos importantes
resposta1 = any(x>5); % Existe algum valor maior que 5? Se sim, retorna 1 ou true. Senão, retorna 0 ou false
resposta2 = any(x<0); % Existe algum valor maior que 5? Se sim, retorna 1 ou true. Senão, retorna 0 ou false
resposta3 = all(x == 5); % Todos os valores são iguais a 5? Se sim, retorna 1 ou true. Senão, retorna 0 ou false
resposta4 = find(x>5); % O comando find retorna as posições. Nesse caso, retorna as posições dos valores maiores que 5. Ah é, e diferentes de 0
% Se x fosse um matriz
x = [1,2,3;1,2,3;1,2,3];
[linha1,coluna1] = find(x == 1); % Vai retorna linha e coluna dos valores iguais a 1
% Explore mais o comando find no help.

%% 8 - Operadores lógicos
% Outro tópico importantissimo. Os operadores lógicos sãos os famosos E e OU
% E (AND) retorna verdadeiro apenas quando as todas as entradas são verdadeiras
% OU (OR) retorna verdadeiro quando pelo menos uma das entradas é verdadeira
clear;
x = 1:50;
y = x(x>10 & x<50); % & = E     guardando os valores onde x é maior que 10 e menor que 50, ou seja, de 11 até 49
z = x(x<0 | x<20); % | = OU

%% 9 - Programação básica ----------------------------------------------------
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

% O que mais gosta nesse tipo de linguagem (se é que posso dizer linguagem) é a forma de indexação de vetores e matrizes
% No caso x = 1:10
% Eu posso usar x(x>5) para acessar os valores maiores que 5
% Justamente porque x>5 são valores lógicos true e false
% Então é algo que acho facil observar


%% Acho que antes de começar a falar de programação com condicional e loops,
% vou falar sobre celulas e structs
% Células:
% Já pensou em um tipo de variavel que consegue armazenar em um campo uma string,
% em outro uma matriz, em outro um vetor, em outro um caracter?
% Aqui temos a célula
x = {1};
% A célula é indicada por chaves
% nesse caso criamos uma celula chamada x que possui em sua primeira posicao o valor 1
% podemos fazer o seguinte:
x{2} = 'jwnlfn';
% Consegue visualizar?
% colocamos na segunda posicao da celula uma string, incrivel né?
% E mais, podemos usar a célula como uma matriz de dados
x{2,2} = 0;
% Mas e a posicao {2,1}?
% Facil, foi adicionado um espaço vazio
% Se voce quiser, pode até adiocionar uma celula dentro de outra celula
% testa aí, fica a vonts
% Voce tem que explorar, usar a criatividade. Pensa assim: será que posso fazer tal coisa?

% Bora lá, em celula tem outro ponto importante. 
% Podemos acessar os dados através de parenteses, mas agora é mais fundo
clear;
x = {1,2};
x{1};
x{2};
x(1);
x{1} = [];
% Apagou o dado? mas liberou o espaço?
x(1) = [];
% E agora?
% Então, quando queiramos apagar o campo de uma celula, acessamos por parenteses

%% Agora bora para struct
% Esse é massa, pq é tipo fazer um banco de dados
% É easy, confia em mim
x = struct('hue',[1,2,3]);
% Aqui iniciamos a struct
% podemos saber o nome dos campos com:
fieldnames(x);
% se quiser, pode guardar isso numa variavel. 
% essa variavel será uma celula :O
campos = fieldnames(x);
% Agora, se quiser adicionar outro campo, basta fazer assim:
x.hue2 = 0;
% bem facil né
% Podemos trabalhar com celulas e matrizes dentro de structs
x.matriz = [1,2;2,2];
x.celula = {1,2,3,'jwofh'};

% Um atalho no teclado que indico é a tecla F9
% Com esse atalho vc pode selecionar parte do script e executar
% vai acelerar bastante seu trabalho

% Podemos trabalhar com vetor de structs:
x(5).celula = 'wwoggw';
x;
whos x;
type x;

%% Bora começar a programar? Fazer o MATLAB fazer coisa que até Zeus duvida
% explicar rapidamente o if else e o switch
% if else: Condição para fazer uma tarefa
x = [0,1,2,3];
if x(1) == 2
  disp('XXT quem é sabe');
else
  disp('Voce nao é XXT');
end
% Aqui nao usamos chaves para fechar o if, basta usar end
% aconselho deixar identaod (com espaço) para ficar mais elegante
% Entendeu o uso do if else né?

%% Bora acrescentar um and e um or para ficar mais bolado
% AND
clear;
x = [0,1,2,3];
if x(1) == 2 && x(2) == 2
  disp('XXT quem é sabe');
else
  disp('Voce nao é XXT');
end

% OR
clear;
x = [0,1,2,3];
if x(1) == 2 || x(2) == 1
  disp('XXT quem é sabe');
else
  disp('Voce nao é XXT');
end

% Um outro if, consegue entender?
clear;
x = [2,2,2,3];
if x(1:3) == 2
  disp('XXT quem é sabe');
else
  disp('Voce nao é XXT');
end

% Switch case muito louco
x = input('Entre com um numero de 1 a 5: ');
switch x
  case 1
    disp('Voce é legal');
  case 2
    disp('Voce é XXT');
  case 3
		disp('Vc é mucho loko');
	case 4
		disp('UAU');
	case 5
		disp('HUE');
end

%% Switch é bem facil né?

%% Agora que já foi explicado o condicional if else e switch, vamos começar o loop
% Loop nada é mais é do que a repetição de uma ação. O número de repetições é de acordo com seu loop
% Temos dois tipos de loop: for e while
% A sintaxe do for é fácil:
%	for i = 1:10
%	end
% Esse loop significa que i está indo de 1 até 10 ao passo de 1
% 1:10 o padrão é incrementar de 1 em 1
% Teste o seguinte comando:
	for i = 1:10
		disp(i);
	end
% Nesse comando é mostrado os valores de i em cada repetição
% Podemos fazer dessa forma também:
	for i = 1:0.5:10
		disp(i);
	end
% Agora temos o passo de 0.5 (retiramos o padrão de incremento que era de 1 em 1)
% Vamos pensar no seguinte caso:
% Temos um vetor de 10 posicões:
vetor = [1,2,3,4,5,6,7,8,9,10];
% Quero exibir os valores maiores que 5, um de cada vez.
% Como faremos?
% Temos que guardar os elementos maiores que 5
vetormaiorque5 = vetor(vetor>5));
% Agora temos que saber o tamanho desse vetor
nMaiorque5 = numel(vetormaiorque5);
% OU
nMaiorque5 = length(vetormaiorque5);
% OU
nMaiorque5 = size(vetormaiorque5,2);
% Agora vamos exibir na tela um elemento de cada vez
for i = 1:nMaiorque5
	disp(vetormaiorque5(i));
end
% Fácil de entender né?
% Já sabemos que existe uma função chamada sum que soma os elementos de um vetor,mas vamos fazer uma soma do vetor só para exercitar.
% Primeiro vamos limpar a área de trabalho e a janela de comandos
clear all;
clc;
% Vamos criar o seguinte vetor
vetor = [1,5,3,7];
% Vamos calcular a soma dos elementos vetor através de um for
soma = 0; % incializando a variavel que vai guardar a soma do vetor
for i = 1:numel(vetor) 
	soma = soma + vetor(i); % o que é isso? soma está recebendo a adição entre o ultimo valor de soma e o elemento do vetor na posição i
	% Na primeira repetição temos: 0+1
	% Na segunda: 1+5
	% Na terceira: 6+3
	% Na quarta: 9+7
	% E acabou
end
% Deu para entender?
% Vamos fazer a soma dos elementos de uma matriz agora?
matriz = [1,2,3;7,8,9];
% Para fazer essa soma, precisamos saber o numero de linhas e o numero de colunas da matriz
[nLinhas,nColunas] = size(matriz);
somaMatriz = 0; % iniciando a variavel que vai guardar o valor da soma dos elementos da matriz
for i = 1:nLinhas % indo da linha 1 até o numero total de linhas
	for j = 1:nColunas % indo da coluna 1 até o numero total de colunas
		somaMatriz = somaMatriz + matriz(i,j);
	end
end
% Pronto, só isso
% Parece mágica, mas é só exercitar e vai resolver uma tarefa facinho.

%% O outro loop citado é o while
% Qual a diferença dele para o for?
% O while funciona mais como um loop dentro de um if
% O comando vai repetir enquanto não sair da condição
% Vamos fazer um exemplo
i = 0; % iniciando i = 0
while i < 10 % enquanto i for menor que 10, repete o comando que vem a seguir
	disp(i); % mostra o valor de i na tela
	i = i + 1; % incrementa o valor de i em 1. Entao quando i for igual a 10, vai sair do loop
end
% Esse foi fácil né? Vamos pensar em algo mais bolado
i = 0; % iniciando i igual a zero
while true % enquanto for verdade a vida, pois a vida é linda
	disp('Estou aprendendo muito') % Exiba na tela essa ilusão kkkkk
	if i = 10 % mas, porém, contudo, no entanto, todavia se i for igual a 10, saia dessa ilusão
		break; % o break te faz sair da ilusão, ele quebra o true dali de cima e sai do loop imediatamente
	end
	i = i + 1; % se o loop não for quebrado, incrementa 1 em i. Ou seja, depois de incrementar 10 vezes, o loop será quebrado
end
% Massa né?














