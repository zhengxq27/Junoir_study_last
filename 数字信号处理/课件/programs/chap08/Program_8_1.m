% Program 8_1
% Factorization of a Rational FIR Transfer Function
%
format long
num = input('Filter coefficient vector = ');
Numfactors = factorize(num);
disp('Factors'),disp(Numfactors)