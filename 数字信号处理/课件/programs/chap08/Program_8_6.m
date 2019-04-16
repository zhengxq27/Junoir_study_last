% Program 8_6
% Transfer Function of Gray-Markel Cascaded
% Lattice Structure from the Lattice and
% Feedforward Parameters
% k1 is the lattice parameter vector
% alpha is the vector of feedforward multipliers
% den is the denominator coefficient vector
% num is the numerator coefficient vector
%
format long
% Read in the lattice and feedforward parameters
k1 = input('Lattice parameter vector = ');
alpha = input('Feedforward parameter vector = ');
[num,den] = latc2tf(k1,fliplr(alpha));
disp('Numerator coefficients are');disp(num)
disp('Denominator coefficients are');disp(den)