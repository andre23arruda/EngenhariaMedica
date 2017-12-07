function vetor = FDA(Sw,Sb)

    d = inv(Sw) * (Sb); 
    [autovetor,autovalor] = eig(d); % diagonalizando matriz
    autovalor = round(autovalor,5); % arredonando os valores para nao pegar quem é muito proximo de zero
    pos = (sum(autovalor)) ~=0; % encontrando quem é diferente de zero
    vetor = fliplr(autovetor(:,pos)); % ordenando os autovetores selecionados (que possuem autovalor diferente de zero)
    
end
