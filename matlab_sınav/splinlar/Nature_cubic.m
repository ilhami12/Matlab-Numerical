clear
clc

% İnterpolasyon için kullanılacak düğüm noktalarını ve değerlerini belirleyin
ti = [1 2 3 4]; % Düğüm noktaları
yi = [1 1/2 1/3 1/4]; % Düğüm noktalarındaki değerler

% Doğal kübik spline fonksiyonlarını hesaplayın ve yazdırın
fprintf('Natural Cubic Spline Fonksiyonları:\n');

n = length(ti) - 1; % Segment sayısı

% Spline katsayılarını hesaplayın
h = diff(ti);
zi = zeros(1, n+1);
bi = zeros(1, n);
bi(1)=1;
for i = 1:n
  bi(i) = yi(i+1)-yi(i);
end


for i = 2:n
    zi(i) = ((6*(bi(i)-bi(i-1)))-zi(i+1)-zi(i-1)) /4;
end

% Spline fonksiyonlarını yazdırın

for i = 1:length(ti)-1
    a = (zi(i+1)/(6*h(i))) - (zi(i)/(6*h(i)));
    b = (3*zi(i+1)*ti(i))/(6*h(i)) + (3*zi(i)*ti(i+1))/(6*h(i));
    c = 3*((zi(i+1)*ti(i)^2)/(6*h(i))) - 3*((zi(i)*ti(i+1)^2)/(6*h(i))) + ((yi(i+1)/h(i)) - (h(i)/6)*zi(i+1)) - ((yi(i)/h(i)) - (h(i)/6)*zi(i));
    d = -ti(i)^3*(zi(i+1)/(6*h(i))) + ti(i+1)^3*(zi(i)/(6*h(i))) -ti(i)*((yi(i+1)/h(i)) - (h(i)/6)*zi(i+1)) + ((yi(i)/h(i)) - (h(i)/6)*zi(i))*ti(i+1);
    fprintf('S%d(x) = %.4fx^3 + %.4fx^2 + %.4fx + %.4f\n', i-1, a, b, c, d);
    
end