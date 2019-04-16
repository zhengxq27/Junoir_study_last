%Program 6_3
% Partial-Fraction Expansion of Rational z-Transform
%
num = input('Type in numerator coefficients = ');
den = input('Type in denominator coefficients = ');
[r,p,k] = residuez(num,den);
disp('Residues');disp(r')
disp('Poles');disp(p')
disp('Constants');disp(k)