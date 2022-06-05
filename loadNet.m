function net = loadNet(type, transferFcn, trainFcn, divideFcn, epochs)
    
switch(type)
    case "Feedforward (10 neurónios)"
        net = feedforwardnet;
    case "Pattern (10 neurónios)"
        net = pattern;
    case "Fitting (10 neurónios)"
        net = fitting;
end

net.layers{1}.transferFcn = transferFcn;
net.trainFcn = trainFcn;
net.divideFcn = divideFcn;

net.trainParam.epochs = epochs;

end

