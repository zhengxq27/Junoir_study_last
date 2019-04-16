% Program 13_7
% Illustration of Sampling Rate Alteration by
% a Ratio of Two Integers
%
clf;
N = input('Length of input signal = ');
L = input('Up-sampling factor = ');
M = input('Down-sampling factor = ');
f1 = input('Frequency of first sinusoid = ');
f2 = input('Frequency of second sinusoid = ');
%  Generate the input sequence
n = 0:N-1;
x = sin(2*pi*f1*n) + sin(2*pi*f2*n);
%  Generate the resampled output sequence
y = resample(x,L,M);
%  Plot the input and the output sequences
subplot(2,1,1)
stem(n,x(1:N));
title('Input sequence');
xlabel('Time index n'); ylabel('Amplitude');
subplot(2,1,2)
m=0:N*L/M-1;
stem(m,y(uint8(1:N*L/M)));
title('Output sequence');
xlabel('Time index n'); ylabel('Amplitude');