% Program 12_3
% Coefficient Quantization Effects on the
% Frequency Response of a Direct Form FIR Filter
%
fpts = [0 0.5 0.55 1]; mag = [1 1 0 0];
b = remez(39,fpts,mag);
[h,w] = freqz(b,1,512); g = 20*log10(abs(h));
bq = a2dT(b,5);
[hq,w] = freqz(bq,1,512); gq = 20*log10(abs(hq));
plot(w/pi,g,'b',w/pi,gq,'r:');grid
axis([0 1 -60 5]);
xlabel('\omega/\pi');ylabel('Gain, dB');
title('original - solid line, quantized - dashed line');