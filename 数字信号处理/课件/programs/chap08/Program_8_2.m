% Program 8_2
% Factorization of a Rational IIR Transfer Function
%
format short
num = input('Numerator coefficients = ');
den = input('Denominator coefficients = ');
Numfactors = factorize(num);
Denfactors = factorize(den);
disp('Numerator Factors'),disp(Numfactors)
disp('Denominator Factors'),disp(Denfactors)