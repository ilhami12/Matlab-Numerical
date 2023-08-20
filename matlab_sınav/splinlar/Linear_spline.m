clear
clc

func = @(x) 1./x; 

a = 1; % Başlangıç noktası
b = 5; % Bitiş noktası

% Spline interpolasyonu için kullanılacak düğem noktalarını ve değerlerini belirleyin
ti = [1 2 3 4 5]; % Düğüm noktaları
yi = func(ti); % Düğüm noktalarındaki değerler

linear_spline_interpolation = @(x) interp1(ti, yi, x, 'linear');

x_plot = linspace(a, b, 1000);
y_plot = linear_spline_interpolation(x_plot);

figure;
plot(x_plot, y_plot, 'r', 'LineWidth', 2);
hold on;
scatter(ti, yi, 'ko', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Lineer Spline Interpolasyon');
legend('Spline', 'Verilen Noktalar');
grid on;

% Lineer spline fonksiyonlarını hesaplayın ve yazdırın
spline_functions = cell(length(ti)-1, 1);
fprintf('Lineer Spline Fonksiyonları:\n');
for i = 1:length(ti)-1
    s = @(x) (yi(i+1) - yi(i))/(ti(i+1) - ti(i)) * (x - ti(i)) + yi(i);
    spline_functions{i} = s;
    
    fprintf('S%d(x) = ', i-1);
    fprintf('%.4f', (yi(i+1) - yi(i))/(ti(i+1) - ti(i)));
    fprintf(' * (x - %.4f) + %.4f\n', ti(i), yi(i));
end


% Lineer spline fonksiyonlarını hesaplayın ve yazdırın
spline_functions = cell(length(ti)-1, 1);
fprintf('Lineer Spline Fonksiyonları:\n');
for i = 1:length(ti)-1
    s = @(x) (yi(i+1) - yi(i))/(ti(i+1) - ti(i)) * (x - ti(i)) + yi(i);
    spline_functions{i} = s;
    
    fprintf('S%d(%d) = %.4f\n', i-1, ti(i+1), s(ti(i+1)));
end
% Maksimum interpolasyon hatasını hesaplayın
emax_values = [];
for i = 1:length(ti)-1
    x_vals = linspace(ti(i), ti(i+1), 1000);
    y_true = func(x_vals); % Gerçek fonksiyon değerleri
    y_interp = spline_functions{i}(x_vals); % Spline interpolasyonu değerleri
    e_max = max(abs(y_true - y_interp));
    emax_values = [emax_values, e_max];
end

fprintf('Maksimum Interpolasyon Hataları:\n');
for i = 1:length(emax_values)
    fprintf('Interval %d-%d: %.4f\n', ti(i), ti(i+1), emax_values(i));
end