function erro = erro_LS(dados,classes,w)

% INPUTS:



    y = [dados;ones(1,length(dados))]; % colocando o um depois da ultima caracteristica em todos os padrões
    pk = sign(w'*y);
    erro = (sum(pk ~= classes))/length(classes);
    
end
