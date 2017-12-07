function vetor = FDA(Sw,Sb)

% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D


% FUNÇÃO PARA CALCULAR FDA A PARTIR DAS MATRIZES DE ESPALHAMENTO SW E SB
% INPUTS:
%   - Sw: matriz Sw
%   - Sb: matriz Sb

% OUTPUTS:
%   - vetor: vetor FDA que classifica os dados

    d = inv(Sw) * (Sb); 
    [autovetor,autovalor] = eig(d); % diagonalizando matriz
    autovalor = round(autovalor,5); % arredonando os valores para nao pegar quem é muito proximo de zero
    pos = (sum(autovalor)) ~=0; % encontrando quem é diferente de zero
    vetor = autovetor(:,pos); % autovetores selecionados (que possuem autovalor diferente de zero)
    
end
