function [U,S,V,novo] = svd_projecao(matriz,m)


% Autor: André Luiz Costa de Arruda


    %INPUTS:
    %   - matriz = matriz LxN
    %   - m = numero de caracteristicas desejadas

    %OUTPUTS:
    %   - U = matriz de vetores ortonormais
    %   - S = raiz quadrada dos autovalores
    %   - V = autovetores normalizados
    %	- novo = matriz projetada em um novo espaco
    
 	[U,S,V] = svd(matriz);
   	novo = (matriz' * U(1:m))';
    
end    
