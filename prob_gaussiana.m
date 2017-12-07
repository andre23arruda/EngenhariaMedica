function [P,classe] = prob_gaussiana(x, vetores_media, matrizes,prior)
    
% INPUTS:
%       - x = valor do padrão (matriz Lx1) 
%       - vetores_media: conjunto de vetores de medias das classes
%       - matrizes: conjunto de matrizes de covariancias das classes (não esquecer que tem que ser 3 dimensões)
%       - prior: conjunto de priors de cada classe (deve ser um vetor 1xM)

    M = size(matrizes,3); % numero de classes
    L = size(matrizes,1); % numero de caracteristicas
    
    if (M ~= size(vetores_media,2) && M ~= size(prior,2))
        error('Problema no numero de classes. Verifique a 3a dimensao da matriz de covariancia');
    else
        P = zeros(1,M);
        for i = 1:M
            p1 = 1/(sqrt(((2*pi)^L)*det(matrizes(:,:,i))));
            p2 = exp(-0.5 * (x - vetores_media(:,i))' * (inv(matrizes(:,:,i))) * (x - vetores_media(:,i)));
            P(i) = prior(i)*p1*p2; % calculando a probabilidade de estar em cada classe.
        end
    end
    classe = find(P == max(P)); % encontrando a probabilidade maxima e classificando

end
