clc;
clear;

% parameters to play around with

T = 10;     % half of the x-limits
N = 1000;   % number of points

% sampling frequency
fs = N/T;

% generate an array of x-values
x = -T/2 : T/N : T/2;

% generate the signals
f_act = 1.5 * exp(-((x+4)*20).^2) + 3.5 * exp(-((x-2)*20).^2) + 2.5 * exp(-((x-1)*20).^2) - 2;
f_noisy = f_act + 0.5 * rand(1, N+1);

% get corresponding frequency list
w = (-fs/2 : fs/N : fs/2) .* (2 * pi);

% find fourier transform
fw = fftshift(fft(f_noisy));

% low pass filter

f_threshold = 30;
N_threshold = floor((f_threshold/fs) * N); 
for i = 1:(N/2 - N_threshold)
    fw(i) = 0;
end
for i = (N/2 + N_threshold):(N+1)
    fw(i) = 0;
end

% compute inverse fourier transform

f_denoised = ifft(ifftshift(fw));

% plot pretty stuff

subplot(3, 1, 1);
plot(x, f_act);
subplot(3, 1, 2);
plot(x, f_noisy);
subplot(3, 1, 3);
plot(x, f_denoised);
