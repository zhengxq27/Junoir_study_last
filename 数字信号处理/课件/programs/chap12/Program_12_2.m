% Program 12_2
% Coefficient Quantization Effects on the
% Frequency Response of a Cascade Form IIR Filter
%
clf;
[z,p,k] = ellip(5,0.4,50,0.4);
[b,a] = zp2tf(z,p,k);
[h,w] = freqz(b,a,512); g = 20*log10(abs(h));
sos = zp2sos(z,p,k);
sosq = a2dT(sos,5);
R1 = sosq(1,:); R2 = sosq(2,:); R3 = sosq(3,:);
b1 = conv(R1(1:3),R2(1:3)); bq = conv(R3(1:3),b1);
a1 = conv(R1(4:6),R2(4:6)); aq = conv(R3(4:6),a1);
[hq,w] = freqz(bq,aq,512); gq = 20*log10(abs(hq));
plot(w/pi,g,'b',w/pi,gq,'r:');grid
axis([0 1 -70 5]);
xlabel('\omega/\pi');ylabel('Gain, dB');
title('original - solid line, quantized - dashed line');