% Program 13_1
% Illustration of Up-Sampling by an Integer Factor
%
clf;
N = input('Input length = ');
L = input('Up-sampling Factor = ');
fo = input('Input signal frequency = ');
%  Generate the input sinusoidal sequence
n = 0:N-1;
x = sin(2*pi*fo*n);
% Generate the up-sampled sequence
y = zeros(1, L*length(x));
y([1: L: length(y)]) = x;
% Plot the input and the output sequences
subplot(2,1,1)
stem(n,x);
title('Input Sequence');
xlabel('Time index n');ylabel('Amplitude');
subplot(2,1,2)
stem(n,y(1:length(x)));
title(['Output sequence up-sampled by', num2str(L)]);
xlabel('Time index n');ylabel('Amplitude');