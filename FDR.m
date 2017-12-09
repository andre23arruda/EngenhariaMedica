function fdr = FDR(vet1,vet2)

%FUNCAO PARA CALCULAR O CRITERIO DE SELECAO FDR

% INPUTS:
%	  vet1: matriz (LxN), L: numero de caracteristicas e C: numero de padroes
%		vet2: matriz (LxN), L: numero de caracteristicas e C: numero de padroes

%OUTPUT:
%	fdr: vetor com os valores FDR para cada caracteristica
	
	
	for i = 1:size(vet1,2)
		fdr(i) = ((mean(vet1(:,i)) - mean(vet2(:,i)))^2)/(var(vet1(:,i)) + var(vet2(:,i)));
	end
end
