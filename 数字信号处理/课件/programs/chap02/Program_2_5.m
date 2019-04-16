% Program 2_5
% Computation of Cross-correlation Sequence
%
x = input('Type in the reference sequence = ');
y = input('Type in the second sequence = ');
% Compute the correlation sequence
n1 = length(y)-1; n2 = length(x)-1;
r = conv(x,fliplr(y));
k = (-n1):n2';
stem(k,r);
xlabel('Lag index'); ylabel('Amplitude');
v = axis;
axis([-n1 n2 v(3:end)]);