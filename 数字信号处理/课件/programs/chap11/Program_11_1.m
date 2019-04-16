% Program 11_1
% Impulse Response Computation
%
n = input('Impulse response length desired = ');
num = input('Numerator coefficients = ');
den = input('Denominator coefficients = ');
x = [1 zeros(1,n-1)];
order = max(length(num),length(den))-1;
si = [zeros(1,order)];
y = filter(num,den,x,si);
stem(y)
xlabel('Time index n'); ylabel('Amplitude');
title('Impulse response samples')