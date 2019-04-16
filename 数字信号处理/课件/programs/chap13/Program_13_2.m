% Program 13_2
% Illustration of Down-Sampling by an Integer Factor
%
clf;
N = input('Output length = ');
M = input('Down-sampling Factor = ');
fo = input('Input signal frequency = ');
% Generate the input sinusoidal sequence
n = 0 : N-1;
m = 0 : N*M-1;
x = sin(2*pi*fo*m);
% Generate the down-sampled sequence
y = x([1 : M : length(x)]);
% Plot the input and the output sequences
subplot(2,1,1)
stem(n, x(1:N));
title('Input Sequence');
xlabel('Time index n');ylabel('Amplitude');
subplot(2,1,2)
stem(n, y);
title(['Output sequence down-sampled by ',num2str(M)]);
ylabel('Amplitude');xlabel('Time index n');