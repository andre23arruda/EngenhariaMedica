function [U,S,V,matriz_nova] = SVD(matriz,m,dimensao)

    %INPUTS:
    %   - matriz = matriz LxN
    %   - m = numero de caracteristicas desejadas
    %   - dimensao = reduzir em qual dimensao

    %OUTPUTS:
    %   - U = matriz de vetores ortonormais
    %   - S = raiz quadrada dos autovalores
    %   - V = autovetores normalizados
    %   - matriz_nova = matriz com as caracteristicas principais
    
    
    if nar
    
    
    
    N = size(matriz,2); % dimensoes da matriz de dados (L caracteristicas x N padroes)
    matriz1 = matriz - repmat(mean(matriz,2),1,N); % subtraindo todos os valores pelas medias das caracteristicas para normalizar
    d = matriz1'*matriz1; % gerando a matriz de correlacao
    [V,autovalor] = eig(d);
    S = autovalor.^0.5;
    U = (matriz*V)*inv(S);
    S1(:,1) = S(S~=0);
    S1(:,2) = 1:length(S1(:,:,1));
    
    carac_desejadas = S1(end):-1:S1(end-m+1);   % tentando encontrar as caracteristicas desejadas através de um jeito mais facil, pegando as ultimas n-m+1 posições
    matriz_nova = matriz(carac_desejadas,:);
    
end    
