% Heun's yöntemi ile sayısal çözüm
function [x, y] = heunsMethod(f, x0, y0, xf, h)
    n = round((xf - x0) / h);    % Adım sayısı
    x = zeros(1, n+1);           % x değerlerinin saklanacağı dizi
    y = zeros(1, n+1);           % y değerlerinin saklanacağı dizi
    x(1) = x0;
    y(1) = y0;

    for i = 1:n
        k1 = h * f(x(i), y(i));
        k2 = h * f(x(i) + h, y(i) + k1);
        y(i+1) = y(i) + 0.5 * (k1 + k2);
        x(i+1) = x(i) + h;
    end
end