% Euler yöntemi ile sayısal çözüm
function [x, y] = eulerMethod(f, x0, y0, xf, h)
    n = round((xf - x0) / h);    % Adım sayısı
    x = zeros(1, n+1);           % x değerlerinin saklanacağı dizi
    y = zeros(1, n+1);           % y değerlerinin saklanacağı dizi
    x(1) = x0;
    y(1) = y0;

    for i = 1:n
        x(i+1) = x(i) + h;
        y(i+1) = y(i) + h * f(x(i), y(i));
    end
end

