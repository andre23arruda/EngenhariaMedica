function [carac_s_outlier] = RemocaoOutliers(carac_outlier)

% Autor: André Luiz Costa de Arruda

% Remove outliers de um conjunto de valores utilizando como limiar um numero
% p de desvios padroes em relacao a mediana.

% INPUT:
% 	- carac_outlier = celula de classes com outliers em suas caracteristicas
%	- carac_outlier{i} = matriz L (caracteristicas) x N (padrões)

% OUTPUTS:
%	- carac_s_outlier: celula das classes sem outliers em todas as cracteristicas
 	if ~iscell(carac_outlier)
    		error('Entre com uma celula');
  	else
		p = 3; % limiar em relação a mediana
		M = length(carac_outlier); % numero de classes
		L = size(carac_outlier{1},1);
		for j = 1:M % percorrendo de 1 até o numero de classes
			carac_s_outlier{j} = carac_outlier{j}; % criando a celula com as classes
			vetor = []; % vetor nulo que vai receber a posição dos outliers que serão removidos
			for i = 1:L % percorrendo de 1 até o numero de caracteristicas
				sup=find(carac_outlier{j}(i,:)>(median(carac_outlier{j}(i,:))+ p*std(carac_outlier{j}(i,:)))); % encontrando quem está acima do limiar
				inf=find(carac_outlier{j}(i,:)<(median(carac_outlier{j}(i,:))- p*std(carac_outlier{j}(i,:)))); % encontrando quem está abaixo do limiar
				indexes=union(sup,inf); % juntando quem está acima e abaixo
				vetor = union(vetor,indexes); % juntando to mundo de todas as caracteristicas (usando union para não ficar repetido)
			end
			carac_s_outlier{j}(:,vetor) = []; % removendo quem está acima e abaixo (outliers) de todas as caracteristicas
		end
	end


end
