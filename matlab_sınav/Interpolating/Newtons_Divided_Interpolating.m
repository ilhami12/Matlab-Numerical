clear
clc

% Verilen fonksiyonu hesapla
f = @(x) sin(x);

% İnterpolasyon düğümleri
x0 = 0;
x1 = pi/2;
x2 = pi;

% İnterpolasyon düğümlerindeki değerleri hesapla
f0 = f(x0);
f1 = f(x1);
f2 = f(x2);

% Newton'un bölünmüş farklar interpolasyon polinomları katsayılarını hesapla
b0 = f0;
b1 = (f1 - f0) / (x1 - x0);
b2 = ((f2 - f1) / (x2 - x1) - (f1 - f0) / (x1 - x0)) / (x2 - x0);

% Spline interpolasyonu hesapla
x_range = linspace(x0, x2, 1001);
fqx_spline = spline([x0, x1, x2], [f0, f1, f2], x_range);

% Grafik çizdirme
figure;
plot(x_range, fqx_spline, 'r--', 'LineWidth', 2); % Spline interpolasyonunu çizdir
hold on;
plot([x0, x1, x2], [f0, f1, f2], 'ko', 'LineWidth', 2, 'MarkerSize', 6); % Düğümleri işaretle
grid on;
legend('Spline Interpolasyon', 'Düğümler');
xlabel('x');
ylabel('f(x)');

% Katsayıları ekrana yazdırma
disp(['b0 = ', num2str(b0)]);
disp(['b1 = ', num2str(b1)]);
disp(['b2 = ', num2str(b2)]);