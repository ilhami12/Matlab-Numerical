clear
clc

% Diferansiyel denklemin fonksiyonu
f = @(x, y) -x ;

% Parametreler
x0 = 0;     % Başlangıç noktası
y0 = 1;     % Başlangıç değeri
xf = 0.6;     % Bitiş noktası
h = 0.2;    % Adım boyutu

% Heun's yöntemi ile sayısal çözümü elde etme
[x, y] = heunsMethod(f, x0, y0, xf, h);

% Sonuçları ekrana yazdırma
disp("Heun's Yöntemi ile Sayısal Çözüm:");
disp('   x        y');
for i = 1:length(x)
    disp([x(i), y(i)]);
end