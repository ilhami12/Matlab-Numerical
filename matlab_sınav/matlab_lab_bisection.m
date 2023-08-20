clear
clc
%% Plot the function to determine appropriate xl and xu
f = @(x) cos(x) - exp(x)*x;
fplot(@(x) cos(x).^2 - exp(-x)*sin(x).^2)
ylabel("f(x)")
hold on
%% We determine first root xl=0.5 xu=1.5
xl = 0; xu = 1;
plot(+1.032843, 0 , 'o', 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red')
%% Initialization
n = 0;
e = Inf;
tol = 1e-6 ;
xr=zeros(1,0);
fxr=zeros(1,0); 
%% Loop
fprintf(" n |   xr   \n")
fprintf([repmat('-', 1, 14) '\n'])
while e > tol
    if f(xl)*f(xu) > 0
        return
    else
        xr = [xr xl + (xu-xl)/2]; 
        fxr = [fxr f(xr(end))]; 
        fprintf("%2.0f | %+8.6f \n",n, xr(end))
       
        if f(xr(end))*f(xl) > 0
            xl= xr(end);
        else
            xu= xr(end);
        end
    end
    n=n+1;
    e = abs(f(xr(end)));  
end
%% Plot xr vs iteration number
figure
plot(0:length(xr)-2, xr(2:end), '-o')
xlabel('Iteration number')
ylabel('xr')
grid on
%% Plot |f(xr)| vs iteration number
figure
semilogy(0:length(fxr)-2, abs(fxr(2:end)), '-o')
xlabel('Iteration number')
ylabel('|f(xr)|')
grid on