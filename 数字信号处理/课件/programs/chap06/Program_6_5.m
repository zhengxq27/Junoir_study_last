% Program 6_5
% Power Series Expansion of a Rational z-Transform
%
% Read in the number of inverse z-transform coefficients to be computed
L = input('Type in the length of output vector = ');
% Read in the numerator and denominator coefficients of
% the z-transform
num = input('Type in the numerator coefficients = ');
den = input('Type in the denominator coefficients = ');
% Compute the desired number of inverse transform coefficients
[y,t] = impz(num,den,L);
disp('Coefficients of the power series expansion');
disp(y')