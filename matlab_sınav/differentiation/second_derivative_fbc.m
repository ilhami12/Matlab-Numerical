clear;
clc;

clear;
clc;

f = @(x) x.^3;

x = 3;
h = 0.1;

% Forward difference
forward = (f(x+2*h) - 2*f(x+h) + f(x)) / h.^2;

% Backward difference
backward = (f(x-2*h) - 2*f(x-h) + f(x)) / h.^2;

% Centered difference
centered = (f(x+h) - 2*f(x) + f(x-h)) / h.^2;

% Richardson extrapolation
richardson = (4*centered - (f(x+2*h) - f(x-2*h)) / (2*h)) / 3;

% Actual value
actual = 6*x;

% Print results
fprintf('Forward difference: %.6f, Error: %.6f\n', forward, abs(forward - actual));
fprintf('Backward difference: %.6f, Error: %.6f\n', backward, abs(backward - actual));
fprintf('Centered difference: %.6f, Error: %.6f\n', centered, abs(centered - actual));
fprintf('Richardson extrapolation: %.6f, Error: %.6f\n', richardson, abs(richardson - actual));