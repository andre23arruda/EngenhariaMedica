function [autovalor, autovetor, nova_matriz, EQM] = PCA(matriz,m)

    [L,N] = size(matriz); % dimensoes da matriz de dados (L caracteristicas x N padroes)
    matriz = matriz - repmat(mean(matriz,2),1,N); % subtraindo todos os valores pelas medias das caracteristicas
    matriz_correlacao = matriz*matriz'; % gerando a matriz de correlacao

    [autovetor,autovalor] = eig(matriz_correlacao); % autovalor e autovetor

    autovalor1(:,1) = autovalor(autovalor~=0);  % apenas diagonal
    autovalor1(:,2) = 1:length(autovalor1(:,1)); % atribuindo uma ordem de 1 até o tamanho do vetor de autovalores
    autovalor1 = flipud(sortrows(autovalor1,1)); % ordenando 

    carac_desejadas = autovalor1(1:m,2);
    nova_matriz = matriz' * autovetor(:,carac_desejadas); % gerando a matriz apenas com as caracteristicas desejadas

    EQM = (sum(autovalor1(m+1:end,1)))/(sum(autovalor1(:,1)));

end
