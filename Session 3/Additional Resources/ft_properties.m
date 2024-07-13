% parameters to play around with

num_samples = 100;
x_l = 0;
x_r = 1;
t0 = 1.2;

% generating the time, frequency values

t = linspace(x_l, x_r - (x_r - x_l)/num_samples, num_samples);
wf = 2*pi/(x_r - x_l);
w = wf * (linspace(0, num_samples-1, num_samples)-ceil((num_samples-1)/2));

% generate the signals

x = cos(2*pi*t);
x1 = cos(2*pi*(t-t0));

% calculate Fourier transform of the signals

f = fftshift(fft(x));
f1 = fftshift(fft(x1));

% remove errors due to discretisation of amplitudes
threshold = 1e-10;
for i = 1:num_samples
    if (abs(f(i)) < threshold)
        f(i) = 0;
    end
    if (abs(f1(i)) < threshold)
        f1(i) = 0;
    end
end

% use time shifting property of Fourier transform

f_shift = zeros(1, num_samples);
for i = 1:num_samples
    f_shift(i) = f(i)*exp(-j*t0*w(i));  
end
x_shift = ifft(ifftshift(f_shift));

% display various plots

figure("Name", "Time shifting property of Fourier Transforms");

subplot(3, 3, 1);
plot(t, x);
title("Plot of x(t)");
xlabel("t");
ylabel("x(t)");

subplot(3, 3, 2);
plot(t, x1);
title(strcat("Plot of x_1(t) = x(t-", num2str(t0), ")"));
xlabel("t");
ylabel("x_1(t)");

subplot(3, 3, 3);
plot(t, real(x_shift));
title(strcat("Plot of x_1'(t) = F^{-1}\{X(\omega)e^{-j\omega", num2str(t0), "}\}"));
xlabel("t");
ylabel("x_1'(t)");

subplot(3, 3, 4);
stem(w, abs(f));
title("Magnitude plot of X(\omega)");
xlabel("\omega");
ylabel("|X(\omega)|");

subplot(3, 3, 5);
stem(w, abs(f1));
title("Magnitude plot of X_1(\omega)");
xlabel("\omega");
ylabel("|X_1(\omega)|");

subplot(3, 3, 6);
stem(w, abs(f_shift));
title(strcat("Magnitude plot of X(\omega) e^{-j\omega", num2str(t0),"}"));
xlabel("\omega");
ylabel(strcat("|X(\omega) e^{-j\omega", num2str(t0),"}|"));

subplot(3, 3, 7);
stem(w, angle(f));
title("Phase plot of X(\omega)");
xlabel("\omega");
ylabel("\angleX(\omega)");

subplot(3, 3, 8);
stem(w, angle(f1));
title("Phase plot of X_1(\omega)");
xlabel("\omega");
ylabel("\angleX_1(\omega)");

subplot(3, 3, 9);
stem(w, angle(f_shift));
title(strcat("Phase plot of X(\omega) e^{-j\omega", num2str(t0),"}"));
xlabel("\omega");
ylabel(strcat("\angle X(\omega) e^{-j\omega", num2str(t0),"}"));

figure("Name", "Error signal for comparision");
stem(w, abs(f_shift - f1));
title(strcat("Plot of |X(\omega) e^{-j\omega", num2str(t0),"} - X_1(\omega)|"));
xlabel("\omega");
ylabel(strcat("|X(\omega) e^{-j\omega", num2str(t0),"} - X_1(\omega)|"));
