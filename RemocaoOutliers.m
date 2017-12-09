function [caracteristicas]=remocaooutliers(classes)
% Remove outliers de um conjunto de valores utilizando como limiar um numero
% p de desvios padroes em relacao a mediana.

%INPUT:
% 	classes = celula de classes

%OUTPUTS:
%		caracteristicas: celula de classes com caracteristicas sem outliers

	p=3;
	n_classes = length(classes);
	for j = 1:n_classes
		caracteristicas{j} = classes{j};
		vetor = [];
		for i = 1:size(classes{j},2)
			sup=find(classes{j}(:,i)>(median(classes{j}(:,i))+ p*std(classes{j}(:,i))));
			inf=find(classes{j}(:,i)<(median(classes{j}(:,i))- p*std(classes{j}(:,i))));
			indexes=union(sup,inf);
			vetor = union(vetor,indexes);
		end
		caracteristicas{j}(vetor,:) = [];
	end


end
