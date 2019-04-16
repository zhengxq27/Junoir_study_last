% Program 4
% Power Spectrum Estimation Using Welch's Method
%
n = 0:1000;
g = 2*sin(0.12*pi*n) + sin(0.28*pi*n) + randn(size(n));
nfft = input('Type in the fft size = ');
window = hamming(256);
noverlap =input('Type in the amount of overlap = ');
[Pxx, f] = psd(g,nfft,2,window,noverlap);
plot(f/2,10*log10(Pxx));grid
xlabel('\omega/\pi');ylabel('Power Spectrum, dB');
title(['Overlap = ',num2str(noverlap),' samples']);
