function fixed_point
x = pi/4;
n = 0;
e = Inf;
fprintf(' n |        x       |      f(x)       |      g(x)    \n')
fprintf([repmat('-', 1, 60) '\n'])
[fx, gx] = y(x);
fprintf('%2.0f | %-+14.10f | %-+14.10f | %-+14.10f \n',n, x, fx, gx)
%%loops
while e > 1e-5 && n < 100
    n = n+1 ;
    [fx, gx]= y(x);
    x_next =gx;
    e = abs(x_next -x);
    x = x_next;
    [fx, ~] = y(x);
    fprintf('%2.0f | %-+14.10f | %-+14.10f | %-+14.10f \n',n, x, fx, gx)
   
end
