function [autovalor, autovetor, nova_matriz, EQM] = PCA(matriz,m)

    [L,N] = size(matriz); % dimensoes da matriz de dados (L caracteristicas x N padroes)
    
    matriz_correlacao = (matriz*matriz')* (1/N); % gerando a matriz de correlacao

    [autovetor,autovalor] = eig(matriz_correlacao); % autovalor e autovetor

    autovalor = sum(autovalor);  % apenas diagonal
    
    carac_desejadas = autovalor(end:end-m:-1);
    
    nova_matriz = matriz' * autovetor(:,end:-1:end-m+1); % projetando a matriz no novo espaco

    EQM = (sum(carac_desejadas))/(sum(autovalor));

end
