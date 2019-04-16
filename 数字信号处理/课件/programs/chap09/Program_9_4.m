% Program 9_4
% Group-delay equalization of an IIR filter.
%
[n,d] = ellip(4,1,35,0.3);
[GdH,w] = grpdelay(n,d,512);
plot(w/pi,GdH); grid
xlabel('\omega/\pi'); ylabel('Group delay, samples');
title('Original Filter');
pause
F = 0:0.001:0.3;
g = grpdelay(n,d,F,2);   % Equalize the passband
Gd = max(g)-g;
% Design the allpass delay equalizer
[num,den,tau] = iirgrpdelay(8, F, [0 0.3], Gd);
[GdA,w] = grpdelay(num,den,512);
plot(w/pi,GdH+GdA); grid
xlabel('\omega/\pi');ylabel('Group delay, samples');
title('Group Delay Equalized Filter');