function [target] = gen_target(tamanho)

target = zeros(6, tamanho);
n = tamanho / 6;

linha = 1;

for i = 1 : tamanho
    target(linha, i) = 1;
    if rem(i, n) == 0
        linha = linha + 1;
    end
end

end