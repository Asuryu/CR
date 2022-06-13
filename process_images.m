function [input, size] = process_images(folder)

directory = dir(folder);
size = length(directory);

for i = 1 : length(directory)
    % Lê a imagem
    img = imread(append(directory(i).folder, "/", directory(i).name));
    img = img(:,:,1);
    
    % Redimensiona a imagem para 32px por 32px
    img = imresize(img, [32, 32]);
    
    % Converte a imagem para uma matriz binária
    img = imbinarize(img);
    
    % Transforma a matriz numa coluna
    img = img(:);
    
    % Adiciona a coluna aos dados
    input(:, i) = img; 
end

end
