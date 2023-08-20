clear
clc

f = @(x) sin(5*x);

x = 0;

h = pi/30;

forward = (f(x+h) - f(x)) / h;

backward = (f(x) - f(x-h)) / h;

centered = (f(x+h) - f(x-h)) / (2*h);

richardson = (4*centered - (f(x+2*h) - f(x-2*h)) / (4*h)) / 3;

actual = 1/x;

fprintf('Forward difference: %.6f, Error: %.6f\n', forward, abs(forward - actual));
fprintf('Backward difference: %.6f, Error: %.6f\n', backward, abs(backward - actual));
fprintf('Centered difference: %.6f, Error: %.6f\n', centered, abs(centered - actual));
fprintf('Richardson extrapolation: %.6f, Error: %.6f\n', richardson, abs(richardson - actual));