folder = "imagens/manuais/*/*.png";
image = "imagens/manuais/triangle/triangle-manual-0.png";
shapeLabel = ["Círculo" "Papagaio" "Paralelogramo" "Quadrado" "Trapézio" "Triângulo"];
shapeLabel = shapeLabel.';
input = process_images(folder);
image = process_images(image);

load("best_nn_c.mat", "net");
    
out = sim(net, image);
[M, i] = max(out);

fprintf('A imagem introduzida é considerada um %s com uma precisão de %.2f% ', upper(shapeLabel(i)), M * 100);