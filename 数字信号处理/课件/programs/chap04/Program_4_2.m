% Program 4_2
% Illustration of Median Filtering
%
N = input('Median Filter Length = ');
R = 50; a = rand(1,R)-0.4;
b = round(a); % Generate impulse noise
m = 0:R-1;
s = 2*m.*(0.9.^m); % Generate signal
x = s + b; % Impulse noise corrupted signal
y = medfilt1(x,3); % Median filtering
subplot(2,1,1)
stem(m,x);axis([0 50 -1 8]);
xlabel('n');ylabel('Amplitude');
title('Impulse Noise Corrupted Signal');
subplot(2,1,2)
stem(m,y);
xlabel('n');ylabel('Amplitude');
title('Output of Median Filter');