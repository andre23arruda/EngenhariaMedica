function [media,covariancia] =  MLE(matriz)

% INPUTS:

% OUTPUTS:

    M = size(matriz,2);
    media = mean(matriz,2);
    covariancia = zeros(1,M);
    for i = 1:M
        covariancia(i) = (matriz(:,i) - media)' * (matriz(:,i) - media);
    end
    covariancia = mean(covariancia);
    
end
