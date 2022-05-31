clear all
close all

net = feedforwardnet(10);
net.trainFcn = "trainlm";

images = dir("imagens\start\*\*.png");

for i=1 : length(images)
    I = imread(append(images(i).folder, "\", images(i).name));
    im = imresize(I,0.25);
    BIN = imbinarize(im);
    matriz{i} = BIN(:,:,1);
end