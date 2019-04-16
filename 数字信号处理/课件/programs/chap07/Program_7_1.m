% Program 7_1
% Illustration of Deconvolution
%
Y = input('Type in the convolved sequence = ');
H = input('Type in the convolving sequence = ');
[X,R] = deconv(Y,H);
disp('Sequence x[n]');disp(X);
disp('Remainder Sequence r[n]');disp(R);