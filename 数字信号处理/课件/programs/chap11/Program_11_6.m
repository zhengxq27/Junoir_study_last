% Program 11_6
% Illustration of Filtering by a Lowpass FIR Filter
%
% Determine the FIR filter coefficients
f = [0  0.3  0.5 1];
m = [1 1 0 0];
num = firpm(9,f,m);
% Generate the input sequence
k = 1:51;
w1 = 0.75*pi;w2 = 0.2*pi;
A = 1.5;B = 2.0;
x1 = A*cos(w1*(k-1)); x2 = B*cos(w2*(k-1));
x = x1+x2;
% Filter the input sequence
si = [zeros(1,9)];
y = filter(num,1,x,si);
% Plot the input and the output sequences
subplot(2,1,1)
stem(k-1,x);
xlabel('Time index n'); ylabel('Amplitude');
title('Input Sequence');
subplot(2,1,2)
stem(k-1,y);
xlabel('Time index n'); ylabel('Amplitude');
title('Output Sequence');