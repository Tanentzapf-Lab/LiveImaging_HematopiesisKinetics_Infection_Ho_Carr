clear all; close all %% Clear workspace

folder = uigetdir;
files = dir([folder '\*.mat']);

name = inputdlg('Name');

dimIn = inputdlg('Heatmap Dimensions (Ex: 5)');
dim = str2double(dimIn); %% Dimension of heatmap

mat = zeros(dim, dim);
scale = (1/dim):(1/dim):1;
cat = categorical(scale);
ax = categories(cat);

for i=1: length(files)
    readmat = load(fullfile([folder '\' files(i).name]));
    mat = mat + readmat.matrix;
end

filename = strcat(name, ".xlsx");
writematrix(mat, filename);

figure(1)
map = heatmap(ax, flip(ax), mat);
map.Title = name;
map.Colormap = winter;