function [J1,J2,J3,combinacao,matriz_Sw,matriz_Sb,matriz_Sm] = espalhamento_2(classes,n)

% Autor: Andre Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaca
% Pode me seguir no instagram.
% Sou novo no github, nao me julgue.
% Grato :D

%FUNCAO PARA CALCULAR AS MATRIZES Sw E Sb DE ESPALHAMENTO

pkg load statistics

%INPUTS:
%	- classes: celula {1xC}, na qual C eh o numero de classes.
%	- classes{1} eh uma matriz (LxN), L eh o numero de caracteristicas e N o numero de padroes
%	- n: numero de caracteristicas combinadas

%OUTPUTS: matrizes de espalhamento
%	- J1
%	- J2
%	- J3
%	- combinacao
%	- matriz_Sw
%	- matriz_Sb
%	- matriz_Sm

	n_classes = length(classes); %numero de classes
	L = size(classes{1},1); %numero de caracteristicas
	
	if nargin < 2 % se o numero de argumentos de entrada for menor que 2, o numero de caracteristicas combinadas será o numero total de caracteristicas
		n = L;
	end
	
	combinacao = combnk(1:L,n); % matriz de combinacao de caracteristicas
	n_combinacao = size(combinacao,1);% numero de combinacoes

    	P=cellfun(@(x)size(x,2),classes); % Verificando o numero de padroes em cada classe
    	P=P./sum(P); % Probabilidade do padrao se encontrar em sua classe
	dados = [];
	
	for j = 1:n_combinacao
		for i = 1:n_classes
			matriz_cov = cov(classes{i}(combinacao(j,:),:)',1); % matriz de covariancia normalizada das caracteristicas combinadas de cada classe
			Sw(:,:,i) = P(i) * matriz_cov; % calculando Sw de cada classe para depois fazer o somatorio
			dados = [dados,classes{i}]; % montando o conjunto de todas as classes
		end
		matriz_Sw{j} = sum(Sw,3); % somatorio das matrizes de covariancia para obter a matriz Sw
		matriz_Sm{j} = cov(dados(combinacao(j,:),:)',1); % matriz_Sm eh a covariancia de todas as classes
		matriz_Sb{j} = matriz_Sm{j} - matriz_Sw{j}; % matriz_Sb = matriz_Sm - matriz_Sw
		
		J1(j) = (trace(matriz_Sm{j}))/(trace(matriz_Sw{j}));
		J2(j) = (det(matriz_Sm{j}))/(det(matriz_Sw{j}));
		J3(j) = (1/n)*(trace((inv(matriz_Sw{j}))*matriz_Sm{j}));
	end

end
