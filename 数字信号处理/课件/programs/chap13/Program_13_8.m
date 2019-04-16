% Program 13_8
% Design of Lth Band FIR Filter Using the
% Windowed Fourier Series Approach
%
N = input('Type in the filter order = ');
L = input('Type in the value of L = ');
n = -N/2:N/2;
% Generate the truncated impulse response of the ideal
% lowpass filter
b = sinc(n/L)/L;
% Generate the window sequence
win = hamming(N+1);
% Generate the coefficients of the windowed filter
c = b.*win';
% Plot the gain response of the windowed filter
[h,w] = freqz(c,1,512);
plot(w/pi,20*log10(abs(h)));grid
xlabel('\omega/\pi');ylabel('Gain, dB');
title(['L-th band Nyquist Filter, L = ',num2str(L),]);