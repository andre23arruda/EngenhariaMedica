function [PY_X, PY_X0,PX_Y0,PX0_Y, Sensibilidade, Especificidade] = probabilidade_bayes2(dados1, dados2, condicao1)
% Inputs:
% dados1 = dados computados como teste
% dados2 = dados computados como certeza (FATO)
% condicao1 = probabilidade conhecida 

% Outputs:
% PY_X = Probabilidade Y dado X positivo
% PY_X0 = Probabilidade Y dado X negativo
% PX_Y0 = Probabilidade de X dado Y negativo
% PX0_Y = Probabilidade de X negativo dado Y positivo

% Exemplo:
% Um teste foi analisado para determinar precisão no diagnóstico de uma
% doença. O ministério da saúde indica que existe a probabilidade de 4% de
% um indivíduo possuir essa doença dados1 = dados do teste. 
% dados2 = dados da biópsia (comprovação da doença). condicao1 = 4%
% informado. PY_X = probabilidade de um indivíduo estar doente dado que o
% teste deu positivo. PY_X0 = probabilidade de um indivíduo estar doente dado que o
% teste deu negativo.

Sensibilidade = sum(dados1 == dados2 & dados1 == 1)/sum(dados2);
Especificidade = sum(dados1 == dados2 & dados1 == 0)/((length(dados1) - sum(dados2)));
PX_Y0 = sum(dados1 ~= dados2 & dados1 == 1)/((length(dados1) - sum(dados2)));
PX0_Y = sum(dados1 == 0 & dados1 ~= dados2)/(sum(dados2));

PY_X = (Sensibilidade*condicao1)/(Sensibilidade*condicao1+PX_Y0*(1- condicao1));
PY_X0 = (PX0_Y*condicao1)/((PX0_Y*condicao1)+Especificidade*(1- condicao1));


end