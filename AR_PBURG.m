function [DE,f] = AR_PBURG(sinal,ordem,fa)
  % FUNÇÃO PARA CALCULAR A MODELAGEM AUTO REGRESSIVA DO SINAL ATRAVÉS DE PBURG
  % INPUTS:
  %   - sinal: sinal para ser aplicada AR
  %   - ordem: ordem da AR
  %   - fa: frequencia de amostragem do sinal

  %OUTPUTS: 
  %   DE: Densidade espectral da AR
  %   f: vetor de frequencia da AR
  
  [DE,f] = pburg(sinal,ordem,2*numel(sinal),fa); %AR através de pburg
  
  end