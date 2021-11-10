clear all; close all %% Clear workspace

dimIn = inputdlg('Heatmap Dimensions (Ex: 5)');
dim = str2double(dimIn); %% Dimension of heatmap
scale = 1/dim; %% Convert range multiplier

folder = uigetdir;
files = dir([folder '\*.tif']);

list = {'Left', 'Right'};

for i=1: length(files)
    image = imread(fullfile([folder '\' files(i).name]));
    
    % Rotate
    figure(1)
    rectIm = imshow(image);
    sz = size(image);
    pos = [(sz(2)/4) + 0.5, (sz(1)/4) + 0.5, sz(2)/2, sz(1)/2];
    rectrot = drawrectangle('Rotatable', true, ...
    'DrawingArea', 'unlimited', 'Position', pos, 'FaceAlpha', 0);
    rectrot.Label = 'Rotate Rectangle to Rotate Image';
    addlistener(rectrot,'MovingROI', @(src,evt) rotateImage(src, evt, ...
        rectIm, image));
    
    % Hold for Rotation
    keyPress = 0;
    while (keyPress ~= 1)
        pause; 
        keyPress = get(gcf, 'CurrentKey'); 
        if strcmp(keyPress, 'return') 
            keyPress = 1;  
        else
            keyPress = 0; 
        end
    end
    imageR = getimage(rectIm);
    close()
    
    % Flip left/right
    figure(2)
    imshow(imageR)
    [align, ~] = listdlg('PromptString',...
    'Align Axis (Default: Left)','ListString', list);
    if(align == 2)
        imageR = flip(imageR, 2);
    end
    close()
    
    
    % Pick out the LG and event
    figure(3)
    imshow(imageR)
    select = roipoly();
    [x,y] = getpts();

    [minx, maxx, miny, maxy] = rangeSelect(select);
    
    rangex = maxx - minx;
    rangey = maxy - miny;
    
    xlims = (minx:(rangex*scale):maxx);
    ylims = (miny:(rangey*scale):maxy);
    
    matx = -1;
    maty = -1;
    
    for j = 1: length(xlims)
        if (x > xlims(j))
            matx = j;
        end
    end
    
    for k = 1: length(ylims)
        if (y > ylims(k))
            maty = k;
        end
    end
    
    matrix = zeros(dim);
    matrix(maty, matx) = 1;
    
    name = strcat(files(i).name, ".mat");
    
    save(name, "matrix");
    close()
end
