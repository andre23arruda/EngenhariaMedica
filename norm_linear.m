function c_norm = norm_linear(c)

% FUNÇÃO QUE REALIZA A NORMALIZAÇÃO LINEAR DAS CARACTERISTICAS DAS CLASSES

% INPUTS: 
%	- c: célula {1xL}, L é o número de classes
%	- c{1} (LxN), L: caracteristicas x N: padroes

% OUTPUTS:	
%		c_norm: celula com as caracteristicas normalizadas


	n_classes = length(c); % numero de classes
	n_caracteristicas = size(c{1},1); % numero de caracteristicas
	vetorzao = []; % iniciando um vetor nulo que vai receber os dados de todas as classes combinadas
	
	for i = 1:n_classes % percorrendo de 1 até o numero de classes
		vetorzao = [vetorzao;c{i}]; % combinando todas as classes para normalizar os dados
	end
	
	for i = 1:n_classes % percorrendo de 1 até o numero de classes
		n_padroes = size(c{i},2); % verificando o numero de padroes da classes analisada no momento
		c_norm{i} =  c{i} - repmat((mean(vetorzao,2)./(std(vetorzao,2))),1,n_padroes);
		% c_normalizado = c - media/desvio
	end
	
end
