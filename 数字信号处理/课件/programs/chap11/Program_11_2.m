% Program 11_2
% Illustration of Filtering by a Lowpass IIR Filter
%
% Generate the input sequence
k = 1:51;
w1 = 0.8*pi;w2 = 0.1*pi;
A = 1.5;B = 2.0;
x1 = A*cos(w1*(k-1)); x2 = B*cos(w2*(k-1));
x = x1+x2;
% Generate the output sequence by filtering the input
si = [0 0 0];
num = 0.0662272*[1 3 3 1];
den = [1 -0.9356142 0.5671269 -0.10159107];
y = filter(num,den,x,si);
% Plot the input and the output sequences
subplot(2,1,1);
stem(k-1,x); axis([0 50 -4 4]);
xlabel('Time index n'); ylabel('Amplitude');
title('Input sequence');
subplot(2,1,2);
stem(k-1,y); axis([0 50 -4 4]);
xlabel('Time index n'); ylabel('Amplitude');
title('Output sequence');