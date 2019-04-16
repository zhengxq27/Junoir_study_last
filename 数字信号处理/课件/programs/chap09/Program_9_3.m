% Program 9_3
% Design of IIR Butterworth Bandpass Filter
%
Wp = input('Passband edge frequencies = ');
Ws = input('Stopband edge frequencies = ');
Rp = input('Passband ripple in dB = ');
Rs = input('Minimum stopband attenuation = ');
[N,Wn] = buttord(Wp, Ws, Rp, Rs);
[b,a] = butter(N,Wn);
[h,omega] = freqz(b,a,256);
gain = 20*log10(abs(h));
plot (omega/pi,gain);grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');
title('IIR Butterworth Bandpass Filter');