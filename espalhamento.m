function [matriz_Sw,matriz_Sb] = espalhamento(classes)

% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D

%FUNCAO PARA CALCULAR AS MATRIZES Sw E Sb DE ESPALHAMENTO

%INPUTS:
%	- classes: celula {1xC}, na qual C eh o numero de classes.
%	- classes{1} eh uma matriz (LxN), L eh o numero de caracteristicas e N o numero de padroes
%	- n: numero de caracteristicas combinadas

%OUTPUTS: matrizes de espalhamento	
%	- matriz_Sw
%	- matriz_Sb

    	P=cellfun(@(x)size(x,2),classes); %Verificando o numero de padroes em cada classe
    	P=P./sum(P); %Probabilidade do padrao se encontrar em sua classe
	dados = [];
	
	matriz_media = [];	
	for i = 1:n_classes
		matriz_cov = cov(classes{i}',1); % matriz de covariancia normalizada das caracteristicas de cada classe
		Sw(:,:,i) = P(i) * matriz_cov; % calculando Sw de cada classe para depois fazer o somatorio
		dados = [dados,classes{i}]; % montando o conjunto de todas as classes
	end
	matriz_Sw = sum(Sw,3); % somatorio das matrizes de covariancia para obter a matriz Sw
        matriz_Sm = cov(dados',1); % matriz_Sm é a covariancia de todas as classes
        matriz_Sb = matriz_Sm - matriz_Sw;

end
