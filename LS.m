function [w] = LS(m1,m2,a)


% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D


    % FUNCAO PARA CALCULAR O CLASSIFICADOR LS

    %INPUTS: 
    %  - m1: matriz com os dados da classe 1
    %  - m2: matriz com os dados da classe 2
    %  - a: parametro de regularizacao da inversao matricial

    %OUTPUTS:
    %  - w: pesos do classificador linear 

    L = size(m1,1); % numero de caracteristicas dos dados da classe 1
    N1 = size(m1,2); % numero de padroes dos dados da classe 1
    N2 = size(m2,2); % numero de padroes dos dados da classe 2

    if(L ~= size(m2,1)) % se o numero de caracteristicas das classes for diferente
        error('Numero de caracteristicas diferentes');
    else
        m1(end+1,:) = 1; % colocando 1 no vetor
        m2(end+1,:) = 1; % colocando 1 no vetor
        y = [m1,m2]; % y é a juncao das classes
        classes = repmat([ones(1,N1),-1*ones(1,N2)],L+1,1); % identifica quem eh positivo e quem eh negativo (classe 1 ou classe 2)

        p1 = zeros(L+1,L+1); % Iniciando p1 = matriz de zeros.              p1 = inv(sum(y*y' + aI))
        p2 = sum(classes.*y,2); % p2 = vetor y * (1 ou -1 que classifica cada classe)

        for i = 1: N1+N2 % indo de coluna em coluna de y
            p1 = p1 + (y(:,i) * y(:,i)'); % pegando cada coluna e multiplicando por seu transposto
            % o resultado de y(:,i) * y(:,i)' é uma matriz (LxL)
            % somando todas as matrizes obtidas de cada coluna
        end

        w = inv(p1 + a*eye(L+1,L+1)) * p2;  % calculando w
        
    end
end
  
