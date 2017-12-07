function erro = erro_LS(dados,classes,w)

% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D

% INPUTS:
%   - dados: matriz com todos as classes juntas (por favor, junte as classes em uma matriz)
%   - classes: dados previamente classificados para verificarmos o erro de LS
%   - w: vetor w que classifca os dados

    y = [dados;ones(1,length(dados))]; % colocando o um depois da ultima caracteristica em todos os padrões
    pk = sign(w'*y); % verificando o sinal de cada padrão classificado com LS. 1 = classe1, -1 = classe2
    erro = (sum(pk ~= classes))/length(classes); % verificando o numero de erros
    
end
