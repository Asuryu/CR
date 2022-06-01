clear all
close all

% Configuração da rede
net = feedforwardnet(10);
net.layers{1}.transferFcn = 'logsig';
net.trainFcn = "trainlm";
net.divideFcn = "";
net.trainParam.epochs = 1000;

pasta = "imagens\start\*\*.png";

[input, tamanho] = process_images(pasta);
target = gen_target(tamanho);

%[net, tr] = train(net, input, target);
%view(net);

% out = sim(net, input);
% plotconfusion(target, out);