clear
clc

func = @(x) 1./x; 

% Spline interpolasyonu için kullanılacak düğem noktalarını ve değerlerini belirleyin
ti = [-1 0 1]; % Düğüm noktaları
yi = [1 0 1];%func(ti); % Düğüm noktalarındaki değerler

% z0 değerini belirleyin
z0 = 1;

% zs vektörünü başlangıç değeri olan z0 ile başlatın
zs = [z0];

% Quadratic spline fonksiyonlarını hesaplayın ve yazdırın
fprintf('Quadratic Spline Fonksiyonları:\n');
for i = 1:length(ti)-1
    % zi değerini hesaplayın
    zi = (-zs(i) + 2 * ((yi(i+1) - yi(i)) / (ti(i+1) - ti(i))));

    % zs vektörüne zi'yi ekleyin
    zs = [zs zi];

    % Quadratic spline fonksiyonunu oluşturun
    a = (1/2) * (zs(i+1) - zs(i)) / (ti(i+1) - ti(i));
    b = zs(i) - ti(i) * (zs(i+1) - zs(i)) / (ti(i+1) - ti(i));
    c = yi(i)+ (ti(i)^2) *(1/2) * (zs(i+1) - zs(i)) / (ti(i+1) - ti(i)) -zs(i)* ti(i);
    fprintf('Q%d(x) = %.4fx^2 + %.4fx + %.4f\n', i-1, a, b, c);
end

