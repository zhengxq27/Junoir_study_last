% Program 7_2
% Stability Test of a Rational Transfer Function
%
% Read in the polynomial coefficients
den = input('Type in the denominator coefficients =');
% Generate the stability test parameters
k = poly2rc(den);
knew = fliplr(k');
disp('The stability test parameters are');disp(knew);
stable = all(abs(k) < 1)