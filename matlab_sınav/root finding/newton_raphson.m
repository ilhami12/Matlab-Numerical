function newton_raphson
fprintf(' n |     x        |     fx      |   error \n')
fprintf([repmat('-',1, 44) '\n'])
x = 1.8 ;
n = 0;
e = Inf;
tol = 1e-4;
fprintf('%2.0f | %-+11.8f  | %-+11.8f | %-+6.4e\n', ...
    n, x , f(x), abs(f(x)))
%%loops
while e > tol && n<50
    x_next = x -f(x)/f_(x);
    x = x_next;
    e = abs(f(x));
    n = n+1 ;
    fprintf('%2.0f | %-+11.8f  | %-+11.8f | %-+6.4e\n', ...
    n, x , f(x), e)
end

