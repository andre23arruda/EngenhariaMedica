function conjuntoImagens = reconstructBrain(conjuntoImagens)
    info = conjuntoImagens{6};
    mriBrainPartition = conjuntoImagens{7};
    conect = conjuntoImagens{3};
    if isempty(mriBrainPartition)
        mriProcessed = im2uint8(conjuntoImagens{1});
        mid = int8(0.5 * size(mriProcessed,3));  % slice do meio
        figure;
        imshow(imadjust(mriProcessed(:,:,mid)));
        hold on;
        h = impoint;
        pos = getPosition(h);
        close;

        y = pos(2);
        mriProcessed(y:end,:,:) = 0; % Abaixo da coordenada de corte recebe zero

        lb = 75; % limiar inferior
        ub = 300; % limiar superior

        mriProcessed(mriProcessed <= lb) = 0;
        mriProcessed(mriProcessed >= ub) = 0;

        mriAdjust = mriProcessed;

        mriProcessed = logical(mriProcessed);
        nhood = ones([7,7,3]); % elemento usado para abertura é um cubo
        mriProcessed = imopen(mriProcessed,nhood); % abertura


        L1 = bwlabeln(mriProcessed); % agrupando os pixels pertencentes a mesma regiao
        stats = regionprops(L1,'Area'); 
        A = [stats.Area];
        biggerArea = find(A == max(A)); % encontrando a maior área, pois essa será a maior regiao que deve ser o crerebro
        mriAdjust(L1 ~= biggerArea) = 0; % regiao de mri que nao tiver maior area é descartado;
        level = 30;

        mriBrainPartition = uint8(zeros(size(mriAdjust)));
        mriBrainPartition(mriAdjust > 0 & mriAdjust < level) = 2;
        mriBrainPartition(mriAdjust >= level) = 3;
    end
    voxelSize = [info.PixelSpacing; info.SliceThickness]';

    Ds = imresize(mriBrainPartition,0.27,'nearest'); % proporcao do cerebro
    Ds = flip(Ds,1);
    Ds = flip(Ds,2);
    Ds = permute(Ds,[3,2,1]);

    voxelSize = voxelSize([1,3,2]).*[4,1,4];
    whiteVol = isosurface(Ds,0.5);
    
    %--------------------------------------
    DsConect = imresize(mriBrainPartition,0.27,'nearest'); % proporcao do cerebro
    Ds = flip(Ds,1);
    Ds = flip(Ds,2);
    Ds = permute(Ds,[3,2,1]);

    voxelSize = voxelSize([1,3,2]).*[4,1,4];
    whiteVol = isosurface(Ds,0.5);
    
    
    
    
    %-------------------------------------
    
    figure;
    patch(whiteVol,'FaceColor','r','EdgeColor','none','FaceAlpha',0.1);
    rotate3d('on');
    view(50 ,30);
    daspect(1./voxelSize);
    camlight;
    camlight(-80,-10);
    lighting phong;
    axis tight;
    
    conjuntoImagens{7} = mriBrainPartition;
    
end

