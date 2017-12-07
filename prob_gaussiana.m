function [P,classe] = prob_gaussiana(x, vetores_media, matrizes,prior)
    
% INPUTS:
%       - x = valor do padrão
%       - vetores: conjunto de vetores de medias das classes
%       - matrizes: conjunto de matrizes de covariancias das classes
%       - prior: conjunto de priors de cada classe

    M = size(matrizes,3); % numero de classes
    L = size(matrizes,1); % numero de caracteristicas
    P = zeros(1,M);
    for i = 1:M
        p1 = 1/(sqrt(((2*pi)^L)*det(matrizes(:,:,i))));
        p2 = exp(-0.5 * (x - vetores_media(:,i))' * (inv(matrizes(:,:,i))) * (x - vetores_media(:,i)));
        P(i) = prior(i)*p1*p2;
    end
    classe = find(P == max(P));

end
