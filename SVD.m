function [U,S,V] = SVD(matriz)

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
    %   - novo = matriz com as caracteristicas principais
    
    [L,N] = size(matriz); % dimensoes da matriz de dados (L caracteristicas x N padroes)
    correlacao = (matriz'*matriz);
    [V,autovalor] = eig(correlacao);
    S = autovalor.^0.5; % S é composta pela raiz quadrada dos autovalores
    U = (matriz*V)*inv(S);
    
end    
