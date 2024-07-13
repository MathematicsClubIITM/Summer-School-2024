% note that notation has been used in the displayed plots
% y_Even = conjugate symmetric part of y
% y_Odd = conjugate skew-symmetric part of y
% y_Re = Re(y)   if y = Re(y) + j*Im(y)
% y_Im = j*Im(y) if y = Re(y) + j*Im(y)

% parameters to play around with

num_samples = 200;
x_l = -2;
x_r = 2;

% generating the time, frequency values

t = linspace(x_l, x_r - (x_r - x_l)/num_samples, num_samples);
wf = 2*pi/(x_r - x_l);
w = wf * (linspace(0, num_samples-1, num_samples)-ceil((num_samples-1)/2));

% generate the signal, the function generate_signal is defined at the end
% of the file

x_t = generate_signal(t);
x_mt = generate_signal(-t);

% calculate the necessary parts of the signal

x_re = real(x_t);
x_im = j*imag(x_t);
x_ev = (x_t + conj(x_mt)) * 0.5;
x_odd = (x_t - conj(x_mt)) * 0.5;

% calculate Fourier transform of the signals

f_w = fft(x_t);         % X(w)
f_mw = flip(f_w);       % X(-w)
f_mw(num_samples) = [];
f_mw = [f_w(1) f_mw];

f_x_re = fft(x_re);
f_x_im = fft(x_im);
f_x_ev = fft(x_ev);
f_x_odd = fft(x_odd);
f_ev = (f_w + conj(f_mw)) * 0.5;
f_odd = (f_w - conj(f_mw)) * 0.5;
f_re = real(f_w);
f_im = j*imag(f_w);

% fftshift the spectra

f_w = fftshift(f_w);
f_x_re = fftshift(f_x_re);
f_x_im = fftshift(f_x_im);
f_x_ev = fftshift(f_x_ev);
f_x_odd = fftshift(f_x_odd);
f_ev = fftshift(f_ev);
f_odd = fftshift(f_odd);
f_re = fftshift(f_re);
f_im = fftshift(f_im);

% display various plots

figure("Name", "Real part of x(t)");

subplot(4, 2, 1);
plot(t, real(x_re));
title("Real part of x_{Re}(t)");
xlabel("t");
ylabel("Re\{x_{Re}(t)\}");

subplot(4, 2, 2);
plot(t, imag(x_re));
title("Imaginary part of x_{Re}(t)");
xlabel("t");
ylabel("Im\{x_{Re}(t)\}");

subplot(4, 2, 3);
plot(w, round(real(f_x_re), 3));
title("Real part of F\{x_{Re}(t)\}");
xlabel("\omega");
ylabel("Re\{F\{x_{Re}(t)\}\}");

subplot(4, 2, 4);
plot(w, round(imag(f_x_re), 3));
title("Imaginary part of F\{x_{Re}(t)\}");
xlabel("\omega");
ylabel("Im\{F\{x_{Re}(t)\}\}");

subplot(4, 2, 5);
plot(w, round(real(f_ev), 3));
title("Real part of X_{Even}(\omega)");
xlabel("\omega");
ylabel("Re\{X_ev(\omega)\}");

subplot(4, 2, 6);
plot(w, round(imag(f_ev), 3));
title("Imaginary part of X_{Even}(\omega)");
xlabel("\omega");
ylabel("Im\{X_{Even}(\omega)\}");

subplot(4, 2, 7);
plot(w, round(real(f_x_re - f_ev), 3));
title("Real part of F\{x_{Re}(t)\} - X_{Even}(\omega)");
xlabel("\omega");
ylabel("Re\{Error Signal\}");

subplot(4, 2, 8);
plot(w, round(imag(f_x_re - f_ev), 3));
title("Imaginary part of F\{x_{Re}(t)\} - X_{Even}(\omega)");
xlabel("\omega");
ylabel("Im\{Error Signal\}");

figure("Name", "Imaginary part of x(t)");

subplot(4, 2, 1);
plot(t, real(x_im));
title("Real part of x_{Im}(t)");
xlabel("t");
ylabel("Re\{x_{Im}(t)\}");

subplot(4, 2, 2);
plot(t, imag(x_im));
title("Imaginary part of x_{Im}(t)");
xlabel("t");
ylabel("Im\{x_{Im}(t)\}");

subplot(4, 2, 3);
plot(w, round(real(f_x_im), 3));
title("Real part of F\{x_{Im}(t)\}");
xlabel("\omega");
ylabel("Re\{F\{x_{Im}(t)\}\}");

subplot(4, 2, 4);
plot(w, round(imag(f_x_im), 3));
title("Imaginary part of F\{x_{Im}(t)\}");
xlabel("\omega");
ylabel("Im\{F\{x_{Im}(t)\}\}");

subplot(4, 2, 5);
plot(w, round(real(f_odd), 3));
title("Real part of X_{Odd}(\omega)");
xlabel("\omega");
ylabel("Re\{X_{Odd}(\omega)\}");

subplot(4, 2, 6);
plot(w, round(imag(f_odd), 3));
title("Imaginary part of X_{Odd}(\omega)");
xlabel("\omega");
ylabel("Im\{X_{Odd}(\omega)\}");

subplot(4, 2, 7);
plot(w, round(real(f_x_im - f_odd), 3));
title("Real part of F\{x_{Im}(t)\} - X_{Odd}(\omega)");
xlabel("\omega");
ylabel("Re\{Error Signal\}");

subplot(4, 2, 8);
plot(w, round(imag(f_x_im - f_odd), 3));
title("Imaginary part of F\{x_{Im}(t)\} - X_{Odd}(\omega)");
xlabel("\omega");
ylabel("Im\{Error Signal\}");

figure("Name", "Even part of x(t)");

subplot(4, 2, 1);
plot(t, real(x_ev));
title("Real part of x_{Even}(t)");
xlabel("t");
ylabel("Re\{x_{Even}(t)\}");

subplot(4, 2, 2);
plot(t, imag(x_ev));
title("Imaginary part of x_{Even}(t)");
xlabel("t");
ylabel("Im\{x_{Even}(t)\}");

subplot(4, 2, 3);
plot(w, round(real(f_x_ev), 3));
title("Real part of F\{x_{Even}(t)\}");
xlabel("\omega");
ylabel("Re\{F\{x_{Even}(t)\}\}");

subplot(4, 2, 4);
plot(w, round(imag(f_x_ev), 3));
title("Imaginary part of F\{x_{Even}(t)\}");
xlabel("\omega");
ylabel("Im\{F\{x_{Even}(t)\}\}");

subplot(4, 2, 5);
plot(w, round(real(f_re), 3));
title("Real part of X_{Re}(\omega)");
xlabel("\omega");
ylabel("Re\{X_{Re}(\omega)\}");

subplot(4, 2, 6);
plot(w, round(imag(f_re), 3));
title("Imaginary part of X_{Re}(\omega)");
xlabel("\omega");
ylabel("Im\{X_{Re}(\omega)\}");

subplot(4, 2, 7);
plot(w, round(real(f_x_ev - f_re), 3));
title("Real part of F\{x_{Even}(t)\} - X_{Re}(\omega)");
xlabel("\omega");
ylabel("Re\{Error Signal\}");

subplot(4, 2, 8);
plot(w, round(imag(f_x_ev - f_re), 3));
title("Imaginary part of F\{x_{Even}(t)\} - X_{Re}(\omega)");
xlabel("\omega");
ylabel("Im\{Error Signal\}");

figure("Name", "Odd part of x(t)");

subplot(4, 2, 1);
plot(t, real(x_odd));
title("Real part of x_{Odd}(t)");
xlabel("t");
ylabel("Re\{x_{Odd}(t)\}");

subplot(4, 2, 2);
plot(t, imag(x_odd));
title("Imaginary part of x_{Odd}(t)");
xlabel("t");
ylabel("Im\{x_{Odd}(t)\}");

subplot(4, 2, 3);
plot(w, round(real(f_x_odd), 3));
title("Real part of F\{x_{Odd}(t)\}");
xlabel("\omega");
ylabel("Re\{F\{x_{Odd}(t)\}\}");

subplot(4, 2, 4);
plot(w, round(imag(f_x_odd), 3));
title("Imaginary part of F\{x_{Odd}(t)\}");
xlabel("\omega");
ylabel("Im\{F\{x_{Odd}(t)\}\}");

subplot(4, 2, 5);
plot(w, round(real(f_im), 3));
title("Real part of X_{Im}(\omega)");
xlabel("\omega");
ylabel("Re\{X_{Im}(\omega)\}");

subplot(4, 2, 6);
plot(w, round(imag(f_im), 3));
title("Imaginary part of X_{Im}(\omega)");
xlabel("\omega");
ylabel("Im\{X_{Im}(\omega)\}");

subplot(4, 2, 7);
plot(w, round(real(f_x_odd - f_im), 3));
title("Real part of F\{x_{Odd}(t)\} - X_{Im}(\omega)");
xlabel("\omega");
ylabel("Re\{Error Signal\}");

subplot(4, 2, 8);
plot(w, round(imag(f_x_odd - f_im), 3));
title("Imaginary part of F\{x_{Odd}(t)\} - X_{Im}(\omega)");
xlabel("\omega");
ylabel("Im\{Error Signal\}");

figure("Name", "Sketch of x(t)")

subplot(2, 1, 1);
plot(t, x_re);
title("Real part of x(t)");
xlabel("t");
ylabel("Re\{x(t)\}");

subplot(2, 1, 2);
plot(t, x_im/j);
title("Imaginary part of x(t)");
xlabel("t");
ylabel("Im\{x(t)\}");

function x = generate_signal(t)
x = cos(2*pi*t) + sin(3*pi*t)  + j*cos(5*pi*t) + j*sin(7*pi*t);
end