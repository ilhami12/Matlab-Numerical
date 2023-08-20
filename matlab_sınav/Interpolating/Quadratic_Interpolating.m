clear
clc

% Veriler
x = [1 2 3 4 5]; % X değerleri
y = [10 15 5 20 25]; % Y değerleri

% Aralık
xi = 1.5; % İnterpole edilecek X değeri

% Kuadratik interpolasyon
yi = interp1(x, y, xi, 'spline');

% Sonuçları göster
fprintf('xi: %.2f, yi: %.2f\n', xi, yi);

% Grafik çizimi
plot(x, y, 'o', xi, yi, 'rs');
xlabel('X');
ylabel('Y');
title('Kuadratik Interpolasyon');
legend('Veriler', 'Interpole Edilen Nokta');