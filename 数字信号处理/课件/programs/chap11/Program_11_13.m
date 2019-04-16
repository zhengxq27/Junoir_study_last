% Program 11_13
%  DFT Sample Computation Using CZT
%
n = 0:31;
x = sin(2*pi*11*n/64);
A = exp(i*2*pi*84/512);
V = exp(-i*2*pi/512);
XC = czt(x, 8, V, A);
disp('CFT Samples')
disp(abs(XC));