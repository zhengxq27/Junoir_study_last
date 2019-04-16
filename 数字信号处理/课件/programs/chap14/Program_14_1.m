% Program 14_1
% Frequency Responses of Tree-Structured QMF Filters
%
clf;
% Type in prototype lowpass filter coefficients
% B1 = input ('Filter coefficients = ');
B1 = [0.002329266,-0.005182978,-0.002273145,0.01354012,-0.0006504669,-0.02755195,0.01004621,0.05088162,-0.03464143,-0.09987885,0.12464520,0.4686479]; 
% Test coefficients
B1 = [B1 fliplr(B1)];
% Generate the complementary highpass filter
L = length(B1);
for k = 1:L
 	B2(k) = ((-1)^k)*B1(k);
end
% Determine the coefficients of the four filters
B10 = zeros(1, 2*length(B1));
B10([1: 2: length(B10)]) = B1;
B11 = zeros(1, 2*length(B2));
B11([1: 2: length(B11)]) = B2;
C0 = conv(B1, B10);C1 = conv(B1, B11);
C2 = conv(B2, B10);C3 = conv(B2, B11);
% Determine the frequency responses
[H00z, w] = freqz(C0, 1, 256);% corrected
h00 = abs(H00z);
M00 = 20*log10(h00);
[H01z, w] = freqz(C1, 1, 256);
h01 = abs(H01z);
M01 = 20*log10(h01);
[H10z, w] = freqz(C2, 1, 256);
h10 = abs(H10z);
M10 = 20*log10(h10);
[H11z, w] = freqz(C3, 1, 256);
h11 = abs(H11z);
M11 = 20*log10(h11);
plot(w/pi, M00,'-',w/pi, M01,'--',w/pi, M10,'--',w/pi,M11,'-');%corrected
xlabel('\omega/\pi'); ylabel('Gain, dB');grid
axis([0,1,-150,10])
