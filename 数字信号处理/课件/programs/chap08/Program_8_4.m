% Program 8_4
% Cascaded Lattice Realization of an
% Allpass Transfer Function
%
format long
den = input('Denominator coefficient vector = ');
k = poly2rc(den);
knew = fliplr(k);
disp('The lattice section multipliers are');disp(fliplr(knew'));