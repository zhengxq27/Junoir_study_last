% Program 13_3
% Effect of Up-Sampling in the Frequency Domain
% Use fir2 to create a bandlimited input sequence
freq = [0 0.45 0.5 1];
mag = [0 1 0 0];
x = fir2(99, freq, mag);
% Evaluate and plot the input spectrum
[Xz, w] = freqz(x, 1, 512);
plot(w/pi, abs(Xz)); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Input spectrum');
pause
% Generate the up-sampled sequence
L = input('Type in the up-sampling factor = ');
y = zeros(1, L*length(x));
y([1: L: length(y)]) = x;
% Evaluate and plot the output spectrum
[Yz, w] = freqz(y, 1, 512);
plot(w/pi, abs(Yz)); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Output spectrum');