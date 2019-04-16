% Program 9_2
% Type 1 Chebyshev IIR Highpass Filter Design
%
Wp = input('Normalized passband edge = ');
Ws = input('Normalized stopband edge = ');
Rp = input('Passband ripple in dB = ');
Rs = input('Minimum stopband attenuation in dB = ');
[N,Wn] = cheb1ord(Wp,Ws,Rp,Rs);
[b,a] = cheby1(N,Rp,Wn,'high');
[h,omega] = freqz(b,a,256);
plot (omega/pi,20*log10(abs(h)));grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');
title('Type I Chebyshev Highpass Filter');