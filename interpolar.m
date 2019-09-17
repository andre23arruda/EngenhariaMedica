function [sinal_interp,fa] = interpolar(sinal,frequencia)
  % FUNÇÃO PARA INTERPLOAR UM SINAL EM DETERMINADA FREQUENCIA
  %INPUTS:
  %   - sinal: sinal para ser interpolado
  %   - frequencia: frequencia que se deseja amostrar o sinal através da interpolação
  
  %OUTPUS:
  %   - sinal_interp: é o sinal interpolado
  %   - fa: a mesma frequencia da entrada
  
  fa = frequencia;
  tempo = cumsum(sinal); %Determinando o vetor tempo através de uma soma acumulativa
  tempo_interp = (tempo(1):1/frequencia:tempo(end)); %Determinando o tempo com frequencia de amostragem de 4Hz para realizar a interpolação
  sinal_interp = interp1(tempo,sinal,tempo_interp,'spline'); %Interpolaçao do sinal com o tempo
  sinal_interp = sinal_interp - mean(sinal_interp); %Removendo a componente DC do sinal
  
end
