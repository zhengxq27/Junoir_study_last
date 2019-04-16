% Program 12_1
% Coefficient Quantization Effects on the frequency
% response of a direct form IIR filter
clf;
[b,a] = ellip(5,0.4,50,0.4);
[h,w] = freqz(b,a,512);
g = 20*log10(abs(h));
% Truncate the filter coefficients to 5 bits
bq = a2dT(b,5); aq = a2dT(a,5);
[hq,w] = freqz(bq,aq,512);
gq = 20*log10(abs(hq));
plot(w/pi,g,'b',w/pi,gq,'r:');grid;
axis([0 1 -80 5]);
xlabel('\omega/\pi'); ylabel('Gain, dB');
title('original - solid line, quantized - dashed line');
pause
% The call to the ZPLANE function below sets the axes
% properties to those corresponding to a pole-zero plot.
zplane(b,a);
% The HOLD ON command retains the axes properties as they are
% and does not create new axes for the next plot.
hold on;
plotzp(bq,aq)