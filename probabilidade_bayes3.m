function [P3,P4_P3] = probabilidade_bayes3(P1,P3_P1,P4_P2)
% Inputs:
% P1 = Probabilidade 1
% P3_P1 = Probabilidade dentro de P1
% P4_P2 = Probabilidade dentro de P2 (No qual P2 � o oposto de P1)

% Outputs:
% P3 = Probabilidade de ocorrer P3 
% P$_P3 = Probabilidade de ocorrer P4 dentro de P3

% Exemplo:
% Imagine uma prova na sala de aula. Metade sabe fazer a quest�o e acerta
% metada n�o sabe e chuta. P1 = Probabilidade de fazer a quest�o. P2 = 
% Probabilidade de chutar a quest�o. P3_P1 = probabilidade de acertar dado
% que fez a quest�o. P4_P2 = Probabilidade de acertar a quest�o dados que
% chutou. P3 = Probabilidade de algum�m acertar a quest�o. P4_P3 =
% probabilidade de ter chutado a quest�o dado que acertou. 

P2 = 1-P1;

P3 = P4_P2*P2 + P3_P1*P1;
P4_P3 = P4_P2*P2/P3;

end