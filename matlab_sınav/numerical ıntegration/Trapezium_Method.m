clc
clear
%%Trapezium Method for Solving Integrals Numericaly; 


f = @(x) (1-x.^4); %function we want to integrate
a = -1 ;%lower term of integral
b= 1; %higher term of the integral


n=4; % number of steps
dx = (b-a)/n; %the step size
S1 = f(a);
Sn = f(b);
Sab = 0;
for i = a+dx:dx:b-dx
    Sab = Sab + 2*f(i); % sum of all values from a to b except a and b.
end

I = (dx/2)*(S1 + Sab + Sn)
    