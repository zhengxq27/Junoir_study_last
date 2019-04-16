% Program 9_1
% Elliptic IIR Lowpass Filter Design
%
Wp = input('Normalized passband edge = ');
Ws = input('Normalized stopband edge = ');
Rp = input('Passband ripple in dB = ');
Rs = input('Minimum stopband attenuation in dB = ');
[N,Wn] = ellipord(Wp,Ws,Rp,Rs)
[b,a] = ellip(N,Rp,Rs,Wn);
[h,omega] = freqz(b,a,256);
plot (omega/pi,20*log10(abs(h)));grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');
title('IIR Elliptic Lowpass Filter');