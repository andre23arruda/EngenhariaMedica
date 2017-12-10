function [media,covariancia] =  MLE(matriz)

% INPUTS:
%   - matriz de dados (características por padrões) 

% OUTPUTS:
%   - estimativas da média e da covariância da distribuição de probabilidade associada aos dados.

    M = size(matriz,2);
    media = mean(matriz,2);
    covariancia = zeros(1,M);
    for i = 1:M
        covariancia(i) = (matriz(:,i) - media)' * (matriz(:,i) - media);
    end
    covariancia = mean(covariancia);
    
end
