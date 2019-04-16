% Program 5
% Development of an AR Model of an FIR Filter
%
b = remez(13, [0 0.5 0.6 1], [1 1 0 0]);
[h,w] = freqz(b,1,512);
[d,E] = lpc(b,7);
[h1,w] = freqz(sqrt(E*length(b)),d,512);
plot(w/pi,abs(h),'-',w/pi,abs(h1),'--');
xlabel('\omega/\pi');ylabel('Magnitude');
