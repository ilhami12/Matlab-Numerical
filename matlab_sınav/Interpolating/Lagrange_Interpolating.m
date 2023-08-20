clear
clc


X = [-2 -1 1 2];
Y = [-6 0 0 6];


n = length(X);


L = zeros(n,n);


for i = 1:n
  
    L(i,1) = 1;
    for j = 1:n
        if j ~= i
            
            coeffs = conv(L(i,:), [1, -X(j)]);
            L(i,:) = coeffs(1:end-1) / (X(i) - X(j));
        end
    end
end

fn = zeros(1,n);
for i = 1:n
   
    num = Y(i) * L(i,:);
    den = polyval(L(i,:), X(i));
  
    fn = fn + num / den;
end

fprintf('L = \n');
disp(L);
fprintf('fn = \n');
disp(fn);

syms x;
lagrange_formula = 0;
for i = 1:n
    term = L(i, :) * Y(i) / polyval(L(i, :), X(i));
    lagrange_formula = lagrange_formula + term * prod(x - X([1:i-1, i+1:end]));
end

disp('Lagrange Formülü:');
disp(lagrange_formula);



clf
hold on
colors = ['b', 'g', 'r', 'm', 'k','c']; % renkler
for i = 1:n
    xi = linspace(min(X), max(X), 1000);
    yi = polyval(L(i,:), xi); 
    plot(xi, yi, colors(i)) 
    
end

xlabel('x')
ylabel('L_i(x)')
title('Cardinal Polynomials')
legend('L_0(x)', 'L_1(x)', 'L_2(x)', 'L_3(x)', 'L_4(x)', 'L_5(x)')
 


figure
hold on
xi = linspace(min(X), max(X), 1000);
yi = polyval(fn, xi);
plot(xi, yi)
scatter(X, Y)
xlabel('x')
ylabel('F_5(x)')
title('Lagrange Interpolation')