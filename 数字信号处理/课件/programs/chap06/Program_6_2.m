% Program 6_2
% Determination of the Rational z-Transform
% from its Poles and Zeros
%
format long
zr = input('Type in the zeros as a row vector = ');
pr = input('Type in the poles  as a row vector = ');
% Transpose zero and pole row vectors
z = zr'; p = pr';
k = input('Type in the gain constant = ');
[num, den] = zp2tf(z, p, k);
disp('Numerator polynomial coefficients'); disp(num);
disp('Denominator polynomial coefficients'); disp(den);