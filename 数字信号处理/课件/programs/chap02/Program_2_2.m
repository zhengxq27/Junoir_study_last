% Program 2_2
% Illustration of Convolution
%
a = input('Type in the first sequence = ');
b = input('Type in the second sequence = ');
c = conv(a, b);
M = length(c)-1;
n = 0:1:M;
disp('output sequence =');disp(c)
stem(n,c)
xlabel('Time index n'); ylabel('Amplitude');