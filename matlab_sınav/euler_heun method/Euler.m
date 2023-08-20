clear
clc

% Diferansiyel denklemin fonksiyonu
f = @(x, y) -x.^2;

% Parametreler
x0 = 0;     % Başlangıç noktası
y0 = 1;     % Başlangıç değeri
xf = 0.3;     % Bitiş noktası
h = 0.1;    % Adım boyutu

% Euler yöntemi ile sayısal çözümü elde etme
[x, y] = eulerMethod(f, x0, y0, xf, h);

% Sonuçları ekrana yazdırma
disp('Euler Yöntemi ile Sayısal Çözüm:');
disp('     x        y');
for i = 1:length(x)
    disp([x(i), y(i)]);
end
