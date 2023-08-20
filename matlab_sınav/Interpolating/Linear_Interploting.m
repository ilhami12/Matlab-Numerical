clear
clc

% Veriler
x = [1 2 3]; % X değerleri
y = [1 1/2 1/3]; % Y değerleri

% Aralık
xi = 1.5; % İnterpole edilecek X değeri

% Lineer interpolasyon
yi = interp1(x, y, xi, 'linear');

% Sonuçları göster
fprintf('xi: %.2f, yi: %.2f\n', xi, yi);

% Grafik çizimi
plot(x, y, 'o', xi, yi, 'rs');
xlabel('X');
ylabel('Y');
title('Lineer Interpolasyon');
legend('Veriler', 'Interpole Edilen Nokta');