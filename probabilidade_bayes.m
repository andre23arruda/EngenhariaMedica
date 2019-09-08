function [P2,P20,P1_P2,P1_20] = probabilidade_bayes(P1,P2_P1)
% Inputs:
% Outputs:
P10 = 1-P1;
P20_P1 = 1-P2_P1;

P2 = P2_P1*P1 + P20_P1*P10;
P20 = P20_P1*P1 + P2_P1*P10;

P1_P2 = P2_P1*P1/P2;
P1_20 = P20_P1*P1/P20;



end