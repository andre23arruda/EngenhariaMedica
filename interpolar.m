function [sinal_interp,fa] = interpolar(sinal,frequencia)
  % FUN��O PARA INTERPLOAR UM SINAL EM DETERMINADA FREQUENCIA
  %INPUTS:
  %   - sinal: sinal para ser interpolado
  %   - frequencia: frequencia que se deseja amostrar o sinal atrav�s da interpola��o
  
  %OUTPUS:
  %   - sinal_interp: � o sinal interpolado
  %   - fa: a mesma frequencia da entrada
  
  fa = frequencia;
  tempo = cumsum(sinal); %Determinando o vetor tempo atrav�s de uma soma acumulativa
  tempo_interp = (tempo(1):1/frequencia:tempo(end)); %Determinando o tempo com frequencia de amostragem de 4Hz para realizar a interpola��o
  sinal_interp = interp1(tempo,sinal,tempo_interp,'spline'); %Interpola�ao do sinal com o tempo
  sinal_interp = sinal_interp - mean(sinal_interp); %Removendo a componente DC do sinal
  
end
