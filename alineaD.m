folder = "imagens/manuais/*/*.png";
image = "imagens/manuais/kite/kite-manual-2.png";
shapeLabel = ["Círculo" "Papagaio" "Paralelogramo" "Quadrado" "Trapézio" "Triângulo"];
shapeLabel = shapeLabel.';
input = process_images(folder);
image = process_images(image);

load("net.mat", "net");
    
out = sim(net, image);
[M, i] = max(out);

fprintf('A imagem introduzida é considerada um %s com uma precisão de %.2f% ', upper(shapeLabel(i)), M * 100);