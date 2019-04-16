% Program 8_5
% Realization of Gray-Markel Cascaded Lattice Structure
%
% den is the denominator coefficient vector
% num is the numerator coefficient vector
% k is the lattice parameter vector
% alpha is the vector of feedforward multipliers
%
format long
% Read in the transfer function coefficients
num = input('Numerator coefficient vector = ');
den = input('Denominator coefficient vector = ');
num = num/den(1);
den = den/den(1);
[k,alpha] = tf2latc(num,den);
disp('Lattice parameters are');disp(k');
disp('Feedforward multipliers are');disp(fliplr(alpha'));