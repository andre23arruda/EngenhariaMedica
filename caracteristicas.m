function [caracteristicas] = caracteristicas(sinal,fa,bandas)

pkg load signal %Utilizar se for OCTAVE

% FUNCAO PARA CALCULAR AS CARACTERISTICAS DO SINAL
% INPUTS
%   	sinal: Sinal (N x A: numero de padões por amostras) para ser calculado as caracterisiticas
%	fa: frequencia de amostragem do sinal
%	bandas: intervalos de frequencia para calcula da potencia normalizada em bandas

%OUTPUTS
%	caracteristicas: matriz que possui as caracteristicas do sinal no tempo e na frequencia
%     	media0, media_retificada, variancia0, media1, variancia1, media2, variancia2, mobilidade, complexidade
%	potencia_normalizada, frequencia_central, P_frequencia_central, ILB, frequencia_margem

  for i=1:size(sinal,1); % percorrendo todos os padões do sinal e achando as caracteristicas de cada um
	  
% ------------------ WELCH para calcular PSD e frequencia do sinal ------------------
	
	[Pot, f] = espectro_WELCH(sinal(i,:),fa);
	
% ------------------- CALCULO DAS CARACTERISTICAS ---------------------

	caracteristicas(i,1) = mean(sinal(i,:)); 				% media0
	caracteristicas(i,2) = var(sinal(i,:));				   	% variancia0
	variancia1 = var(diff(sinal(i,:))); 					% variancia1
	variancia2 = var(diff(diff(sinal(i,:)))); 	    			% variancia2
	caracteristicas(i,3) = (variancia1)/(caracteristicas(i,2)); 		% mobilidade
	caracteristicas(i,4) = sqrt((variancia2/variancia1) - (variancia1/caracteristicas(i,2))); % complexidade
			
	for j = 1:size(bandas,1) %Calculando as potencias espectrais normalizadas nas bandas desejadas
      		intervalo = (f>=bandas(j,1) & f<=bandas(j,2));
      		potencia_banda = sum(Pot(intervalo));
      		caracteristicas(i,4+j) = potencia_banda/sum(Pot);
    	end
		
	caracteristicas(i,5+j) = (sum(f.*Pot))/(sum(Pot)); 				   % frequencia central do espectro
    	caracteristicas(i,6+j) = sqrt((sum(((f-caracteristicas(i,5+j)).^2).*Pot))/sum(Pot)); % ILB
    
    	indice_fm = 0;
    	k = 0;
    	while (indice_fm <0.9) % frequencia de margem, necessario um loop para encontrar o valor de frequencia de margem
      		k = k+1;
      		indice_fm = sum(Pot(1:k))/sum(Pot);
    	end
    	caracteristicas(i,7+j) = f(k);
  end
  
  caracteristicas = caracteristicas'; % fazendo a transposta para ficar no padrão L x N (caracteristicas por padroes)
	
end
