% Program 2
% Spectral Analysis of a Sum of Two Sinusoids
% Using the DFT
%
clf;
N = input('Signal length = ');
R = input('DFT length = ');
fr = input('Type in the sinusoid frequencies = ');
n = 0:N-1;
x = 0.5*sin(2*pi*n*fr(1)) + sin(2*pi*n*fr(2));
Fx = fft(x,R);
k = 0:R-1;
stem(k,abs(Fx));grid
xlabel('k'); ylabel('Magnitude');
title(['N = ',num2str(N),', R = ',num2str(R)]);
