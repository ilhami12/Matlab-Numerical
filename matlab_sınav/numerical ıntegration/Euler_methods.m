clc
clear

f = @(x) (4-x.^2);

a = -2;
b = 2;

h = 1 ;

n = (b-a)/h ;


x = a:h:b;

% Forward Euler method
sum_FE = 0;
for i = 1:n
    sum_FE = sum_FE + h*f(x(i));
end
int_FE = sum_FE;

% Backward Euler method
sum_BE = 0;
for i = 1:n
    sum_BE = sum_BE + h*f(x(i+1));
end
int_BE = sum_BE;

% Trapezoidal method
sum_TR = 0;
for i = 1:n
    sum_TR = sum_TR + (h/2)*(f(x(i)) + f(x(i+1)));  
end
int_TR = sum_TR;

%  Simpson's 1/3 rule
sum_S13 = 0;
for i = 1:2:n-1
    sum_S13 = sum_S13 + (h/3)*(f(x(i)) + 4*f(x(i+1)) + f(x(i+2)));
end
int_S13 = sum_S13;

%  Simpson's 3/8 rule
sum_S38 = 0;
for i = 1:3:n-2
    sum_S38 = sum_S38 + (3*h/8)*(f(x(i)) + 3*f(x(i+1)) + 3*f(x(i+2)) + f(x(i+3)));
end
int_S38 = sum_S38;


fprintf('Forward Euler Method:   %f\n', int_FE);
fprintf('Backward Euler Method:  %f\n', int_BE);
fprintf('Trapezoidal Method:     %f\n', int_TR);
fprintf('Simpson''s 1/3 Method:   %f\n', int_S13);
fprintf('Simpson''s 3/8 Method:   %f\n', int_S38);