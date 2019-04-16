% Program A_2
% Program to Design Butterworth Lowpass Filter
%
% Type in the filter order and passband edge frequency
N = input('Type in filter order = ');
Wn = input('3-dB cutoff angular frequency = ');
% Determine the transfer function
[num,den] = butter(N,Wn,'s');
%  Compute and plot the frequency response
omega = [0: 200: 12000*pi];
h = freqs(num,den,omega);
plot (omega/(2*pi),20*log10(abs(h)));
xlabel('Frequency, Hz'); ylabel('Gain, dB');