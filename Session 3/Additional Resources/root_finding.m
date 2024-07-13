clc;
clear;

eps = 1;    % error
x(1) = 12;  % initial guess

% main iteration loop
i = 2;
while eps > 0.000001
    x(i) = x(i-1) - f(x(i-1))/dfdx(x(i-1));
    eps = abs(x(i) - x(i - 1));
    i = i + 1;
end
x(i-1)

% plotting pretty stuff

X = -5 : 0.1 : 5;
grid on
plot(X, f(X))
hold on
stem(x, f(x))
hold off

% defining the functions f(x) and its derivative df_dx(x)

function [y] = f(x)
    y = x.^2 - x.^3 + 3.*x + 2;
end

function [y] = dfdx(x)
    y = 2*x - 3*x.^2 + 3;
end