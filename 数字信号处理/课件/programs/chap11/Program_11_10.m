% Program 11_10
% Spectral Analysis Using the DFT
%
N = input('Type in the length of DFT = ');
Fs = input('Type in the sampling frequency = ');
T = 1/Fs;
freq = input('Type in the frequency of the sinusoid = ');
k = 0:N-1;
f = sin(2*pi*freq*k*T);
F = fft(f);
stem(k,abs(F));grid
xlabel('k');
ylabel('|X[k]|');