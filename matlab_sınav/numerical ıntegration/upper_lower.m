
clc;
clear;
f = @(x) x*sin(x);

a = -2*pi;
b = 2*pi;

h = (4*pi)/16 ;

n = (b-a)/h ;

x = a:h:b;

%% Lower sum
low_sum = 0;
for i = 1:n
    low_sum = low_sum + f(x(i));
end
low_sum = h * low_sum;

%% Upper sum
up_sum = 0;
for i = 2:n+1
    up_sum = up_sum + f(x(i));
end
up_sum = h * up_sum;

fprintf('Lower sum: %f\n', low_sum);
fprintf('Upper sum: %f\n', up_sum);