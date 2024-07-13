# Program to plot Fourier Series vs original function for n terms of FS

clear all; close all; clc;

pi = 4.0 * atan (1.0); # obtain value of pi

function x = g(t)       # The actual function definition
  x = 2 * (mod(t, 2*pi) < pi) - 1;
endfunction


function x = f(t, n)
  x=0;                  # Fourier series with n terms definition
  for i = 0:n-1
    x += (4/pi)*sin((2*i+1)*t)/(2*i+1);
  endfor
endfunction

n = 1000;                  # Number of terms


x = linspace (-6, 6, 1000);
figure(1);
z = g(x);                 # Plotting the functions
plot (x, f(x, n));
hold on;
plot (x, z);
grid on
