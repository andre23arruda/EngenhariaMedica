function [Objeto1,Objeto2,Contraste,wi,wh, tempo] = segmentar_pd(imagem)
% Função para segmentar a imagem analisada
% Objeto1: imagem segmentada binarizada
% Objeto2: matriz de conectividade antes da binarização
% tempo: duração do processo de segmentação
% imagem: imagem a ser segmentada
% região: Região retangular que deve ser segmentada e onde será plantada a
% semente 
pkg load image;
figure('units','normalized','Position',[0,0,1,0.94]);
imshow(imagem); %exibindo imagem
title('Selecione uma região através de dois pontos');
[crop, regiao] = imcrop; %selecionando a região de interesse
close;
tempo = tic;
cont = 1;

% Inicialização
Colunamin = round(regiao(1)); %Valor da coluna minima da regiao 
Colunamax = round(regiao(1) + regiao(3)); %Valor da coluna maxima da regiao 
Linhamin = round(regiao(2)); %// Valor da linha minima da regiao 
Linhamax = round(regiao(2) + regiao(4));%// Valor da linha maxima da regiao 

[M,N] = size(imagem); %// Tamanho da imagem carregada

Referencia = zeros(M,N);

ValoresRegiao = imagem(Linhamin:Linhamax, Colunamin:Colunamax); %selecionando os valores da região de interesse

semente = [floor((Linhamin+Linhamax)/2),floor((Colunamin + Colunamax)/2)]; %local da semente é o centro da região selecionada
linha = semente(1); %linha da semente
coluna = semente(2); %coluna da semente

mregiao_intensidade = mean2(0.5*(abs(imagem(linha,coluna) + ValoresRegiao))); %media intensidade da regiao
dregiao_intensidade = std2(0.5*(abs(imagem(linha,coluna) + ValoresRegiao))); %desvio intensidade da regiao

mregiao_homogeneidade = mean2(0.5*(abs(imagem(linha,coluna) - ValoresRegiao))); %media homogeneidade da regiao
dregiao_homogeneidade = std2(0.5*(abs(imagem(linha,coluna) - ValoresRegiao))); %desvio homogeneidade da regiao 

Afinidade=zeros(size(imagem)); %iniciando a matriz de afinidade
Afinidade(linha,coluna) = 1; %Afinidade da semente com ela mesma é 1

Conect=zeros(size(imagem)); %iniciando matriz de conectividade
Conect(linha,coluna) = 1; %conectividade da semente com ela mesma é 1

%fila de sementes possui 3 parametros (conectividade, linha do pixel, coluna do pixel)
Filaseed(1,:) = [1, linha,coluna]; %iniciando fila de sementes

Referencia(linha,coluna) = 1;

Adj = 1;
wi = zeros(size(imagem));
wh = zeros(size(imagem));

while(Filaseed(1,1) >= 0 && Conect(linha,coluna) >= 0.442 ); % Segmentação
    linha = Filaseed(1,2);
    coluna = Filaseed(1,3);  
    if ( coluna-1>=1 && Referencia(linha,coluna-1) == 0) 
        Hom(linha,coluna-1)= exp(-0.5*(((abs(imagem(linha,coluna)-imagem(linha,coluna-1)))-mregiao_homogeneidade)/dregiao_homogeneidade).^2); %// esquerda
        Int(linha,coluna-1)= exp(-0.5*((((0.5*abs(imagem(linha,coluna)+imagem(linha,coluna-1))))-mregiao_intensidade)/dregiao_intensidade).^2); %// esquerda
        
        wi(linha,coluna-1) = Int(linha,coluna-1)/(Int(linha,coluna-1)+Hom(linha,coluna-1));
        wh(linha,coluna-1) = 1-wi(linha,coluna-1);
        
        Afinidade(linha,coluna-1) = Adj*((wi(linha,coluna-1)*Hom(linha,coluna-1)+ wh(linha,coluna-1)*Int(linha,coluna-1)));
        Afinidade(linha,coluna-1) = min(Afinidade(linha,coluna-1),Conect(linha,coluna));
        
        Conect(linha,coluna-1) = Afinidade(linha,coluna-1);      
        cont = cont + 1;
        Filaseed(cont,:) = [Conect(linha,coluna-1),linha,coluna-1];
        Referencia(linha,coluna-1) = 1;
    end
    
    if(linha-1>=1 && Referencia(linha-1,coluna) == 0)
        Hom(linha-1,coluna)= exp(-0.5*(((abs(imagem(linha,coluna)-imagem(linha-1,coluna)))-mregiao_homogeneidade)/dregiao_homogeneidade).^2); %// inferior
        Int(linha-1,coluna)= exp(-0.5*((((0.5*abs(imagem(linha,coluna)+imagem(linha-1,coluna))))-mregiao_intensidade)/dregiao_intensidade).^2); %// inferior
        
        wi(linha-1,coluna) = Int(linha-1,coluna)/(Int(linha-1,coluna)+Hom(linha-1,coluna));
        wh(linha-1,coluna) = 1-wi(linha-1,coluna);
        
        Afinidade(linha-1,coluna) = Adj*((wi(linha-1,coluna)*Hom(linha-1,coluna)+ wh(linha-1,coluna)*Int(linha-1,coluna)));
        Afinidade(linha-1,coluna) = min(Afinidade(linha-1,coluna),Conect(linha,coluna));
        
        Conect(linha-1,coluna) = Afinidade(linha-1,coluna);
        cont = cont + 1;
        Filaseed(cont,:) = [Conect(linha-1,coluna),linha-1,coluna];
        Referencia(linha-1,coluna) = 1; 
    end
    
    if(coluna+1<=N && Referencia(linha,coluna+1) == 0)
        Hom(linha,coluna+1)= exp(-0.5*(((abs(imagem(linha,coluna)-imagem(linha,coluna+1)))-mregiao_homogeneidade)/dregiao_homogeneidade).^2); %// direita
        Int(linha,coluna+1)= exp(-0.5*((((0.5*abs(imagem(linha,coluna)+imagem(linha,coluna+1))))-mregiao_intensidade)/dregiao_intensidade).^2); %// direita
        
        wi(linha,coluna+1) = Int(linha,coluna+1)/(Int(linha,coluna+1)+Hom(linha,coluna+1));
        wh(linha,coluna+1) = 1-wi(linha,coluna+1);
        
        Afinidade(linha,coluna+1) = Adj*((wi(linha,coluna+1)*Hom(linha,coluna+1)+ wh(linha,coluna+1)*Int(linha,coluna+1)));
        Afinidade(linha,coluna+1) = min(Afinidade(linha,coluna+1),Conect(linha,coluna));
        
        Conect(linha,coluna+1) = Afinidade(linha,coluna+1);
        cont = cont + 1;
        Filaseed(cont,:) = [Conect(linha,coluna+1),linha,coluna+1];
        Referencia(linha,coluna+1) = 1;
    end
    
    if(linha+1<=M && Referencia(linha+1,coluna) == 0);
        Hom(linha+1,coluna)= exp(-0.5*(((abs(imagem(linha,coluna)-imagem(linha+1,coluna)))-mregiao_homogeneidade)/dregiao_homogeneidade).^2); %// superior
        Int(linha+1,coluna)= exp(-0.5*((((0.5*abs(imagem(linha,coluna)+imagem(linha+1,coluna))))-mregiao_intensidade)/dregiao_intensidade).^2); %// superior
        
        wi(linha+1,coluna) = Int(linha+1,coluna)/(Int(linha+1,coluna)+Hom(linha+1,coluna));
        wh(linha+1,coluna) = 1-wi(linha+1,coluna);
        
        Afinidade(linha+1,coluna) = Adj*((wi(linha+1,coluna)*Hom(linha+1,coluna)+ wh(linha+1,coluna)*Int(linha+1,coluna)));
        Afinidade(linha+1,coluna) = min(Afinidade(linha+1,coluna),Conect(linha,coluna));
        Conect(linha+1,coluna) = Afinidade(linha+1,coluna);
        
        cont = cont + 1;
        Filaseed(cont,:) = [Conect(linha+1,coluna),linha+1,coluna];
        Referencia(linha+1,coluna) = 1;
    end
    
    Filaseed(1,:) = [];
    Filaseed = sortrows(Filaseed,-1);
    
end

level = graythresh(im2uint8(Conect));
Objeto1 = im2uint8(im2bw(Conect,level));
Objeto2 = im2uint8(Conect);

%figure;
%imshow(Objeto1);
%title('Objeto Segmentado');


K = imadjust(imagem,[],[0.005 0.27]); %// Editando a imagem original para ficar bem fraquinho
Contraste = im2uint8(Objeto1 + im2uint8(K)); %// Somando os valores para mostrar onde está a possível esclerose
%figure;
%imshow(Contraste);
%title('Objeto segmentado com fundo');

tempo = toc(tempo); % Término da contagem de tempo

endfunction
