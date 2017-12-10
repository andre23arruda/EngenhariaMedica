function [media,covariancia,cov_media] =  MLE(matriz)

% FUNCAO PARA CALCULAR MLE (MAXIMUM LIKELIHOOD ESTIMATION)
% Estimar os parâmetros (média e covariância) da classe. Para isso você deverá usar o método de maximum likelihood aplicado aos
% dados de treinamento. 

% INPUTS:
%   - matriz de dados (características por padrões    L x N) 

% OUTPUTS:
%   - estimativas da média e da covariância da distribuição de probabilidade associada aos dados.

    media = mean(matriz,2);
    covariancia = cov(matriz',1);
    
end
