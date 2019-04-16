% Program 2_3
% Generation of complex exponential sequence
%
a = input('Type in real exponent = ');
b = input('Type in imaginary exponent = ');
c = a + b*i;
K = input('Type in the gain constant = ');
N = input ('Type in length of sequence = ');
n = 1:N;
x = K*exp(c*n);%Generate the sequence
stem(n,real(x));%Plot the real part
xlabel('Time index n');ylabel('Amplitude');
title('Real part');
disp('PRESS RETURN for imaginary part');
pause
stem(n,imag(x));%Plot the imaginary part
xlabel('Time index n');ylabel('Amplitude');
title('Imaginary part');