function [ordem] = SelecaoEscalar (matriz_correlacao, criterio_selecao,peso)

% FUNÇÃO PARA CALCULAR A SELECAO ESCALAR DE CARACTERISTICAS
% ORDENA AS MELHORES CARACTERISTICAS

% INPUTS:
%	- matriz_correlacao: matriz de correlacao entre as caracteristicas das classes
% 	- criterio de selecao: criterio adotado (ROC ou FDR)
%	- peso: vetor com valores de peso para o criterio de selecao e para a correlacao

% OUTPUTS:
%	- ordem: vetor de caracteristicas ordenadas

	x = find(criterio_selecao == max(criterio_selecao));
	ordem = x;
	pearson = zeros(1,length(criterio_selecao));

	for i = 2:length(criterio_selecao)
		matriz = matriz_correlacao(x,:);
		pearson = [pearson;matriz];
		tamanho = size(pearson,1) - 1;
		calculo = 1:length(criterio_selecao);
		calculo(2,:) = (peso(1)*criterio_selecao) - ((peso(2)/tamanho)*(sum(abs(pearson))));
		calculo(:,ordem) = [];
		next_ordem = find(calculo(2,:) == max(calculo(2,:)));
		x = calculo(1,next_ordem);
		ordem = [ordem,x];
	end
end
