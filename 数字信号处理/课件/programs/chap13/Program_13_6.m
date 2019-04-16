% Program 13_6
% Illustration of Interpolation Process
%
clf;
N = input('Length of input signal = ');
L = input('Up-sampling factor = ');
f1 = input('Frequency of first sinusoid = ');
f2 = input('Frequency of second sinusoid = ');
% Generate the input sequence
n = 0:N-1;
x = sin(2*pi*f1*n) + sin(2*pi*f2*n);
% Generate the interpolated output sequence
y = interp(x,L);
% Plot the input and the output sequences
subplot(2,1,1)
stem(n,x(1:N));
title('Input sequence');
xlabel('Time index n'); ylabel('Amplitude');
subplot(2,1,2)
m=0:N*L-1;
stem(m,y(1:N*L));
title('Output sequence');
xlabel('Time index n'); ylabel('Amplitude');