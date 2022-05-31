clear all
close all

net = feedforwardnet;

images = dir("imagens\start\*\*.png");
images_binary = zeros(length(images), 1);

for i=1 : length(images)
    disp(append(images(i).folder, "\", images(i).name));
%     I = imread(append(images(i).folder, "\", images(i).name));
%     images_binary(i) = imbinarize(I);
end

figure
imshowpair(I,images_binary(4),'montage');