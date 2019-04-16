% Program 4_3
% Generate the filter coefficients
h1 = ones(1,5)/5; h2 = ones(1,14)/14;
%  Compute the frequency responses
[H1,w] = freqz(h1, 1, 256);
[H2,w] = freqz(h2, 1, 256);
%  Compute and plot the magnitude responses
m1 = abs(H1); m2 = abs(H2);
plot(w/pi,m1,'r-',w/pi,m2,'b--');
ylabel('Magnitude'); xlabel('\omega/\pi');
legend('M=5','M=14');
pause
%  Compute and plot the phase responses
ph1 = angle(H1)*180/pi; ph2 = angle(H2)*180/pi;
plot(w/pi,ph1,w/pi,ph2);
ylabel('Phase, degrees');xlabel('\omega/\pi');
legend('M=5','M=14');