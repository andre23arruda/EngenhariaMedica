function fechatudo()

% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D

% Funcao criada para fechar todas as janelas existentes no universo do
% matlab. coisa chata da porra. tnc
    k = waitforbuttonpress;
    if (k ~= 0)
        close all;
    end
end
