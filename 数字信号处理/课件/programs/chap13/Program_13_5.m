% Program 13_5
% Illustration of Decimation Process
%
clf;
N = input('Length of input signal = ');
M = input('Down-sampling factor = ');
f1 = input('Frequency of first sinusoid = ');
f2 = input('Frequency of second sinusoid = ');
n = 0:N-1;
% Generate the input sequence
x = sin(2*pi*f1*n) + sin(2*pi*f2*n);
% Generate the decimated output sequence
y = decimate(x,M,'fir');
% Plot the input and the output sequences
subplot(2,1,1)
stem(n,x(1:N));
title('Input sequence');
xlabel('Time index n');ylabel('Amplitude');
subplot(2,1,2)
m=0:N/M-1;
stem(m,y(1:N/M));
title('Output sequence');
xlabel('Time index n'); ylabel('Amplitude');