function [Pot_Espectro, freq] = espectro_WELCH(sinal,fa)
		
% Autor: André Luiz Costa de Arruda
% Se utilizar para algum trabalho, me cite. Eu vou ficar feliz.
% Se quiser, manda uma mensagem no face, whats ou fumaça
% Pode me seguir no instagram.
% Sou novo no github, não me julgue.
% Grato :D

  % FUNCAO PARA CALCULAR O ESPECTRO DO SINAL ATRAVES DE PWELCH
  
  % INPUTS:
  %   - sinal: sinal no dominio do tempo
  %   - fa: frequencia de amostragem do sinal
  
  %OUTPUTS:
  %   - Pot_Espectro: Potencia do espectro do sinal
  %   - freq: vetor de frequencia do espectro
  
  pkg load signal; % Utilizar se for Octave
  
    [Pot_Espectro, freq] = pwelch(sinal,1024,0.5, length(sinal),fa);

  end
