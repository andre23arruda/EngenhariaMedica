function [matriz_Sw,matriz_Sb] = espalhamento(classes,n)

%FUNCAO PARA CALCULAR AS MATRIZES Sw E Sb DE ESPALHAMENTO

%INPUTS:
%		classes: celula {1xC}, na qual C eh o numero de classes.
%			classes{1} eh uma matriz (LxN), L eh o numero de caracteristicas e N o numero de padroes
%		n: numero de caracteristicas combinadas

%OUTPUTS:	


	n_classes = length(classes); %numero de classes
	L = size(classes{1},1); %numero de caracteristicas
	
    P=cellfun(@(x)size(x,2),classes); %Verificando o numero de padroes em cada classe
    P=P./sum(P); %Probabilidade do padrao se encontrar em sua classe
	
		matriz_media = [];	
		for i = 1:n_classes
			media = mean(classes{i},2); %media das caracteristicas da classe
			matriz_cov = cov(classes{i}',1); %matriz de covariancia das caracteristicas combinadas
			Sw(:,:,i) = P(i) * matriz_cov;
			matriz_media = [matriz_media,media];%obtendo a matriz de media das classes
		end
		matriz_Sw = sum(Sw,3); %somatorio das matrizes de covariancia para obter a matriz Sw
        med_geral = mean(matriz_media,2);
        for i = 1:n_classes
            Sm(:,:,i) = cov((classes{i} - repmat(med_geral,1,size(classes{i},2)))');
            Sb(:,:,i) = Sm(:,:,i) - Sw(:,:,i);
        end
		matriz_Sb = sum(Sb,3); %somatorio para obter a matriz Sb
end
