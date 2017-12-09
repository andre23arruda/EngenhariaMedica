function [AUC] = ROC(classe1,classe2,caracteristicas,grafico)

% FUNCAO PARA PLOTAR A CURVA ROC E CALCULAR A AREA ABAIXO DA CURVA
% INPUTS:
%     - classe1: caracteristica da primeira classe
%     - classe2: caracteristica da segunda classe
%- caracteristicas: celula com o nome da caracteristica analisada
%     - grafico: se grafico for diferente 0, plotar o grafico

% OUTPUTS:
%     - AUC: area abaixo da curva

  if nargin <4;
    grafico = 0;
  end
  aux = 0;

  nclasse1 = numel(classe1); %numero de elementos da classe 1
  nclasse2 = numel(classe2); %numero de elementos da classe 2

  x = sortrows([classe1, classe2; ones(nclasse1,1), 2*ones(nclasse2,1)]);
  %criando um vetor com os valores da caracteristica das duas classes e um vetor que corresponde a qual classes os valores pertencem e ordenando os valores

  for i = 1:length(x) %fazendo o limiar percorrer o vetor com todos valores do vetor que possui as duas classes
    VPR(i) = sum(x(2,i:length(x)) == 2)/(nclasse2); %calculando a quantidade de VP a direita do limiar
    FPR(i) = sum(x(2,i:length(x)) == 1)/(nclasse1); %calculando a quantidade de FP a direita do limiar
  end 

  VPR(i+1) = 0; %adicionando a posição final como zero
  FPR(i+1) = 0; %adicionando a posição final como zero

  AUC = abs(sum(diff(FPR).*VPR(1:length(VPR)-1))); %calculando a area abaixo da curva atrav�s do somatorio das areas de cada retangulo da curva
  
  if AUC < 0.5 %verificacao se VPR e FPR estao invertidos
    AUC = 1-AUC; %se sim, AUC = 1-AUC
    aux = 1;
  end

  if grafico ~= 0
    figure('name',['Analise AUC ',caracteristicas]);
    plot((0:1),(0:1),'k','linewidth',2); % criando a linha que divide o grafico ao meio
    hold on;
    if aux  == 1 %verificacao se VPR e FPR estao invertidos
      plot(VPR,FPR,'linewidth',3);
      xlabel('FPR (\alpha) %');
      ylabel('VPR (1 - \beta) %');
      title(['AUC ', caracteristicas, ' = ',num2str(AUC)]);
    else
      plot(FPR,VPR,'linewidth',3);
      xlabel('FPR (\alpha) %');
      ylabel('VPR (1 - \beta) %');
      title(['AUC ', caracteristicas, ' = ',num2str(AUC)]);
    end
  end

end
