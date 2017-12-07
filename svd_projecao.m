function [U,S,V,novo] = svd_projecao(matriz,m)


% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D


    %INPUTS:
    %   - matriz = matriz LxN
    %   - m = numero de caracteristicas desejadas

    %OUTPUTS:
    %   - U = matriz de vetores ortonormais
    %   - S = raiz quadrada dos autovalores
    %   - V = autovetores normalizados
    %	- novo = matriz projetada em um novo espaco
    
 	[U,S,V] = svd(matriz);
   	novo = (matriz' * U(:,end:-1:end-m+1))';
    
end    
