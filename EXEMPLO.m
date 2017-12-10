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

%% Normalizacao
classes3 = norm_linear(classes2); 


nome_caracteristicas = {'media','variancia','mobilidade','complexidade','P1',...
						'Fc','ILB','Fm'}; % CELULA DE NOME DAS CARACTERISTICAS PARA FICAR BONITO NA HORA DE PLOTAR A ROC

%% Calculando FDR e ROC para cada caracteristica
for i = 1:size(classes3{1},1) % percorrendo de 1 até o numero de caracteristicas
  fdr(i) = FDR(classes3{1}(i,:),classes3{2}(i,:));
  AUC(i) = ROC(classes3{1}(i,:),classes3{2}(i,:),nome_caracteristicas{i},1);
end

% Calculando a matriz de correlacao das caracteristicas de todas as classes
correlacao = corr([classes3{1},classes3{2}]');

%% Selecao escalar
[ordemFDR] = SelecaoEscalar (correlacao, fdr,[0.5,0.5]); % Nao vou utilizar FDR, é só exemplo
[ordemROC] = SelecaoEscalar (correlacao, AUC,[0.5,0.5]); % Vou utilizar ROC para selecao vetorial 

%% Selecionando as caracteristicas em ordem
classes4 = {};
for i = 1:2
  classes4{i} = classes3{i}(ordemROC,:); % Selecionando as caracteristicas em ordem a partir da selecao escalar utilizando ROC
end

%%  TESTE ESPALHAMENTO. DEU CERTO :D
[J1,J2,J3,combinacao,matriz_Sw,matriz_Sb,matriz_Sm] = espalhamento_2(classes4,4); % Só para ver se a função espalhamento deu certo
[J1,J2,J3,combinacao,matriz_Sw,matriz_Sb,matriz_Sm] = espalhamento_2(classes4); % Só para ver se a função espalhamento deu certo

%% SELECAO VETORIAL
[ordem,maxcriterio]= SelecaoVetorial('forward','J1',classes3,4);


%% Selecionando as caracteristicas em ordem
classes5 = [];
for i = 1:2
  classes5{i} = classes4{i}(ordem,:); % Selecionando as caracteristicas em ordem a partir da selecao vetorial
end

%% PCA
[carac_desejadas, autovetor_ordenado, nova_matriz, EQM] = PCA(classes5,2);






