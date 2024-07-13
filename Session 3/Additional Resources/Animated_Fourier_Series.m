# Program to create animation for increasing number of Fourier Series terms

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

x = linspace (-6, 6, 1000);
n=1;
figure(1);
z = g(x);
plot (x, f(x, n));
hold on;
plot (x, z);
grid on
for i = 2:1000
  pause(0.02);          # Loop to change number of terms and plot till 1000 terms
  clf;
  plot(x, f(x, i));
  hold on
  plot(x, z);
  grid on
  drawnow
endfor
