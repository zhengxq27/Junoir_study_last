% Program 10_5
% Lowpass Filter Design Using the Kaiser Window
%
fpts = input('Type in the normalized bandedges in radians = ');
mag = input('Type in the desired magnitude values = ');
dev = input('Type in the ripples in each band = ');
[N,Wn,beta,ftype] = kaiserord(fpts,mag,dev)
%kw = kaiser(N+1,beta);
b = fir1(N,Wn,kaiser(N+1,beta));
[h,omega] = freqz(b,1,512);
plot(omega/pi,20*log10(abs(h)));grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');