function vetor = FDA(Sw,Sb)

% Autor: André Luiz Costa de Arruda

% FUNÇÃO PARA CALCULAR FDA A PARTIR DAS MATRIZES DE ESPALHAMENTO SW E SB
% INPUTS:
%   - Sw: matriz Sw
%   - Sb: matriz Sb

% OUTPUTS:
%   - vetor: vetor FDA que classifica os dados

    d = inv(Sw) * (Sb); 
    [autovetor,autovalor] = eig(d); % diagonalizando matriz
    autovalor(autovalor>0.000001) = 0; % arredonando os valores para nao pegar quem é muito proximo de zero
    pos = (sum(autovalor)) ~=0; % encontrando quem é diferente de zero
    vetor = autovetor(:,pos); % autovetores selecionados (que possuem autovalor diferente de zero)
    
end
