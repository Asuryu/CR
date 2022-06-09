folder = "imagens/test/*/*.png";
[input, tamanho] = process_images(folder);
target = gen_target(tamanho);

accuracyFinalExemplos = 0;
nSim = 1;

for i=1 : nSim

    % load("best_nn_b.mat", "net");
    load("best_nn_c.mat", "net");
    % [net, tr] = train(net, input, target);
    %save("best_nn_c.mat", "net");
    
    out = sim(net, input);
    plotconfusion(target, out);
    r=0;
    for i=1:size(out,2)
      [a, b] = max(out(:,i));
      [c, d] = max(target(:,i));
      if b == d
          r = r+1;
      end
    end
    accuracy = r/size(out,2)*100;
    fprintf('Precisão total nos exemplos: %.3f\n', accuracy)
    accuracyFinalExemplos = accuracyFinalExemplos + accuracy;

end

fprintf('\nMédia global final dos [Exemplos] depois de %i testes: %.3f\n', nSim, accuracyFinalExemplos/nSim);

% Resultado sem re-treinar a rede:                                              70.000%

% Resultado a re-treinar a rede só com os exemplos da pasta "start":            80.000%
% Resultado a re-treinar a rede só com os exemplos da pasta "train":            98.333%
% Resultado a re-treinar a rede só com os exemplos da pasta "test":             70.000%

% Resultado a re-treinar a rede com todas as imagens fornecidas (start):        80.000%
% Resultado a re-treinar a rede com todas as imagens fornecidas (train):        98.333%
% Resultado a re-treinar a rede com todas as imagens fornecidas (test):         70.000%