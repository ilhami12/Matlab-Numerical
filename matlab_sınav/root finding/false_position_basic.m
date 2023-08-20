clear
clc
%% Define the function and plot it
f = @(x) exp(-x) -x;
fplot(@(x) cos(x).^2 - exp(-x)*sin(x).^2)
ylabel("f(x)")
hold on
%% Determine appropriate xl and xu for the initial interval
plot(+1.032842, 0 , 'o', 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red')
xl = -1; xu = 2;
%% Initialize variables
n = 0;
e = Inf;
tol = 1e-6;
xr = zeros(1,0);
fxr = zeros(1,0);
%% Loop until convergence
fprintf(" n |   xr   \n")
fprintf([repmat('-', 1, 14) '\n'])
while e > tol
    if f(xl)*f(xu) > 0
        error('The function has the same sign at both endpoints. Please enter different endpoints.')
    else
        xr = [(xl*f(xu)-xu*f(xl))/(f(xu)-f(xl))];
        fxr = [fxr f(xr(end))];
        fprintf('%2.0f | %+8.6f \n',n, xr(end))
        if f(xr(end))*f(xu) >0
            xu = xr(end);
        else
            xl = xr(end);
        end
    end
    n = n+1;
    e = abs(f(xr(end)));
end
%% Plot xr vs iteration number
figure
plot(0:n, xr, '-o')
xlabel('Iteration number')
ylabel('xr')
grid on
%% Plot |f(xr)| vs iteration number
figure
semilogy(1:length(fxr), abs(fxr), '-o')
xlabel('Iteration number')
ylabel('|f(xr)|')
grid on