function fechatudo()
% Funcao criada para fechar todas as janelas existentes no universo do
% matlab. coisa chata da porra. tnc
    k = waitforbuttonpress;
    if (k ~= 0)
        close all;
    end
end
