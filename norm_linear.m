function c_norm = norm_linear(c)

%FUNÇÃO QUE REALIZA A NORMALIZAÇÃO LINEAR DAS CARACTERISTICAS DAS CLASSES

%INPUTS: 
%		c: célula {1xL}, L é o número de classes
%		c{1} (N,C), na qual N ´e o numero de padros e N o numero de caracteristicas

%OUTPUTS:	
%		c_norm: celula com as caracteristicas normalizadas


	n_classes = length(c);
	n_caracteristicas = size(c{1},2);
	vetorzao = [];
	
	for i = 1:n_classes
		vetorzao = [vetorzao;c{i}];
	end
	
	for i = 1:n_classes
		for j = 1:n_caracteristicas
			c_norm{i}(:,j) =  ((c{i}(:,j)) - mean(vetorzao(:,j)))./(std(vetorzao(:,j)));
		end
	end
	
end
