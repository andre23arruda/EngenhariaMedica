function [P3,P4_P3] = probabilidade_bayes3(P1,P3_P1,P4_P2)
% Inputs:
% P1 = Probabilidade 1
% P3_P1 = Probabilidade dentro de P1
% P4_P2 = Probabilidade dentro de P2 (No qual P2 é o oposto de P1)

% Outputs:
% P3 = Probabilidade de ocorrer P3 
% P$_P3 = Probabilidade de ocorrer P4 dentro de P3

% Exemplo:
% Imagine uma prova na sala de aula. Metade sabe fazer a questão e acerta
% metada não sabe e chuta. P1 = Probabilidade de fazer a questão. P2 = 
% Probabilidade de chutar a questão. P3_P1 = probabilidade de acertar dado
% que fez a questão. P4_P2 = Probabilidade de acertar a questão dados que
% chutou. P3 = Probabilidade de algumém acertar a questão. P4_P3 =
% probabilidade de ter chutado a questão dado que acertou. 

P2 = 1-P1;

P3 = P4_P2*P2 + P3_P1*P1;
P4_P3 = P4_P2*P2/P3;

end