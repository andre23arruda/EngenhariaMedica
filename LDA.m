function [d_M,classe_M, d_E, classe_E,] = LDA(covariancia,vetores_media,padrao)

% Autor: Andre Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaca
% Pode me seguir no instagram.
% Sou novo no github, nao me julgue.
% Grato :D

% FUNCAO DE CLASSIFICACAO ATRAVES DE MINIMA DISTANCIA: EUCLIDIANA E MAHALANOBIS

% INPUTS:
%     covariancia: matriz de covariancia entre as classes (matriz de covariancia são iguais)
%     vetores_media: conjunto de vetores das medias das caracteristicas das classes
%     padrao: padrao que deseja ser classificado
%     
% OUTPUTS:
%     d_E: distancias euclidiana entre o padrao e as classes
%     d_M: distancias de mahalanobis entre o padrao e as classes
%     classe_E: classificacao do padrao de acordo com a minima distancia euclidiana
%     classe_M: classificacao do padrao de acordo com a minima distancia de mahalanobis
   
    M = size(vetores_media,2); % L = caracteristicas, M = classes
    matriz_padrao = repmat(padrao,1,M); % criando uma matriz com os valores das caracteristicas do padrao para facilitar o calculo na linha abaixo
    d_E = sqrt(sum(((matriz_padrao - vetores_media).^2))); % Encontrando todas as distâncias euclidianas
    d_M = zeros(1,M); % Iniciando as distâncias de mahalanobis
    for i = 1:M
        d_M(i) = sqrt((padrao - vetores_media(:,i))'*(inv(covariancia))*(padrao - vetores_media(:,i))); % Encontrando a distância de mahalanobis para cada classe
    end
    
    classe_E = find(d_E == min(d_E)); % menor distancia euclidiana (classifica em uma classe a partir da menor distancia euclidiana)
    classe_M = find(d_M == min(d_M)); % menor distancia mahalanobis (classifica em uma classe a partir da menor distancia mahalanobis)
    
end
 
