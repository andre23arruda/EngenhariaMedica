function [d_E,d_M,classe_E,classe_M] = LDA(covariancia,vetores_media,padrao)

% INPUTS:
%     covariancia: matriz de covariancia entre as classes
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
    d_E = sqrt(sum(((matriz_padrao - vetores_media).^2)));
    d_M = zeros(1,M);
    for i = 1:M
        d_M(i) = sqrt((padrao - vetores_media(:,i))'*(inv(covariancia))*(padrao - vetores_media(:,i)));
    end
    
    classe_E = find(d_E == min(d_E));
    classe_M = find(d_M == min(d_M));
    
end
