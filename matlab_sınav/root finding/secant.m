

function secant
%%Initialization
x = -0.5;
x_prev = -1;
n = 0;
e = 1;
tol = 1e-10;
fprintf('n |     x           |     fx   \n')
fprintf([repmat('-', 1, 39) '\n'])
fprintf('%2.0f | %-+14.10f | %-+14.10f \n',n ,x, f(x))
%%algorithm
while e>tol && n<50
    x_next = x - (f(x)*(x-x_prev))/(f(x)-f(x_prev));
    e = abs(f(x_next));
    x_prev =x;
    x = x_next;
    n=n+1;
    fprintf('%2.0f | %-+14.10f | %-+14.10f \n',n ,x, f(x))
end
