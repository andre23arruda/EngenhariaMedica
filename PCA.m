function [autovalor, autovetor, nova_matriz, EQM] = PCA(matriz,m)

% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D

% FUNÇÃO PARA CALCULAR O PCA
% INPUTS:
%   - matriz: matriz LxN (caracteristicas por padrao)
%   - m: numero de caracteristicas que devem ser mantidas

% OUTPUTS:
%   -

    [L,N] = size(matriz); % dimensoes da matriz de dados (L caracteristicas x N padroes)
    
    matriz_correlacao = (matriz*matriz')* (1/N); % gerando a matriz de correlacao

    [autovetor,autovalor] = eig(matriz_correlacao); % autovalor e autovetor

    autovalor = sum(autovalor);  % apenas diagonal
    
    carac_desejadas = autovalor(end:end-m:-1);
    
    nova_matriz = matriz' * autovetor(:,end:-1:end-m+1); % projetando a matriz no novo espaco, dando prioridade para as caracteristicas que possuem maior variancia
    % utilizo end, porque os autovalores vem ordenado do menor para o maior, logo, o autovetor "mais importante" é o ultimo, penultimo e assim por diante
    % multiplico entao a matriz de dados pelo autovetor ordenado do mais importante até o menos importante
    % então vou de end até end-m+1 (numero de caracteristicas desejadas no novo espaço)

    EQM = (sum(carac_desejadas))/(sum(autovalor)); % Erro quatratico medio = (autovalor das carac selecionadas)/(todos os autovalores)

end
