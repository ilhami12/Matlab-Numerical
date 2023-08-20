clear
clc

x0 = 1;
x1 = 2;
x2 = 3;
f0 = 0;
f1 = -1;
f2 = 0;
b0 = f0
b1 = (f1-f0)/(x1-x0)
b2 = ((f2-f1)/(x2-x1)-(f1-f0)/(x1-x0))/(x2-x0)
x = linspace(x0-1/2,x2+1/2,1001);
fqx = b0 + b1*(x-x0)+b2*(x-x0).*(x-x1);
figure(1)
plot(x, fqx, "r", "LineWidth", 2)
grid on
hold on
plot([x0 x1 x2], [f0 f1 f2], "ko", "LineWidth", 2,...
"MarkerSize", 6,"HandleVisibility","off")
xlabel("x")
ylabel("f(x)")