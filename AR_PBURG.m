function [DE,f] = AR_PBURG(sinal,ordem,fa)
  % FUN��O PARA CALCULAR A MODELAGEM AUTO REGRESSIVA DO SINAL ATRAV�S DE PBURG
  % INPUTS:
  %   - sinal: sinal para ser aplicada AR
  %   - ordem: ordem da AR
  %   - fa: frequencia de amostragem do sinal

  %OUTPUTS: 
  %   DE: Densidade espectral da AR
  %   f: vetor de frequencia da AR
  
  [DE,f] = pburg(sinal,ordem,2*numel(sinal),fa); %AR atrav�s de pburg
  
  end