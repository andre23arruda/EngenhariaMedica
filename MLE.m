function [media,covariancia,cov_media] =  MLE(matriz)

% FUNCAO PARA CALCULAR MLE (MAXIMUM LIKELIHOOD ESTIMATION)
% Estimar os parâmetros (média e covariância) da classe. Para isso você deverá usar o método de maximum likelihood aplicado aos
% dados de treinamento. 

% INPUTS:
%   - matriz de dados (características por padrões    L x N) 

% OUTPUTS:
%   - estimativas da média e da covariância da distribuição de probabilidade associada aos dados.

    N = size(matriz,2); % numero de padroes
    media = mean(matriz,2); 
    covariancia = zeros(1,N);
    for i = 1:N
        covariancia(:,:,i) = (matriz(:,i) - media)' * (matriz(:,i) - media);
    end
    cov_media = mean(covariancia);
    
end
