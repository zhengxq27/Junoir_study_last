% Program 2_4
% Generation of real exponential sequence
%
a = input('Type in argument = ');
K = input('Type in the gain constant = ');
N = input ('Type in length of sequence = ');
n = 0:N;
x = K*a.^n;
stem(n,x);
xlabel('Time index n');ylabel('Amplitude');
title(['\alpha =  ',num2str(a)]);