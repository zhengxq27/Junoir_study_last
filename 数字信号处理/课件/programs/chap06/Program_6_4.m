% Program 6_4
% Partial-Fraction Expansion to Rational z-Transform
%
r = input('Type in the residues = ');
p = input('Type in the poles = ');
k = input('Type in the constants = ');
[num, den] = residuez(r,p,k);
disp('Numerator polynomial coefficients'); disp(num)
disp('Denominator polynomial coefficients'); disp(den)