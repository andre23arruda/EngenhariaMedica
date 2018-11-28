function fdr = FDR(vet1,vet2)

%FUNCAO PARA CALCULAR O CRITERIO DE SELECAO FDR

% INPUTS:
%	- vet1: vetor de uma caracteristica e com N padroes (1 x N)
%	- vet2: vetor de outra caracteristica e com N padroes (1 x N)

% OUTPUTs:
%	fdr: FDR calculado para a caracteristica
	
	fdr = ((mean(vet1) - mean(vet2))^2)/(var(vet1) + var(vet2));
	% formula -> FDR = (u1-u2)² / (s1² - s2²)	
end
