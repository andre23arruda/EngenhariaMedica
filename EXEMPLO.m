%% EXEMPLO FUNCOES

load aula12_eeg.mat; % carregando arquivo.
%dentro dele tem ESTAGIOS E SINAL
% Vamos utilizar essas duas variaveis para encontrar caracteristicas

%% Calculando caracteristicas:
for i = 1:2
  [classes1{i}] = caracteristicas(SINAL(ESTAGIOS == i,:),100,[0.5,2.5]); % encontrando caracteristicas de cada classe
end

%% Removendo outliers
classes2 = RemocaoOutliers(classes1); 

%% Normalização
classes3 = norm_linear(classes2); 


nome_caracteristicas = {'media','variancia','mobilidade','complexidade','P1',...
						'Fc','ILB','Fm'}; % CELULA DE NOME DAS CARACTERISTICAS PARA FICAR BONITO NA HORA DE PLOTAR A ROC

%% Calculando FDR e ROC para cada caracteristica
for i = 1:size(classes3{1},1) % percorrendo de 1 até o numero de caracteristicas
  fdr(i) = FDR(classes3{1}(i,:),classes3{2}(i,:));
  AUC(i) = ROC(classes3{1}(i,:),classes3{2}(i,:),nome_caracteristicas{i},1);
end
