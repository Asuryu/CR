function [input, size] = process_images(folder)

directory = dir(folder);
size = length(directory);

for i = 1 : length(directory)
    % Read image
    img = imread(append(directory(i).folder, "/", directory(i).name));
    img = img(:,:,1);
    
    % Rezise image from 224px to 32px
    img = imresize(img, [32, 32]);
    
    % Convert image in binary matrix
    img = imbinarize(img);
    
    % Transforma a matriz numa coluna
    img = img(:);
    
    % Adiciona a coluna aos dados
    input(:, i) = img; 
end

end
