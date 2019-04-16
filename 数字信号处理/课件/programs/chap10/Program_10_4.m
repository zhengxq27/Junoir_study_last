% Program 10_4
% Kaiser Window Generation
%
fpts = input('Type in the normalized bandedges in radians = ');
mag = input('Type in the desired magnitude values = ');
dev = input('Type in the ripples in each band = ');
[N,Wn,beta,ftype] = kaiserord(fpts,mag,dev)
w = kaiser(N+1,beta); w = w/sum(w);
[h,omega] = freqz(w,1,256);
plot(omega/pi,20*log10(abs(h)));grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');