folder = "imagens/train/*/*.png";
[input, tamanho] = process_images(folder);
target = gen_target(tamanho);

net = feedforwardnet;

net.layers{1}.transferFcn = "logsig";
net.trainFcn = "trainlm";
net.divideFcn = "dividerand";

net.divideParam.trainRatio = 0.75;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;

net.trainParam.epochs = 1000;

[net, tr] = train(net, input, target);

nSim = 1;

accuracyFinal = 0;
for i=1 : nSim
    out = sim(net, input);
    plotconfusion(target, out);
    r = 0;
    for j=1 : size(out, 2)
        [a, b] = max(out(:,i));
        [c, d] = max(target(:,i));
        if(b == d) 
            r = r + 1;
        end
    end
    accuracy = r/size(out,2)*100;
    fprintf('Precisão total nos exemplos: %.3f\n', accuracy)
    accuracyFinal = accuracyFinal + accuracy;
end

accuracyFinalTeste = 0;
for i=1 : nSim
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

fprintf('\nMedia global final dos [Exemplos] depois de %i testes: %.3f\n', nSim, accuracyFinal/nSim);
fprintf('Media global final dos [Testes] depois de %i testes: %.3f\n', nSim, accuracyFinalTeste/nSim);