function [U,S,V,novo] = svd_projecao(matriz,m)

    %INPUTS:
    %   - matriz = matriz LxN
    %   - m = numero de caracteristicas desejadas

    %OUTPUTS:
    %   - U = matriz de vetores ortonormais
    %   - S = raiz quadrada dos autovalores
    %   - V = autovetores normalizados
    
    [U,S,V] = svd(matriz);
		novo = (matriz' * U(:,end:-1:end-m+1))';
    
end    
