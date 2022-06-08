folder = "imagens/train/*/*.png";
imagemTeste = "imagens/start/circle/circle-start-4.png";
[input, tamanho] = process_images(folder);
target = gen_target(tamanho);

accuracyFinalTeste = 0;
accuracyFinalExemplos = 0;
nSim = 1;

for i=1 : nSim

    net = feedforwardnet;

    net.layers{1}.transferFcn = "tansig";
    net.layers{2}.transferFcn = "purelin";
    net.trainFcn = "trainlm";
    net.divideFcn = "dividerand";

    net.divideParam.trainRatio = 0.95;
    net.divideParam.valRatio = 0.025;
    net.divideParam.testRatio = 0.025;

    net.trainParam.epochs = 1000;

    [net, tr] = train(net, input, target);
    % save("best_nn.mat", "net");

    
    
    
    out = sim(net, input);
    plotconfusion(target, out);
    r=0;
    for i=1:size(out,2)               % Para cada classificacao  
      [a, b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
      [c, d] = max(target(:,i));       %d guarda a linha onde encontrou valor mais alto da saida desejada
      if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
          r = r+1;
      end
    end
    accuracy = r/size(out,2)*100;
    fprintf('Precisão total nos exemplos: %.3f\n', accuracy)
    %Soma para a média global
    accuracyFinalExemplos = accuracyFinalExemplos + accuracy;

    
    
    
    TInput = input(:, tr.testInd);
    TTargets = target(:, tr.testInd);
    out = sim(net, TInput);
    r = 0;
    for i=1 : size(tr.testInd,2)
      [a, b] = max(out(:,i));
      [c, d] = max(TTargets(:,i));
      if b == d
          r = r+1;
      end
    end
    accuracy = r/size(tr.testInd,2)*100;
    fprintf('Precisao total nos testes: %.3f\n', accuracy)
    accuracyFinalTeste = accuracyFinalTeste + accuracy;
end

fprintf('\nMédia global final dos [Exemplos] depois de %i testes: %.3f\n', nSim, accuracyFinalExemplos/nSim);
fprintf('Média global final dos [Testes] depois de %i testes: %.3f\n', nSim, accuracyFinalTeste/nSim);