% Program 10_2
% Design of Equiripple Linear-Phase FIR Filters
%
format long
fedge = input('Band edges in Hz = ');
mval = input('Desired magnitude values in each band = ');
dev = input('Desired ripple in each band =');
FT = input('Sampling frequency in Hz = ');
[N,fpts,mag,wt] = remezord(fedge,mval,dev,FT);
b = firpm(N,fpts,mag,wt);
disp('FIR Filter Coefficients'); disp(b)
[h,w] = freqz(b,1,256);
plot(w/pi,20*log10(abs(h)));grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');