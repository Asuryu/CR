function [target] = gen_target(tamanho)

target = zeros(10, tamanho);
n = tamanho / 10;

linha = 1;

for i = 1 : tamanho
    target(linha, i) = 1;
    if rem(i, n) == 0
        linha = linha + 1;
    end
end

end